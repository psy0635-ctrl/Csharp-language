using ACTMULTILIB_K;
using System;
using System.Drawing;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace WindowsForms_0605
{
    public partial class Form1 : Form
    {
        ActEasyIF control = new ActEasyIF();
        int graphIndex = 0; // 그래프 X축 인덱스

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string 경로 = Application.StartupPath;

            // 처음엔 후진 이미지
            pictureBox1.Image = Image.FromFile(경로 + "\\cylinderoff.png");
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom;

            // 차트 설정
            chart1.Series[0].ChartType = SeriesChartType.Line;
            chart1.Series[0].BorderWidth = 2;
            chart1.Series[0].Color = Color.Blue;
            chart1.ChartAreas[0].AxisY.Minimum = 0;
            chart1.ChartAreas[0].AxisY.Maximum = 100;
            chart1.ChartAreas[0].AxisY.Interval = 20;

            // 연결 전엔 전진/후진 버튼 비활성화
            btnForward.Enabled = false;
            btnBackward.Enabled = false;
        }

        // 연결 버튼
        private void btnConnect_Click(object sender, EventArgs e)
        {
            if (control.Open() == 0)
            {
                MessageBox.Show("연결되었습니다.");
                timer1.Enabled = true;
                btnForward.Enabled = true;
                btnBackward.Enabled = true;
            }
            else
            {
                MessageBox.Show("연결 실패하였습니다.");
            }
        }

        // 전진 버튼
        private void btnForward_Click(object sender, EventArgs e)
        {
            short value = 0x01 << 1; // Y01
            control.WriteDeviceBlock2("Y0", 1, ref value);
        }

        // 후진 버튼
        private void btnBackward_Click(object sender, EventArgs e)
        {
            short value = 0x01 << 2; // Y02
            control.WriteDeviceBlock2("Y0", 1, ref value);
        }

        // 타이머 (1초마다 센서 읽기)
        private void timer1_Tick(object sender, EventArgs e)
        {
            short sensor = 0;
            control.ReadDeviceBlock2("X0", 1, out sensor);

            if ((sensor & 0x04) != 0)
            {
                // 전진 상태
                label1.Text = "전진";
                pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\cylinderon.png");
                if (chart1.Series[0].Points.Count > 50)
                    chart1.Series[0].Points.RemoveAt(0);
                chart1.Series[0].Points.AddXY(graphIndex, 100);
                chart1.ChartAreas[0].RecalculateAxesScale();
            }
            else if ((sensor & 0x08) != 0)
            {
                // 후진 상태
                label1.Text = "후진";
                pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\cylinderoff.png");
                if (chart1.Series[0].Points.Count > 50)
                    chart1.Series[0].Points.RemoveAt(0);
                chart1.Series[0].Points.AddXY(graphIndex, 0);
                chart1.ChartAreas[0].RecalculateAxesScale();
            }

            graphIndex++; // 매 틱마다 증가
        }
    }
}