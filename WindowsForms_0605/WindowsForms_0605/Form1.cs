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
            string 경로 = Application.StartupPath;
            pictureBox1.Image = Image.FromFile(경로 + "\\cylinderoff.png");
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;

            // 차트 초기 설정
            chart1.Series[0].ChartType = SeriesChartType.Line;
            chart1.Series[0].BorderWidth = 2;
            chart1.Series[0].Color = Color.Blue;

            chart1.ChartAreas[0].AxisY.Minimum = 0;
            chart1.ChartAreas[0].AxisY.Maximum = 100;
            chart1.ChartAreas[0].AxisY.Interval = 20;

            // ── 핵심: X축 자동조정 켜기 ──
            chart1.ChartAreas[0].AxisX.IsMarginVisible = false;
            chart1.ChartAreas[0].AxisX.Minimum = Double.NaN;
            chart1.ChartAreas[0].AxisX.Maximum = Double.NaN;

            btnForward.Enabled = false;
            btnBackward.Enabled = false;

        }

        // ─────────────────────────────────────────────
        // 연결 버튼 클릭 시 실행
        // ─────────────────────────────────────────────
        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (control.Open() == 0)
            {
                MessageBox.Show("연결되었습니다.");

                // 타이머 200ms로 설정 (1초는 너무 느림)
                timer1.Interval = 200;
                timer1.Enabled = true;

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
            // Y01 ON → 전진 명령
            short value = 0x01 << 1;
            control.WriteDeviceBlock2("Y0", 1, ref value);

            // 시뮬레이터 연동 안 될 경우 직접 UI 업데이트
            UIUpdate(true);

        }

        // ─────────────────────────────────────────────
        // 후진 버튼 클릭 시 실행
        // ─────────────────────────────────────────────
        private void btnBackward_Click(object sender, EventArgs e)
        {
            // Y02 ON → 후진 명령
            short value = 0x01 << 2;
            control.WriteDeviceBlock2("Y0", 1, ref value);

            // 시뮬레이터 연동 안 될 경우 직접 UI 업데이트
            UIUpdate(false);
        }
        private void UIUpdate(bool isForward)
        {
            string 경로 = Application.StartupPath;

            if (isForward)
            {
                label1.Text = "전진";
                pictureBox1.Image = Image.FromFile(경로 + "\\cylinderon.png");
            }
            else
            {
                label1.Text = "후진";
                pictureBox1.Image = Image.FromFile(경로 + "\\cylinderoff.png");
            }

            // 차트에 데이터 추가
            if (chart1.Series[0].Points.Count > 50)
                chart1.Series[0].Points.RemoveAt(0);

            chart1.Series[0].Points.AddXY(graphIndex, isForward ? 100 : 0);

            // ── 핵심: X축 범위를 현재 데이터 기준으로 갱신 → 흘러가는 효과 ──
            int count = chart1.Series[0].Points.Count;
            if (count > 1)
            {
                chart1.ChartAreas[0].AxisX.Minimum = chart1.Series[0].Points[0].XValue;
                chart1.ChartAreas[0].AxisX.Maximum = chart1.Series[0].Points[count - 1].XValue;
            }
        }

        // ─────────────────────────────────────────────
        // 타이머 (1초마다 자동으로 실행)
        // 핵심 함수 - 센서 읽고 화면 업데이트
        // ─────────────────────────────────────────────
        private void timer1_Tick(object sender, EventArgs e)
        {
            // 센서 읽기 시도 (작동하면 자동 연동, 안 되면 버튼 클릭으로 대체)
            short sensor = 0;
            int ret = control.ReadDeviceBlock2("X0", 1, out sensor);

            if (ret == 0 && sensor != 0)
            {
                if ((sensor & 0x04) != 0)       // X02 전진 센서
                    UIUpdate(true);
                else if ((sensor & 0x08) != 0)  // X03 후진 센서
                    UIUpdate(false);
            }

            // 1초마다 X축 위치 1 증가
            // 이렇게 해야 시간 흐름에 따라 차트가 오른쪽으로 늘어남
            graphIndex++;
        }

      
     
    }
}