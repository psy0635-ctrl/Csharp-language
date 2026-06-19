using System;
using System.Windows.Forms;
using ACTMULTILIB_K;

namespace WindowsForms_0619
{
    public partial class Form1 : Form
    {
        // PLC 시뮬레이터와 통신하는 객체
        // 이걸로 연결(Open), 읽기(Read), 쓰기(Write), 종료(Close)를 함
        ActEasyIF control = new ActEasyIF();

        // 출력값 저장 (Y0 워드. 비트마다 실린더/리프트 신호)
        short output = 0;

        // 현재 자동운전 모드인지 여부 (true = 자동, false = 수동/대기)
        bool autoMode = false;

        // PLC 연결/종료 상태
        bool plcConnected = false;
        bool closing = false;

        // 마지막으로 PLC에 쓴 Y0 값. 같은 값을 매 틱 반복 전송하지 않기 위해 사용.
        short lastWrittenOutput = short.MinValue;

        const short Y_B_FORWARD = 0x0002;  // Y1
        const short Y_B_BACKWARD = 0x0004; // Y2
        const short Y_C_FORWARD = 0x0008;  // Y3
        const short Y_C_BACKWARD = 0x0010; // Y4
        const short Y_LIFTA_UP = 0x0020;   // Y5
        const short Y_LIFTA_DOWN = 0x0040; // Y6
        const short Y_LIFTB_UP = 0x0080;   // Y7, 실제 시뮬레이터에서 X8(리프트B 상승 완료)
        const short Y_LIFTB_DOWN = 0x0100; // Y8, 실제 시뮬레이터에서 X9(리프트B 하강 완료)

        // 자동 순환 상태머신 단계
        //  - 실린더가 물체를 리프트 위로 밀고,
        //    리프트센서(A/B)가 ON 되면 실린더 후진 후 리프트를 상/하강한다.
        enum AutoStep
        {
            HomeB = 0,
            HomeC = 1,
            ReadyLiftBUp = 2,
            PushToLiftB = 3,
            RetractBAfterDetect = 4,
            MoveLiftBDown = 5,
            ReadyLiftADown = 6,
            PushToLiftA = 7,
            RetractCAfterDetect = 8,
            MoveLiftAUp = 9
        }

        AutoStep autoStep = AutoStep.HomeB;

        // 타이머 재진입 방지 플래그
        //  - ActEasyIF(ReadDeviceBlock2/WriteDeviceBlock2)는 재진입에 안전하지 않음.
        //  - 모달 메시지 루프 등으로 timer1_Tick이 겹쳐 호출되면 라이브러리 내부
        //    상태가 깨져 NullReferenceException이 발생하므로, 한 번에 하나만 실행.
        bool ticking = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // PLC 논리 스테이션 번호 (반드시 Open() 전에 설정)
            control.ActLogicalStationNumber = 1;

            timer1.Interval = 250;      // ACT DLL 통신 안정성을 위해 너무 촘촘한 폴링은 피함
            timer1.Enabled = false;     // 연결 전에는 타이머 OFF
            button10.Enabled = false;   // 자동시작 막기
            button11.Enabled = false;   // 자동정지 막기
            SetManualButtons(false);    // 연결 전에는 수동 버튼 전부 잠금

            label1.Text = "모드: 대기";
        }

        //  연결 버튼 : PLC 시뮬레이터에 연결
        private void button9_Click(object sender, EventArgs e)
        {
            // Open() 반환값 0 = 연결 성공
            int openResult;
            try
            {
                openResult = control.Open();
            }
            catch
            {
                openResult = -1;
            }

            if (openResult == 0)
            {
                plcConnected = true;
                output = 0;
                lastWrittenOutput = short.MinValue;
                WriteY(0, true);          // 이전 실행에서 남은 출력 신호 초기화

                MessageBox.Show("연결되었습니다.");

                timer1.Enabled = true;      // 상태 표시용 타이머 ON (연결되면 항상 켜둠)
                button10.Enabled = true;    // 자동시작 가능
                button11.Enabled = true;    // 자동정지 가능
                button9.Enabled = false;    // 연결 버튼 비활성화(중복 연결 방지)
                SetManualButtons(true);     // 연결되면 수동 버튼 사용 가능

                label1.Text = "모드: 수동(대기)";
            }
            else
            {
                MessageBox.Show("연결 실패하였습니다.");
            }
        }

