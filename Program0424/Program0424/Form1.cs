using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Program0424
{
    public partial class Form1 : Form
    {   // 경과 시간 저장 변수 (소수점 실수형)
        private double elapsedTime = 0;
        // 목표 시간: 9.99초
        private const double TARGET_TIME = 9.99;  

        public Form1()
        {
            InitializeComponent();
            InitializeUI(); 

            timer1.Interval = 5;
            timer1.Tick += timer1_Tick;

            button1.Click += button1_Click;
            button2.Click += button2_Click;
            button3.Click += button3_Click;
        }

        
        // UI 스타일 전체 설정 메서드
      
        private void InitializeUI()
        {
            // ── 폼 전체 ──
            this.Text = "STOPWATCH";
            this.BackColor = Color.FromArgb(13, 13, 13);   // 거의 검정
            this.ForeColor = Color.White;
            this.Size = new Size(420, 320);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;   // 크기 고정
            this.MaximizeBox = false;

            // ── textBox1 (경과시간 표시) ──
            textBox1.BackColor = Color.FromArgb(13, 13, 13);
            textBox1.ForeColor = Color.FromArgb(0, 255, 180);  // 네온 민트
            textBox1.BorderStyle = BorderStyle.None;
            textBox1.Font = new Font("Courier New", 32, FontStyle.Bold);
            textBox1.TextAlign = HorizontalAlignment.Center;
            textBox1.ReadOnly = true;
            textBox1.Text = "0.00초 경과";
            textBox1.Size = new Size(360, 60);
            textBox1.Location = new Point(25, 80);

            // ── label1 (서브 텍스트) ──
            label1.ForeColor = Color.FromArgb(100, 100, 100);   // 어두운 회색
            label1.Font = new Font("Courier New", 11, FontStyle.Regular);
            label1.Text = "0.00초 경과";
            label1.AutoSize = false;
            label1.Size = new Size(360, 25);
            label1.Location = new Point(25, 155);
            label1.TextAlign = ContentAlignment.MiddleCenter;

            // ── 버튼 공통 스타일 적용 ──
            StyleButton(button1, " START", Color.FromArgb(0, 255, 180), Color.Black);
            StyleButton(button2, "PAUSE", Color.FromArgb(30, 30, 30), Color.White);
            StyleButton(button3, "RESET", Color.FromArgb(30, 30, 30), Color.White);

            // ── 버튼 위치 / 크기 ──
            button1.Size = new Size(110, 45);
            button1.Location = new Point(25, 210);

            button2.Size = new Size(110, 45);
            button2.Location = new Point(155, 210);

            button3.Size = new Size(110, 45);
            button3.Location = new Point(285, 210);
        }

        // 버튼 스타일을 일괄 적용하는 헬퍼 메서드
      
        private void StyleButton(Button btn, string text, Color backColor, Color foreColor)
        {
            btn.Text = text;
            btn.BackColor = backColor;
            btn.ForeColor = foreColor;
            btn.FlatStyle = FlatStyle.Flat;                          // 테두리 플랫
            btn.FlatAppearance.BorderColor = Color.FromArgb(60, 60, 60);
            btn.FlatAppearance.BorderSize = 1;
            btn.FlatAppearance.MouseOverBackColor = Color.FromArgb(50, 50, 50);
            btn.FlatAppearance.MouseDownBackColor = Color.FromArgb(0, 200, 140);
            btn.Font = new Font("Courier New", 10, FontStyle.Bold);
            btn.Cursor = Cursors.Hand;                            // 마우스 커서 손 모양
        }



        // 5ms마다 호출 - 0.005씩 증가, 소수점 둘째자리로 반올림
        private void timer1_Tick(object sender, EventArgs e)
        {
            elapsedTime = Math.Round(elapsedTime + 0.005, 3);
            textBox1.Text = elapsedTime.ToString("0.00") + "초 경과";
            label1.Text = elapsedTime.ToString("0.00") + "초 경과";
        }

        // 시작 버튼: 타이머 가동
        private void button1_Click(object sender, EventArgs e)
        {
            timer1.Enabled = true;
        }

        // 일시정지 버튼: 타이머 정지 후 9.99초 판정
        private void button2_Click(object sender, EventArgs e)
        {
            if (timer1.Enabled)
            {
                timer1.Enabled = false;
                // 소수점 둘째자리 기준으로 반올림하여 비교
                double display = Math.Round(elapsedTime, 2);
                if (display == TARGET_TIME)
                    MessageBox.Show("성공! 정확히 9.99초입니다!", "결과");
                else
                    MessageBox.Show($"실패! {display:0.00}초입니다.", "결과");
            }
            else
            {
                timer1.Enabled = true;  // 재개
            }
            //    if (timer1.Enabled)
            //    {
            //        timer1.Enabled = false;

            //        // 임시: 항상 성공 메시지 출력
            //        MessageBox.Show("성공! 정확히 9.99초입니다!", "결과");
            //    }
            //    else
            //    {
            //        timer1.Enabled = true;
            //    }

            //}
        }

        // 리셋 버튼: 초기화
        private void button3_Click(object sender, EventArgs e)
        {
            elapsedTime = 0;
            timer1.Enabled = false;
            textBox1.Text = "0.00초 경과";
            label1.Text = "0.00초 경과";
        }
    }
}