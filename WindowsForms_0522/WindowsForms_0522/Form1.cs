using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_0522
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DateTime CurretTime = DateTime.Now;
            // DateTime : 날짜+시간을 담는 그릇(자료형)
            // DateTime.Now : 지금 이 순간의 시간을 가져옴

            label1.Text = CurretTime.ToString("yyyy.MM.dd HH:mm:ss");
            // label1에 시간을 문자열로 변환해서 출력
            // 예시 → 2026.05.22 14:30:45
        }
        private void button2_Click(object sender, EventArgs e)
        {
            // 버튼2를 클릭하면 타이머가 시작하도록 설정
            timer1.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // 버튼3을 클릭하면 타이머가 멈추도록 설정
            timer1.Enabled = false;

            // 타이머 멈추면 pictureBox1의 이미지를 회색으로 변경
            pictureBox1.ImageLocation = "./led_gray.png";
            state = 0; // 타이머 멈추면 상태 초기화
        }

        int state = 0; // 0: 초기 상태, 1: 타이머 실행 중
        private void timer1_Tick(object sender, EventArgs e)
        {
            // 타이머 이벤트가 발생할 때마다 현재 시간을 가져와서 label1에 표시
            label1.Invoke(new MethodInvoker(delegate ()
            {
                DateTime CurretTime = DateTime.Now;
                label1.Text = CurretTime.ToString("yyyy.MM.dd HH:mm:ss");
            }));

            if (state == 0)
            {
                pictureBox1.Invoke(new MethodInvoker(delegate ()
                {
                    pictureBox1.ImageLocation = "./led_green.png";
                    state = 1;

                }));
            }
            else
            {
                pictureBox1.Invoke(new MethodInvoker(delegate ()
                {
                    pictureBox1.ImageLocation = "./led_gray.png";
                    state = 0;
                }));
            
            }
        }
    }
}
