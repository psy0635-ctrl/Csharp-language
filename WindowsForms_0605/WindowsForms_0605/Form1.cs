using ACTMULTILIB_K;       // 미쓰비시 PLC와 통신하는 외부 라이브러리
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;           // 파일 경로 처리용 (Path.Combine 등)
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting; // 차트 그리기용

namespace WindowsForms_0605
{
    public partial class Form1 : Form
    {
        // ─────────────────────────────────────────
        // PLC 통신 객체
        // ActEasyIF = 미쓰비시 PLC와 데이터를 주고받는 도구
        // ─────────────────────────────────────────
        ActEasyIF control = new ActEasyIF();

        // 실린더 이미지 파일 경로를 담아둘 변수
        string backImagePath;     // 후진(꺼진) 상태 이미지
        string forwardImagePath;  // 전진(켜진) 상태 이미지

        public Form1()
        {
            InitializeComponent(); // 폼에 배치한 버튼·라벨 등 UI 요소를 초기화
            this.Load += Form1_Load; // 폼이 화면에 뜰 때 Form1_Load 함수를 실행하도록 등록
        }

        // ─────────────────────────────────────────
        // 폼이 처음 열릴 때 딱 한 번 실행되는 함수
        // ─────────────────────────────────────────
        private void Form1_Load(object sender, EventArgs e)
        {
            // 실행 파일(.exe)이 있는 폴더에서 이미지 파일 경로를 만든다
            // Application.StartupPath = 현재 프로그램이 실행 중인 폴더 경로
            backImagePath = Path.Combine(Application.StartupPath, "cylinderoff.png");
            forwardImagePath = Path.Combine(Application.StartupPath, "cylinderon.png");

            // pictureBox1: 실린더 그림을 보여주는 영역
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage; // 이미지를 박스 크기에 맞게 늘림
            pictureBox1.ImageLocation = backImagePath;                  // 시작 이미지 = 후진 상태

            label1.Text = "초기상태"; // 상태 텍스트 초기값

            timer1.Enabled = false; // 아직 PLC에 연결 안 됐으니 타이머는 꺼둠
                                    // 타이머 = 일정 간격으로 PLC 센서를 자동으로 읽는 장치

            // ── 차트 초기화 ──────────────────────────
            chart1.Series.Clear(); // 혹시 남아있는 이전 데이터 지우기

            // Series = 차트에 그려질 데이터 선 한 줄
            Series series = new Series("실린더 상태");
            series.ChartType = SeriesChartType.Line; // 꺾은선 그래프로 설정
            chart1.Series.Add(series);               // 차트에 이 선을 추가

            // Y축(세로) 범위: 0(후진) ~ 1(전진)만 표시
            chart1.ChartAreas[0].AxisY.Minimum = 0;
            chart1.ChartAreas[0].AxisY.Maximum = 1;
            chart1.ChartAreas[0].AxisY.Interval = 1; // 눈금 간격 = 1
        }

        // ─────────────────────────────────────────
        // [연결] 버튼을 눌렀을 때 실행
        // ─────────────────────────────────────────
        private void btnConnect_Click(object sender, EventArgs e)
        {
            // control.Open() = PLC와 통신 시작
            // 반환값이 0이면 성공, 그 외는 실패
            if (control.Open() == 0)
            {
                MessageBox.Show("연결되었습니다.");
                timer1.Enabled = true;  // 연결 성공 → 타이머 시작 (센서 자동 읽기 시작)
            }
            else
            {
                MessageBox.Show("연결실패하였습니다.");
                timer1.Enabled = false; // 연결 실패 → 타이머 계속 꺼둠
            }
        }

        // ─────────────────────────────────────────
        // [전진] 버튼을 눌렀을 때 실행
        // ─────────────────────────────────────────
        private void btnForward_Click(object sender, EventArgs e)
        {
            // 0x01 << 1 = 비트를 왼쪽으로 1칸 밀기 = 0000 0010 = 2
            // PLC의 Y0 주소에 2를 써서 "전진하라"는 신호를 보냄
            // (각 비트가 각 출력 포트에 대응 — Y0의 1번 비트를 ON)
            short value = 0x01 << 1;
            control.WriteDeviceBlock2("Y0", 1, ref value);
            //                         ↑주소  ↑개수  ↑보낼값

            label1.Text = "전진";
            pictureBox1.ImageLocation = forwardImagePath; // 전진 이미지로 교체
        }

        // ─────────────────────────────────────────
        // [후진] 버튼을 눌렀을 때 실행
        // ─────────────────────────────────────────
        private void btnBackward_Click(object sender, EventArgs e)
        {
            // 0x01 << 2 = 비트를 왼쪽으로 2칸 밀기 = 0000 0100 = 4
            // Y0의 2번 비트를 ON → "후진하라"는 신호
            short value = 0x01 << 2;
            control.WriteDeviceBlock2("Y0", 1, ref value);

            label1.Text = "후진";
            pictureBox1.ImageLocation = backImagePath; // 후진 이미지로 교체
        }

        // ─────────────────────────────────────────
        // 타이머가 일정 간격마다 자동으로 호출하는 함수
        // PLC 센서 값을 읽고 화면을 업데이트함
        // ─────────────────────────────────────────
        private void timer1_Tick(object sender, EventArgs e)
        {
            short sensor = 0; // 센서 값을 담을 변수 (PLC에서 읽어온 비트 데이터)

            // X0 주소에서 1개 워드(16비트) 읽기
            // result = 0이면 읽기 성공, 그 외는 오류
            int result = control.ReadDeviceBlock2("X0", 1, out sensor);

            if (result != 0)
            {
                label1.Text = "센서 읽기 실패"; // 읽기 실패 시 표시만 하고 종료
                return;
            }

            // 차트에 데이터가 20개 넘으면 가장 오래된 것 삭제 (화면이 밀려가는 효과)
            if (chart1.Series[0].Points.Count > 20)
            {
                chart1.Series[0].Points.RemoveAt(0);
            }

            // ── 센서 비트 해석 ───────────────────────
            // sensor는 16비트 숫자. 각 비트가 각 센서에 대응
            // & (AND 연산) = 특정 비트만 확인하는 방법
            //
            // 0x04 = 0000 0100 → X0의 2번 비트 = "전진 완료" 센서
            if (((int)sensor & 0x04) != 0)
            {
                label1.Text = "전진";
                chart1.Series[0].Points.AddXY(DateTime.Now.ToString("HH:mm:ss"), 1); // Y값 1 = 전진
                pictureBox1.ImageLocation = forwardImagePath;
            }

            // 0x08 = 0000 1000 → X0의 3번 비트 = "후진 완료" 센서
            if (((int)sensor & 0x08) != 0)
            {
                label1.Text = "후진";
                chart1.Series[0].Points.AddXY(DateTime.Now.ToString("HH:mm:ss"), 0); // Y값 0 = 후진
                pictureBox1.ImageLocation = backImagePath;
            }
        }
    }
}