        //  자동운전 시작 버튼 : 자동 모드 ON
        private void button10_Click(object sender, EventArgs e)
        {
            autoMode = true;
            autoStep = AutoStep.HomeB; // 시작 시 실린더 원점 정렬부터 수행
            SetManualButtons(false);    // 자동운전 중에는 수동 조작 잠금
            // MessageBox는 모달 메시지 루프를 돌려 timer1_Tick을 재진입시키므로 사용하지 않음
            // (재진입 시 ActEasyIF 내부 상태가 깨져 NullReferenceException 발생)
            label1.Text = "모드: 자동운전 중";
        }

        //  자동운전 정지 버튼 : 자동 모드 OFF (연결은 유지)
        //  - 연결을 끊지 않으므로 상태 표시는 계속되고,
        //    수동 조작도 다시 가능해집니다.
        private void button11_Click(object sender, EventArgs e)
        {
            autoMode = false;
            WriteY(0);                   // 자동 출력 정지 후 수동 조작으로 전환
            SetManualButtons(true);     // 수동 조작 다시 허용
            label1.Text = "모드: 수동(대기)";
        }

        //  타이머 틱 : 일정 간격마다 자동 실행
        //   1) 센서를 읽어 GUI 상태를 항상 갱신
        //   2) 자동 모드일 때만 자동 시퀀스 실행
        private void timer1_Tick(object sender, EventArgs e)
        {
            // 재진입 방지: 이전 틱이 아직 PLC 통신 중이면 이번 틱은 건너뜀
            if (ticking || !plcConnected || closing) return;
            ticking = true;
            timer1.Stop();
            try
            {
                TickBody();
            }
            catch
            {
                // 통신 순간 오류로 앱 전체가 죽지 않도록 방어. 다음 틱에서 자동 복구.
            }
            finally
            {
                ticking = false;
                if (plcConnected && !closing)
                {
                    timer1.Start();
                }
            }
        }

