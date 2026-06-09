using ACTMULTILIB_K;   // PLC 통신 라이브러리
using System;
using System.Drawing;  // Image, Color 사용
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting; // Chart 사용

namespace WindowsForms_0605
{
    public partial class Form1 : Form
    {
        // ─────────────────────────────────────────────
        // 클래스 전체에서 사용하는 변수 (전역 변수)
        // ─────────────────────────────────────────────

        // PLC와 통신하는 객체
        // Open()으로 연결, Read/Write로 데이터 주고받음
        ActEasyIF control = new ActEasyIF();

        // 차트 X축 위치 (1초마다 1씩 증가)
        // 예: 1초=0, 2초=1, 3초=2 ...
        int graphIndex = 0;

        public Form1()
        {
            InitializeComponent(); // 디자이너에서 만든 컨트롤 불러오기
        }

        // ─────────────────────────────────────────────
        // 프로그램 시작 시 딱 한 번 실행되는 함수
        // ─────────────────────────────────────────────
        private void Form1_Load(object sender, EventArgs e)
        {
            // 실행 파일이 있는 폴더 경로 가져오기
            // 예: C:\study\Csharp-language\WindowsForms_0605\bin\Debug
            string 경로 = Application.StartupPath;

            // 시작할 때 후진 이미지를 PictureBox에 표시
            pictureBox1.Image = Image.FromFile(경로 + "\\cylinderoff.png");

            // 이미지가 PictureBox 크기에 맞게 자동으로 조절되도록 설정
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;

            // ── 차트 초기 설정 ──
            chart1.Series[0].ChartType = SeriesChartType.Line; // 선 그래프
            chart1.Series[0].BorderWidth = 2;                   // 선 두께
            chart1.Series[0].Color = Color.Blue;                // 선 색상

            chart1.ChartAreas[0].AxisY.Minimum = 0;    // Y축 최솟값
            chart1.ChartAreas[0].AxisY.Maximum = 100;  // Y축 최댓값
            chart1.ChartAreas[0].AxisY.Interval = 20;  // Y축 눈금 간격 (0,20,40,60,80,100)

            // 연결 전에는 전진/후진 버튼 클릭 못하게 막기
            // 연결도 안 됐는데 버튼 누르면 오류가 나기 때문
            btnForward.Enabled = false;
            btnBackward.Enabled = false;
        }

        // ─────────────────────────────────────────────
        // 연결 버튼 클릭 시 실행
        // ─────────────────────────────────────────────
        private void btnConnect_Click(object sender, EventArgs e)
        {
            // control.Open() : PLC 시뮬레이터에 연결 시도
            // 반환값 0 = 성공, 그 외 = 실패
            if (control.Open() == 0)
            {
                MessageBox.Show("연결되었습니다.");

                // 타이머 시작 → 1초마다 timer1_Tick 자동 실행
                timer1.Enabled = true;

                // 연결 성공 후 전진/후진 버튼 활성화
                btnForward.Enabled = true;
                btnBackward.Enabled = true;
            }
            else
            {
                MessageBox.Show("연결 실패하였습니다.");
            }
        }

        // ─────────────────────────────────────────────
        // 전진 버튼 클릭 시 실행
        // ─────────────────────────────────────────────
        private void btnForward_Click(object sender, EventArgs e)
        {
            // 0x01 << 1 = 0000 0010 (2진수)
            // Y01 비트를 켜서 PLC에 "전진해" 명령 전송
            // WriteDeviceBlock2("Y0", 1, ref value)
            //   "Y0" : 출력 주소
            //   1    : 1개 데이터 전송
            //   ref value : 보낼 값
            short value = 0x01 << 1; // Y01
            control.WriteDeviceBlock2("Y0", 1, ref value);
        }

        // ─────────────────────────────────────────────
        // 후진 버튼 클릭 시 실행
        // ─────────────────────────────────────────────
        private void btnBackward_Click(object sender, EventArgs e)
        {
            // 0x01 << 2 = 0000 0100 (2진수)
            // Y02 비트를 켜서 PLC에 "후진해" 명령 전송
            short value = 0x01 << 2; // Y02
            control.WriteDeviceBlock2("Y0", 1, ref value);
        }

        // ─────────────────────────────────────────────
        // 타이머 (1초마다 자동으로 실행)
        // 핵심 함수 - 센서 읽고 화면 업데이트
        // ─────────────────────────────────────────────
        private void timer1_Tick(object sender, EventArgs e)
        {
            // 센서값을 저장할 변수 (0으로 초기화)
            short sensor = 0;

            // PLC에서 X0 주소의 센서값 읽어오기
            // X0 주소에는 여러 센서 비트가 들어있음
            control.ReadDeviceBlock2("X0", 1, out sensor);

            // sensor & 0x04 : X02 비트만 확인 (전진 센서)
            // 0x04 = 0000 0100 (2진수)
            // & 연산으로 해당 비트만 추출해서 0이 아니면 ON 상태
            if ((sensor & 0x04) != 0)
            {
                // ── 전진 상태 감지 ──
                label1.Text = "전진"; // 라벨 텍스트 변경

                // PictureBox 이미지를 전진 이미지로 교체
                pictureBox1.Image = Image.FromFile(
                    Application.StartupPath + "\\cylinderon.png");

                // 차트 데이터가 50개 초과하면 제일 오래된 것 삭제
                // → 차트가 왼쪽으로 흘러가는 효과
                if (chart1.Series[0].Points.Count > 50)
                    chart1.Series[0].Points.RemoveAt(0);

                // 차트에 전진값(100) 추가
                chart1.Series[0].Points.AddXY(graphIndex, 100);

                // 차트 축 범위 자동 재계산
                chart1.ChartAreas[0].RecalculateAxesScale();
            }
            // sensor & 0x08 : X03 비트만 확인 (후진 센서)
            // 0x08 = 0000 1000 (2진수)
            else if ((sensor & 0x08) != 0)
            {
                // ── 후진 상태 감지 ──
                label1.Text = "후진";

                // PictureBox 이미지를 후진 이미지로 교체
                pictureBox1.Image = Image.FromFile(
                    Application.StartupPath + "\\cylinderoff.png");

                if (chart1.Series[0].Points.Count > 50)
                    chart1.Series[0].Points.RemoveAt(0);

                // 차트에 후진값(0) 추가
                chart1.Series[0].Points.AddXY(graphIndex, 0);

                chart1.ChartAreas[0].RecalculateAxesScale();
            }

            // 1초마다 X축 위치 1 증가
            // 이렇게 해야 시간 흐름에 따라 차트가 오른쪽으로 늘어남
            graphIndex++;
        }
    }
}