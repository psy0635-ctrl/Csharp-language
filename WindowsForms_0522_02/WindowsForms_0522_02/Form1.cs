using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace WindowsForms_0522_02
{
    public partial class Form1 : Form
    {
        Random rand = new Random(); // 난수 생성기
        public Form1()
        {
            InitializeComponent();
        }

        // 차트 초기 설정
        private void chart1_Click(object sender, EventArgs e)
        {

        }

        private void Start_button_Click(object sender, EventArgs e)
        {
            timer1.Enabled = true; // 타이머 시작
        }

        private void End_button_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false; // 타이머 종료
        }

        // 타이머 이벤트 (100ms마다 실행)
        private void timer1_Tick(object sender, EventArgs e)
        {
            int value = rand.Next(0, 11); // 0~10 사이의 난수 생성

            chart1.Series[0].Points.AddXY(
               DateTime.Now.ToString("HH:mm:ss.fff"), value);
            // X축: 현재 시간(시:분:초.밀리초), Y축: 난수값 추가

            // 흘러가는 효과: 점이 100개 넘으면 앞에서부터 삭제
            if (chart1.Series[0].Points.Count > 100)
            {
                chart1.Series[0].Points.RemoveAt(0); // 가장 오래된 데이터 제거
            }
            chart1.ChartAreas[0].RecalculateAxesScale(); // 축 스케일 재계산
        }
       

    }
}
