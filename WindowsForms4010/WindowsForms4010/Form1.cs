using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms4010
{ 
    public partial class Form1 : Form
    {
        int i = 0;

        public Form1()  // 생성자          // 동적연결 , 정적연결
        {
            InitializeComponent();  // 화면에 버튼, 레이블, 텍스트박스 등을 실제로 그려내는 시작점

            myButton.Text = "코드에서";  // myButton이라는 버튼의 글자를 "코드에서"라고 바꿉니다.
            myButton.Width = 600;       // 버튼의 가로 길이를 600으로 넓게 설정합니다.

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btn1_Clicked(object sender, EventArgs e) // btn1_Clicked (버튼 클릭 이벤트)
        {
            textBox1.Text += "+";   // 텍스트 추가: textBox1과 label1에 있는 기존 글자 뒤에 + 기호를 계속 붙입니다.
            label1.Text += "+";


            Button btn = new Button();  // 메모리에 새로운 버튼 객체를 하나 만듭니다.
            Controls.Add(btn);          //방금 만든 버튼을 실제 프로그램 창(Form) 위에 배치합니다.
            btn.Location = new Point(13, (13 + 23 + 3) * i); // 동적 위치 계산
            btn.Text = "동적 생성" + i + "번째";
            i++;

            //X 좌표 (13): 왼쪽에서 13만큼 떨어진 위치에 고정합니다.

            //Y 좌표(세로 위치): i라는 숫자를 곱해서 버튼이 생길 때마다 아래로 내려가게 만듭니다.

            //i가 0일 때: 첫 번째 버튼은 맨 위.

            //i가 1일 때: 두 번째 버튼은 그 아래.

            //i++: 버튼을 하나 만들 때마다 i 값을 1씩 키워서 다음 버튼이 더 아래에 그려지도록 준비합니다.
            
        }
    }
}
