using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_0522_1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // High 버튼 클릭 시 
            if (chart1.Series[0].Points.Count > 50)
                chart1.Series[0].Points.RemoveAt(0); 
            // 데이터 포인트가 50개를 초과하면 가장 오래된 데이터 포인트 제거

            chart1.Series[0].Points.AddXY(DateTime.Now.ToString(), 1);
            chart1.ChartAreas[0].RecalculateAxesScale();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // Low 버튼 클릭 시
            if (chart1.Series[0].Points.Count > 50)
                chart1.Series[0].Points.RemoveAt(0);
            // 데이터 포인트가 50개를 초과하면 가장 오래된 데이터 포인트 제거

            chart1.Series[0].Points.AddXY(DateTime.Now.ToString(), 0);
            chart1.ChartAreas[0].RecalculateAxesScale();
        }
    }
}
