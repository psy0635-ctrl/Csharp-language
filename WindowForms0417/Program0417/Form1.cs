using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Program0417
{
    public partial class Form1 : Form
    {
        // ================================================================
        // 📦 필드 (Field) - 클래스 전체에서 공유되는 변수들
        // ================================================================
        // 메서드 안에서 선언한 변수는 그 메서드가 끝나면 사라집니다.
        // 하지만 계산기는 버튼을 여러 번 클릭하는 동안 값을 기억해야 하므로
        // 클래스 바깥(메서드 밖)에 변수를 선언해서 계속 유지시킵니다.

        double firstValue = 0;
        // 첫 번째 숫자를 저장합니다.
        // 예: 사용자가 "3 + 5 ="를 누를 때, 3을 여기에 저장해둡니다.
        // double을 쓰는 이유: 소수점(3.14 같은 숫자)도 처리하기 위해서입니다.

        string op = "";
        // 연산자(+, -, *, /)를 저장합니다.
        // 초기값은 빈 문자열 "" → 아직 연산자가 선택되지 않은 상태를 의미합니다.

        bool isOpClicked = false;
        // 연산자 버튼이 클릭되었는지 여부를 기억하는 깃발(플래그)입니다.
        // true  → 연산자가 눌린 직후 상태 (다음 숫자 입력 시 화면을 새로 시작해야 함)
        // false → 아직 연산자가 눌리지 않은 상태 (숫자를 이어서 써야 함)
        //
        // 예시로 이해하기:
        // "3 + 5"를 입력한다고 가정합니다.
        // [3] 클릭 → 화면: "3",  isOpClicked = false
        // [+] 클릭 → isOpClicked = true  (이제 다음 숫자는 새로 시작해야 함)
        // [5] 클릭 → isOpClicked가 true이므로 "35"가 아닌 "5"로 화면을 초기화
        //            그리고 isOpClicked = false로 다시 변경

        // ================================================================
        // 🏗️ 생성자 (Constructor)
        // ================================================================
        public Form1()
        {
            InitializeComponent();
            // Visual Studio가 자동으로 만들어주는 메서드입니다.
            // 디자인 창에서 배치한 버튼, 라벨 등 모든 컨트롤을
            // 코드로 초기화(생성)하는 작업을 여기서 수행합니다.
            // 이 줄이 없으면 화면이 아무것도 표시되지 않습니다.
        }

        // ================================================================
        // 🔢 숫자 버튼 클릭 (0 ~ 9)
        // 디자인 창에서 숫자 버튼 10개를 모두 이 메서드에 연결하세요.
        // ================================================================
        private void button1_Click(object sender, EventArgs e)
        {
            // sender: 실제로 클릭된 버튼 객체입니다. (object 타입으로 전달됨)
            // Button으로 형변환해야 .Text 같은 버튼 속성을 사용할 수 있습니다.
            Button btn = (Button)sender;

            // 화면이 "0"인 경우(초기 상태) 또는 방금 연산자를 눌렀을 경우:
            // 숫자를 이어 붙이지 않고, 새로운 숫자로 화면을 교체합니다.
            // 예: 화면이 "0"일 때 [7]을 누르면 → "07"이 아니라 "7"이 되어야 합니다.
            if (lblDisplay.Text == "0" || isOpClicked)
            {
                lblDisplay.Text = btn.Text;   // 화면을 클릭한 버튼의 숫자로 교체
                isOpClicked = false;          // 숫자를 입력했으므로 플래그를 다시 false로
            }
            else
            {
                // 화면에 이미 숫자가 있고, 연산자를 누르지 않은 상태:
                // 기존 숫자 뒤에 새 숫자를 이어 붙입니다.
                // 예: 화면이 "12"일 때 [3]을 누르면 → "123"
                lblDisplay.Text += btn.Text;
            }
        }

        // ================================================================
        // 🔵 소수점 버튼 (.)
        // ================================================================
        private void btnDot_Click(object sender, EventArgs e)
        {
            // 소수점이 이미 화면에 있는지 확인합니다.
            // "3.14"에 또 [.]를 누르면 "3.14."가 되는 걸 막아야 합니다.
            if (!lblDisplay.Text.Contains("."))
            {
                // 소수점이 없을 때만 추가합니다.
                lblDisplay.Text += ".";
            }
            // 이미 소수점이 있으면 아무 동작도 하지 않습니다.
        }

        // ================================================================
        // ➕➖✖️➗ 연산자 버튼 (+, -, *, /)
        // 디자인 창에서 연산자 버튼 4개를 모두 이 메서드에 연결하세요.
        // ================================================================
        private void btnOperator_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            // 클릭된 버튼이 어떤 연산자인지 알아내기 위해 형변환합니다.

            // 현재 화면의 숫자를 파싱(문자열 → 숫자 변환)합니다.
            // double.TryParse: 변환에 성공하면 true를 반환하고, out value에 숫자를 저장
            //                  변환에 실패해도 프로그램이 터지지 않고 false를 반환합니다.
            //                  (double.Parse는 실패 시 예외(오류)가 발생합니다.)
            if (double.TryParse(lblDisplay.Text, out double value))
            {
                // 연산자를 연속으로 누른 경우를 처리합니다.
                // 예: "3 + 4 +" 처럼 등호 없이 연산자를 또 누른 경우
                //     "3 + 4"까지의 결과(7)를 먼저 계산하고,
                //     이후 새 연산자(두 번째 +)를 받아들입니다.
                if (!isOpClicked && op != "")
                {
                    btnEqual_Click(sender, e); // 먼저 이전 계산을 완료합니다.
                }

                // 현재 화면의 값을 firstValue에 저장합니다.
                // 이 값이 나중에 = 버튼을 눌렀을 때 첫 번째 피연산자가 됩니다.
                firstValue = double.Parse(lblDisplay.Text);

                // 클릭된 버튼의 텍스트("+", "-", "*", "/")를 연산자로 저장합니다.
                op = btn.Text;

                // 다음 숫자 입력 시 화면을 새로 시작하도록 플래그를 true로 설정합니다.
                isOpClicked = true;
            }
        }

        // ================================================================
        // 🟰 등호 버튼 (=)
        // ================================================================
        private void btnEqual_Click(object sender, EventArgs e)
        {
            // 연산자가 선택되지 않았거나, 연산자를 누른 직후(두 번째 숫자 없음)라면
            // 계산할 것이 없으므로 바로 종료합니다.
            if (op == "" || isOpClicked) return;

            // 현재 화면의 숫자(두 번째 피연산자)를 파싱합니다.
            // 파싱 실패 시 아무것도 하지 않고 종료합니다.
            if (!double.TryParse(lblDisplay.Text, out double secondValue)) return;

            double result = 0;

            // 저장된 연산자(op)에 따라 계산을 수행합니다.
            switch (op)
            {
                case "+":
                    result = firstValue + secondValue;
                    break;

                case "-":
                    result = firstValue - secondValue;
                    break;

                case "*":
                    result = firstValue * secondValue;
                    break;

                case "/":
                    // 0으로 나누기는 수학적으로 불가능합니다.
                    // 처리하지 않으면 Infinity(무한대)가 출력되거나 오류가 발생합니다.
                    if (secondValue == 0)
                    {
                        lblDisplay.Text = "오류";   // 화면에 오류 표시
                        op = "";
                        isOpClicked = false;
                        return;                     // 이후 코드 실행 중단
                    }
                    result = firstValue / secondValue;
                    break;
            }

            // 계산 결과를 화면에 표시합니다.
            lblDisplay.Text = result.ToString();

            // 연속 계산을 지원하기 위해 결과값을 firstValue에 저장합니다.
            // 예: "3 + 4 = + 5 =" 흐름
            //     3 + 4 = → result = 7,  firstValue = 7 저장
            //     + 5 =   → 7 + 5 = 12
            firstValue = result;

            // 연산자를 초기화합니다. (계산이 끝났으므로)
            op = "";

            // 플래그를 false로 설정합니다.
            isOpClicked = false;
        }

        // ================================================================
        // 🔴 C 버튼 (전체 초기화)
        // ================================================================
        private void buttonClear_Click(object sender, EventArgs e)
        {
            // 모든 것을 초기 상태로 되돌립니다.
            lblDisplay.Text = "0";   // 화면을 0으로
            firstValue = 0;          // 저장된 첫 번째 숫자 초기화
            op = "";                 // 연산자 초기화
            isOpClicked = false;     // 플래그 초기화
        }

        // ================================================================
        // ⬅️ 백스페이스 버튼 (한 글자 지우기)
        // ================================================================
        private void btnBackspace_Click(object sender, EventArgs e)
        {
            // 현재 화면 문자열의 길이가 1보다 크면 마지막 글자만 제거합니다.
            // 예: "123" → "12"
            // Substring(시작인덱스, 길이): 문자열의 일부를 잘라냅니다.
            // Length - 1: 마지막 글자 직전까지만 남깁니다.
            if (lblDisplay.Text.Length > 1)
            {
                lblDisplay.Text = lblDisplay.Text.Substring(0, lblDisplay.Text.Length - 1);
            }
            else
            {
                // 글자가 딱 1개 남았을 때 지우면 화면이 비어버립니다.
                // 빈 화면 대신 "0"으로 설정합니다.
                lblDisplay.Text = "0";
            }
        }
    }
}