        // 실제 센서 읽기 + 상태 표시 + 자동 시퀀스 본체
        private void TickBody()
        {
            // 1) 센서 읽기 (X0 워드 = 16비트 한 번에 읽음)
            int s;
            if (!TryReadSensors(out s))
            {
                label1.Text = "PLC 통신 대기/재시도 중";
                return;
            }

            // 센서 비트 분리
            bool bFwdDone = (s & 0x0004) != 0; // X02 B전진완료
            bool bBackDone = (s & 0x0008) != 0; // X03 B후진완료
            bool cFwdDone = (s & 0x0010) != 0; // X04 C전진완료(실제 동작 기준)
            bool cBackDone = (s & 0x0020) != 0; // X05 C후진완료(실제 동작 기준)
            bool liftAUp = (s & 0x0040) != 0; // X6  리프트A 상승완료
            bool liftADown = (s & 0x0080) != 0; // X7  리프트A 하강완료
            bool liftBUp = (s & 0x0100) != 0; // X8  리프트B 상승완료
            bool liftBDown = (s & 0x0200) != 0; // X9  리프트B 하강완료
            bool liftAOn = (s & 0x0400) != 0; // XA  리프트센서 A
            bool liftBOn = (s & 0x0800) != 0; // XB  리프트센서 B

            // 2) 상태 라벨 갱신 (자동/수동 항상)
            label2.Text = "리프트센서 A: " + (liftAOn ? "ON (감지)" : "OFF");
            label3.Text = "리프트센서 B: " + (liftBOn ? "ON (감지)" : "OFF");
            label4.Text = "B실린더: " + (bFwdDone ? "전진 완료" : bBackDone ? "후진 완료" : "동작 중");
            label5.Text = "C실린더: " + (cFwdDone ? "전진 완료" : cBackDone ? "후진 완료" : "동작 중");
            label6.Text = "리프트A: " + (liftAUp ? "상승 완료" : liftADown ? "하강 완료" : "동작 중");
            label7.Text = "리프트B: " + (liftBUp ? "상승 완료" : liftBDown ? "하강 완료" : "동작 중");

            // 3) 자동 모드: 물체 순환 상태머신
            //
            //  [핵심 원리]  실린더 전진으로 물체를 리프트까지 밀고,
            //  리프트센서(A=XA / B=XB)가 감지되면 실린더를 후진시킨 뒤
            //  해당 리프트를 상/하강시킨다.
            //
            //  순환 경로(사용자 요구 이미지와 동일):
            //    [B실린더 전진] → 우측 리프트B 센서 감지 → 리프트B 하강
            //    → [C실린더 전진] → 좌측 리프트A 센서 감지 → 리프트A 상승
            //    → 반복
            if (!autoMode) return;

            switch (autoStep)
            {
                // 0) B실린더 후진 원점 정렬
                case AutoStep.HomeB:
                    if (bBackDone)
                    {
                        autoStep = AutoStep.HomeC;
                        break;
                    }
                    WriteY(Y_B_BACKWARD);
                    label1.Text = "자동: B실린더 후진 원점";
                    break;

                // 1) C실린더 후진 원점 정렬
                case AutoStep.HomeC:
                    if (liftBOn && liftBDown) autoStep = AutoStep.ReadyLiftADown;
                    else if (liftBOn) autoStep = AutoStep.MoveLiftBDown;
                    else if (liftAOn && !liftAUp) autoStep = AutoStep.RetractCAfterDetect;
                    else if (cBackDone) autoStep = AutoStep.ReadyLiftBUp;
                    else
                    {
                        WriteY(Y_C_BACKWARD);
                        label1.Text = "자동: C실린더 후진 원점";
                    }
                    break;

                // 2) 우측 리프트B를 상단으로 올려 B실린더가 밀어온 물체를 받을 준비
                case AutoStep.ReadyLiftBUp:
                    if (liftBOn) autoStep = AutoStep.RetractBAfterDetect;
                    else if (liftBUp) autoStep = AutoStep.PushToLiftB;
                    else
                    {
                        WriteY(Y_LIFTB_UP);
                        label1.Text = "자동: 리프트B 상승(받기 준비)";
                    }
                    break;

                // 3) B실린더 전진 → 물체가 리프트B 위에 올라가 센서B가 켜질 때까지 밀기
                case AutoStep.PushToLiftB:
                    if (liftBOn) autoStep = AutoStep.RetractBAfterDetect;
                    else
                    {
                        WriteY(Y_B_FORWARD);
                        label1.Text = "자동: B실린더 전진(센서B 감지 대기)";
                    }
                    break;

                // 4) 센서B 감지 후 B실린더 후진(원위치)
                case AutoStep.RetractBAfterDetect:
                    if (bBackDone) autoStep = AutoStep.MoveLiftBDown;
                    else
                    {
                        WriteY(Y_B_BACKWARD);
                        label1.Text = "자동: B실린더 후진";
                    }
                    break;

                // 5) 센서B가 감지한 물체를 리프트B로 하강 운반
                case AutoStep.MoveLiftBDown:
                    if (liftBDown) autoStep = AutoStep.ReadyLiftADown;
                    else
                    {
                        WriteY(Y_LIFTB_DOWN);
                        label1.Text = "자동: 리프트B 하강";
                    }
                    break;

                // 6) 좌측 리프트A를 하단으로 내려 C실린더가 밀어온 물체를 받을 준비
                case AutoStep.ReadyLiftADown:
                    if (liftAOn) autoStep = AutoStep.RetractCAfterDetect;
                    else if (liftADown) autoStep = AutoStep.PushToLiftA;
                    else
                    {
                        WriteY(Y_LIFTA_DOWN);
                        label1.Text = "자동: 리프트A 하강(받기 준비)";
                    }
                    break;

                // 7) C실린더 전진 → 물체가 리프트A 위에 올라가 센서A가 켜질 때까지 밀기
                case AutoStep.PushToLiftA:
                    if (liftAOn) autoStep = AutoStep.RetractCAfterDetect;
                    else
                    {
                        WriteY(Y_C_FORWARD);
                        label1.Text = "자동: C실린더 전진(센서A 감지 대기)";
                    }
                    break;

                // 8) 센서A 감지 후 C실린더 후진(원위치)
                case AutoStep.RetractCAfterDetect:
                    if (cBackDone) autoStep = AutoStep.MoveLiftAUp;
                    else
                    {
                        WriteY(Y_C_BACKWARD);
                        label1.Text = "자동: C실린더 후진";
                    }
                    break;

                // 9) 센서A가 감지한 물체를 리프트A로 상승 운반 → 반복
                case AutoStep.MoveLiftAUp:
                    if (liftAUp) autoStep = AutoStep.ReadyLiftBUp;
                    else
                    {
                        WriteY(Y_LIFTA_UP);
                        label1.Text = "자동: 리프트A 상승";
                    }
                    break;
            }
        }

