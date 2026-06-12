using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ACTMULTILIB_K;

namespace WindowsForms_0612
{
    public partial class Form1 : Form
    {
      
        // 【전역 변수】 - 프로그램 전체에서 사용하는 변수들

        // PLC 시뮬레이터와 통신하는 객체
        // 이걸로 연결(Open), 읽기(Read), 쓰기(Write), 종료(Close)를 함
        ActEasyIF control = new ActEasyIF();

        // B실린더 출력값을 저장하는 변수 (전진/후진 명령을 PLC에 보낼 때 사용)
        short Bforward;

        // C실린더 출력값을 저장하는 변수
        short Cforward;

        // 센서 입력값을 저장하는 변수 (PLC에서 읽어온 센서 상태)
        short sensor = 0;

        // B실린더 동작 플래그: 0 = 대기중, 1 = 동작중
        // 센서가 꺼졌을 때 한 번만 후진 명령을 보내기 위해 사용
        int fb = 0;

        // C실린더 동작 플래그: 0 = 대기중, 1 = 동작중
        int fb1 = 0;


        public Form1()
        {
            InitializeComponent();
        }

        // 【Form1_Load】 - 프로그램 시작 시 딱 한 번 실행
        private void Form1_Load(object sender, EventArgs e)
        {
            // PLC 논리 스테이션 번호 설정 (반드시 Open() 전에 해야 함)
            // 시뮬레이터 설정과 일치해야 연결됨 (보통 1번)
            control.ActLogicalStationNumber = 1;

            // 연결 전에는 시작/정지 버튼을 클릭 못하게 막음
            // 연결도 안 됐는데 시작 누르면 오류가 나기 때문
            btnStart.Enabled = false;
            btnStop.Enabled = false;
        }

        // 【시작 버튼】 - 자동운전 시작 (타이머 ON)
        private void btnStart_Click(object sender, EventArgs e)
        {
            // 타이머를 켜면 timer1_Tick이 일정 간격으로 자동 실행됨
            // (타이머 간격은 디자이너에서 Interval 속성으로 설정, 보통 100~500ms)
            timer1.Enabled = true;
            MessageBox.Show("자동운전 시작");
        }

        // 【정지 버튼】 - 자동운전 정지 + 연결 해제
        private void btnStop_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false; // 타이머 끄기 → timer1_Tick 실행 중단
            control.Close();        // PLC 연결 해제

            btnConnect.Enabled = true;  // 다시 연결할 수 있도록 연결 버튼 활성화
            btnStart.Enabled = false;   // 연결 해제됐으니 시작 버튼 비활성화
            btnStop.Enabled = false;    // 연결 해제됐으니 정지 버튼 비활성화

            MessageBox.Show("자동운전 정지");
        }

        // 【타이머 틱】 - 일정 간격마다 자동 실행 (자동운전 핵심 로직)
        private void timer1_Tick(object sender, EventArgs e)
        {
            // X0 주소부터 1워드(16비트) 읽어서 sensor 변수에 저장
            // 리프트센서 A(XA), 리프트센서 B(XB) 상태가 여기 담김
            control.ReadDeviceBlock2("X0", 1, out sensor);

            // B실린더 제어 (리프트센서 A 기준: XA = 비트 0x400) //

            // 리프트센서 A가 ON (물건이 올라옴) → B실린더 전진
            if (((int)sensor & 0x0400) != 0)
            {
                control.ReadDeviceBlock2("Y0", 1, out Bforward); // 현재 Y출력값 읽기
                Bforward = (short)((Bforward | 0x02) & ~0x04);  // Y01 ON(전진), Y02 OFF(후진 끄기)
                control.WriteDeviceBlock2("Y0", 1, ref Bforward); // PLC에 출력값 쓰기
                fb = 1; // B실린더 동작 중으로 표시
            }
            // 리프트센서 A가 OFF + 동작 중이었으면 → B실린더 후진
            else if (((int)sensor & 0x0400) == 0 && fb == 1)
            {
                control.ReadDeviceBlock2("Y0", 1, out Bforward);
                Bforward = (short)((Bforward | 0x04) & ~0x02);  // Y02 ON(후진), Y01 OFF(전진 끄기)
                control.WriteDeviceBlock2("Y0", 1, ref Bforward);
                fb = 0; // B실린더 대기 중으로 표시
            }

            // C실린더 제어 (리프트센서 B: XB = 0x800) //

            // 리프트센서 B가 ON → C실린더 전진
            if (((int)sensor & 0x0800) != 0)
            {
                control.ReadDeviceBlock2("Y0", 1, out Cforward);
                Cforward = (short)((Cforward | 0x08) & ~0x10);  // Y03 ON(전진), Y04 OFF(후진 끄기)
                control.WriteDeviceBlock2("Y0", 1, ref Cforward);
                fb1 = 1; // C실린더 동작 중으로 표시
            }
            // 리프트센서 B가 OFF + 동작 중이었으면 → C실린더 후진
            else if (((int)sensor & 0x0800) == 0 && fb1 == 1)
            {
                control.ReadDeviceBlock2("Y0", 1, out Cforward);
                Cforward = (short)((Cforward | 0x10) & ~0x08);  // Y04 ON(후진), Y03 OFF(전진 끄기)
                control.WriteDeviceBlock2("Y0", 1, ref Cforward);
                fb1 = 0; // C실린더 대기 중으로 표시
            }
        }

        // 【연결 버튼】 - PLC 시뮬레이터에 연결
        private void btnConnect_Click(object sender, EventArgs e)
        {
            // control.Open() : PLC 시뮬레이터에 연결 시도
            // 반환값 0 = 연결 성공 / 그 외 숫자 = 연결 실패
            if (control.Open() == 0)
            {
                MessageBox.Show("연결되었습니다.");

                btnStart.Enabled = true;    // 연결 성공 → 시작 버튼 활성화
                btnStop.Enabled = true;     // 연결 성공 → 정지 버튼 활성화
                btnConnect.Enabled = false; // 이미 연결됐으니 연결 버튼 비활성화 (중복 연결 방지)
            }
            else
            {
                MessageBox.Show("연결 실패하였습니다.");
            }
        }

    }
}
