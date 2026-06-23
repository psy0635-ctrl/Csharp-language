using System;
using System.Windows.Forms;
using ACTMULTILIB_K;

namespace WindowsForms_0619
{
    public partial class Form1 : Form
    {
        // PLC 시뮬레이터랑 통신하는 객체
        ActEasyIF control = new ActEasyIF();

        short output = 0;       // 지금 Y0에 내보내는 값
        bool autoMode = false;  // 자동운전 중이면 true
        bool plcConnected = false;
        bool closing = false;   // 폼 닫는 중

        // 직전에 Y0에 쓴 값. 똑같으면 또 안 보내려고 기억해둠
        short lastWrittenOutput = short.MinValue;

        // Y 출력 비트
        const short Y_B_FORWARD = 0x0002;  // Y1 B전진
        const short Y_B_BACKWARD = 0x0004; // Y2 B후진
        const short Y_C_FORWARD = 0x0008;  // Y3 C전진
        const short Y_C_BACKWARD = 0x0010; // Y4 C후진
        const short Y_LIFTA_UP = 0x0020;   // Y5 리프트A 상승
        const short Y_LIFTA_DOWN = 0x0040; // Y6 리프트A 하강
        const short Y_LIFTB_UP = 0x0080;   // Y7 (시뮬에서 이게 리프트B 상승, 완료는 X8)
        const short Y_LIFTB_DOWN = 0x0100; // Y8 (시뮬에서 이게 리프트B 하강, 완료는 X9)

        // 자동운전 단계. 실린더로 밀어서 센서 감지되면 후진하고 리프트 올리고 내림
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

        // 타이머가 겹쳐 돌면 통신이 꼬여서 가끔 에러남. 한 번에 하나만 돌게 막는 용도
        bool ticking = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            control.ActLogicalStationNumber = 1; // 스테이션 번호 (Open 전에 세팅해야 함)

            timer1.Interval = 250;      // 너무 빨리 폴링하면 통신 불안정해서 좀 늘림
            timer1.Enabled = false;
            button10.Enabled = false;   // 자동시작
            button11.Enabled = false;   // 자동정지
            SetManualButtons(false);    // 연결 전엔 버튼 다 잠금

            label1.Text = "모드: 대기";
        }

        // 연결 버튼
        private void button9_Click(object sender, EventArgs e)
        {
            int openResult;
            try
            {
                openResult = control.Open(); // 0이면 연결 성공
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
                WriteY(0, true);          // 전에 켜져있던 출력 있으면 초기화

                MessageBox.Show("연결되었습니다.");

                timer1.Enabled = true;
                button10.Enabled = true;
                button11.Enabled = true;
                button9.Enabled = false;    // 또 누르지 못하게
                SetManualButtons(true);

                label1.Text = "모드: 수동(대기)";
            }
            else
            {
                MessageBox.Show("연결 실패하였습니다.");
            }
        }

        // 자동시작 버튼
        private void button10_Click(object sender, EventArgs e)
        {
            autoMode = true;
            autoStep = AutoStep.HomeB; // 처음엔 실린더 원점부터 맞추기
            SetManualButtons(false);   // 자동 중엔 수동 못 누르게
            // 여기서 MessageBox 띄우면 타이머가 겹쳐 돌면서 에러나서 라벨만 바꿈
            label1.Text = "모드: 자동운전 중";
        }

        // 자동정지 버튼 (연결은 그대로 두고 자동만 끔)
        private void button11_Click(object sender, EventArgs e)
        {
            autoMode = false;
            WriteY(0);                  // 출력 끄기
            SetManualButtons(true);     // 다시 수동 가능
            label1.Text = "모드: 수동(대기)";
        }