        // PLC X0 읽기. ACT DLL 내부 순간 오류가 앱 전체로 번지지 않게 한 곳에서 처리한다.
        private bool TryReadSensors(out int value)
        {
            value = 0;
            if (!plcConnected || closing) return false;

            try
            {
                short readValue;
                int result = control.ReadDeviceBlock2("X0", 1, out readValue);
                if (result != 0) return false;

                value = (int)(ushort)readValue;
                return true;
            }
            catch
            {
                return false;
            }
        }

        // PLC Y0 쓰기. 자동 순환에서는 매 단계 하나의 액추에이터만 구동하도록 워드 전체를 지정한다.
        // 같은 출력은 다시 쓰지 않아 ACT DLL 호출 횟수를 줄인다.
        private bool WriteY(short word, bool force = false)
        {
            if (!plcConnected) return false;
            if (closing && !force) return false;
            if (!force && word == lastWrittenOutput) return true;

            try
            {
                short writeValue = word;
                int result = control.WriteDeviceBlock2("Y0", 1, ref writeValue);
                if (result != 0) return false;

                output = word;
                lastWrittenOutput = word;
                return true;
            }
            catch
            {
                return false;
            }
        }

        //  공통 출력 함수 : 특정 비트는 ON, 반대 비트는 OFF
        //   - onBit  : 켤 비트 (예: B전진 0x0002)
        //   - offBit : 끌 비트 (예: B후진 0x0004)
        //   - 현재 Y0 값을 먼저 읽고 해당 비트만 바꾸므로
        //     다른 출력 신호는 그대로 유지됩니다.
        private void SetOutput(int onBit, int offBit)
        {
            // Y0를 다시 읽지 않고, 로컬 output 값을 직접 갱신한다.
            //  - 모든 Y 출력은 SetOutput만 거치므로 output 필드가 항상 실제 출력과 일치.
            //  - 매 틱 Y0를 read하면 통신 호출이 2배가 되고(재진입 위험↑),
            //    일부 환경에서 Y 디바이스 read가 불안정해 NullReferenceException을 유발.
            // ushort로 캐스팅해 부호 확장(sign extension) 없이 비트 연산
            ushort cur = (ushort)output;
            cur = (ushort)((cur | onBit) & ~offBit);
            WriteY((short)cur);
        }

        //  수동 버튼 활성/비활성 일괄 처리
        private void SetManualButtons(bool enabled)
        {
            button1.Enabled = enabled;  // B전진
            button2.Enabled = enabled;  // B후진
            button3.Enabled = enabled;  // C전진
            button4.Enabled = enabled;  // C후진
            button5.Enabled = enabled;  // 리프트A 상승
            button6.Enabled = enabled;  // 리프트A 하강
            button7.Enabled = enabled;  // 리프트B 상승
            button8.Enabled = enabled;  // 리프트B 하강
        }

        //  수동 조작 - B실린더
        private void button1_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_B_FORWARD, Y_B_BACKWARD, label4, "B실린더: 전진 명령");
        }
        private void button2_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_B_BACKWARD, Y_B_FORWARD, label4, "B실린더: 후진 명령");
        }

        //  수동 조작 - C실린더
        private void button3_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_C_FORWARD, Y_C_BACKWARD, label5, "C실린더: 전진 명령");
        }
        private void button4_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_C_BACKWARD, Y_C_FORWARD, label5, "C실린더: 후진 명령");
        }

        //  수동 조작 - 리프트 A (Y5 상승 / Y6 하강)
        private void button5_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTA_UP, Y_LIFTA_DOWN, label6, "리프트A: 상승 신호 ON");
        }
        private void button6_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTA_DOWN, Y_LIFTA_UP, label6, "리프트A: 하강 신호 ON");
        }

        //  수동 조작 - 리프트 B (Y8 상승 / Y7 하강)
        private void button7_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTB_UP, Y_LIFTB_DOWN, label7, "리프트B: 상승 신호 ON");
        }

        private void button8_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTB_DOWN, Y_LIFTB_UP, label7, "리프트B: 하강 신호 ON");
        }

        private void RunManualCommand(short onBit, short offBit, Label statusLabel, string statusText)
        {
            SetOutput(onBit, offBit);
            statusLabel.Text = statusText;
        }

        //  폼 종료 시 PLC 연결 해제
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            closing = true;
            autoMode = false;
            timer1.Stop();

            if (plcConnected)
            {
                WriteY(0, true);
            }

            try { control.Close(); } catch { }
            plcConnected = false;
        }
    }
}