        // 타이머: 일정 간격마다 센서 읽어서 화면 갱신, 자동이면 시퀀스 진행
        private void timer1_Tick(object sender, EventArgs e)
        {
            // 앞 틱이 아직 통신 중이면 이번 건 그냥 넘김
            if (ticking || !plcConnected || closing) return;
            ticking = true;
            timer1.Stop();
            try
            {
                TickBody();
            }
            catch
            {
                // 통신 잠깐 튀어도 프로그램 안 죽게. 다음 틱에서 다시 시도됨
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

        private void TickBody()
        {
            // X0 한 워드(16비트) 읽기
            int s;
            if (!TryReadSensors(out s))
            {
                label1.Text = "PLC 통신 대기/재시도 중";
                return;
            }

            // 비트별 센서 상태
            bool bFwdDone = (s & 0x0004) != 0; // X02 B전진완료
            bool bBackDone = (s & 0x0008) != 0; // X03 B후진완료
            bool cFwdDone = (s & 0x0010) != 0; // X04 C전진완료
            bool cBackDone = (s & 0x0020) != 0; // X05 C후진완료
            bool liftAUp = (s & 0x0040) != 0; // X6 리프트A 상승완료
            bool liftADown = (s & 0x0080) != 0; // X7 리프트A 하강완료
            bool liftBUp = (s & 0x0100) != 0; // X8 리프트B 상승완료
            bool liftBDown = (s & 0x0200) != 0; // X9 리프트B 하강완료
            bool liftAOn = (s & 0x0400) != 0; // XA 리프트센서 A
            bool liftBOn = (s & 0x0800) != 0; // XB 리프트센서 B

            // 라벨에 현재 상태 표시 (자동/수동 둘 다)
            label2.Text = "리프트센서 A: " + (liftAOn ? "ON (감지)" : "OFF");
            label3.Text = "리프트센서 B: " + (liftBOn ? "ON (감지)" : "OFF");
            label4.Text = "B실린더: " + (bFwdDone ? "전진 완료" : bBackDone ? "후진 완료" : "동작 중");
            label5.Text = "C실린더: " + (cFwdDone ? "전진 완료" : cBackDone ? "후진 완료" : "동작 중");
            label6.Text = "리프트A: " + (liftAUp ? "상승 완료" : liftADown ? "하강 완료" : "동작 중");
            label7.Text = "리프트B: " + (liftBUp ? "상승 완료" : liftBDown ? "하강 완료" : "동작 중");

            if (!autoMode) return;

            // 자동운전 순서:
            // B실린더 전진 -> 리프트B 센서 감지 -> 리프트B 하강
            // -> C실린더 전진 -> 리프트A 센서 감지 -> 리프트A 상승 -> 반복
            switch (autoStep)
            {
                // B실린더 후진해서 원점 맞추기
                case AutoStep.HomeB:
                    if (bBackDone)
                    {
                        autoStep = AutoStep.HomeC;
                        break;
                    }
                    WriteY(Y_B_BACKWARD);
                    label1.Text = "자동: B실린더 후진 원점";
                    break;

                // C실린더 후진해서 원점 맞추기 (이미 물체 있으면 그 단계로 점프)
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

                // 리프트B 올려서 받을 준비
                case AutoStep.ReadyLiftBUp:
                    if (liftBOn) autoStep = AutoStep.RetractBAfterDetect;
                    else if (liftBUp) autoStep = AutoStep.PushToLiftB;
                    else
                    {
                        WriteY(Y_LIFTB_UP);
                        label1.Text = "자동: 리프트B 상승(받기 준비)";
                    }
                    break;

                // B실린더 전진해서 센서B 켜질 때까지 밀기
                case AutoStep.PushToLiftB:
                    if (liftBOn) autoStep = AutoStep.RetractBAfterDetect;
                    else
                    {
                        WriteY(Y_B_FORWARD);
                        label1.Text = "자동: B실린더 전진(센서B 감지 대기)";
                    }
                    break;

                // 센서B 감지됐으면 B실린더 후진
                case AutoStep.RetractBAfterDetect:
                    if (bBackDone) autoStep = AutoStep.MoveLiftBDown;
                    else
                    {
                        WriteY(Y_B_BACKWARD);
                        label1.Text = "자동: B실린더 후진";
                    }
                    break;

                // 리프트B 내려서 물체 옮기기
                case AutoStep.MoveLiftBDown:
                    if (liftBDown) autoStep = AutoStep.ReadyLiftADown;
                    else
                    {
                        WriteY(Y_LIFTB_DOWN);
                        label1.Text = "자동: 리프트B 하강";
                    }
                    break;

                // 리프트A 내려서 받을 준비
                case AutoStep.ReadyLiftADown:
                    if (liftAOn) autoStep = AutoStep.RetractCAfterDetect;
                    else if (liftADown) autoStep = AutoStep.PushToLiftA;
                    else
                    {
                        WriteY(Y_LIFTA_DOWN);
                        label1.Text = "자동: 리프트A 하강(받기 준비)";
                    }
                    break;

                // C실린더 전진해서 센서A 켜질 때까지 밀기
                case AutoStep.PushToLiftA:
                    if (liftAOn) autoStep = AutoStep.RetractCAfterDetect;
                    else
                    {
                        WriteY(Y_C_FORWARD);
                        label1.Text = "자동: C실린더 전진(센서A 감지 대기)";
                    }
                    break;

                // 센서A 감지됐으면 C실린더 후진
                case AutoStep.RetractCAfterDetect:
                    if (cBackDone) autoStep = AutoStep.MoveLiftAUp;
                    else
                    {
                        WriteY(Y_C_BACKWARD);
                        label1.Text = "자동: C실린더 후진";
                    }
                    break;

                // 리프트A 올려서 물체 옮기고 처음으로 돌아감
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

        // X0 읽기. 통신 에러나면 false 주고 다음 틱에 다시 시도
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

        // Y0 쓰기. 직전 값이랑 같으면 그냥 넘어가서 통신 횟수 줄임
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

        // onBit는 켜고 offBit는 끔. 나머지 출력은 그대로 둠
        private void SetOutput(int onBit, int offBit)
        {
            // Y0 다시 안 읽고 output 값으로 해당 비트만 바꿈
            // (ushort로 안 바꾸면 short 부호 때문에 비트연산이 이상해짐)
            ushort cur = (ushort)output;
            cur = (ushort)((cur | onBit) & ~offBit);
            WriteY((short)cur);
        }

        // 수동 버튼 한꺼번에 켜고 끄기
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

        // 수동 - B실린더
        private void button1_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_B_FORWARD, Y_B_BACKWARD, label4, "B실린더: 전진 명령");
        }
        private void button2_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_B_BACKWARD, Y_B_FORWARD, label4, "B실린더: 후진 명령");
        }

        // 수동 - C실린더
        private void button3_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_C_FORWARD, Y_C_BACKWARD, label5, "C실린더: 전진 명령");
        }
        private void button4_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_C_BACKWARD, Y_C_FORWARD, label5, "C실린더: 후진 명령");
        }

        // 수동 - 리프트A
        private void button5_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTA_UP, Y_LIFTA_DOWN, label6, "리프트A: 상승 신호 ON");
        }
        private void button6_Click(object sender, EventArgs e)
        {
            RunManualCommand(Y_LIFTA_DOWN, Y_LIFTA_UP, label6, "리프트A: 하강 신호 ON");
        }

        // 수동 - 리프트B
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

        // 폼 닫을 때 출력 끄고 연결 해제
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
