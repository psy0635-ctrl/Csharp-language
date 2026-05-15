using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_0515_03
{
    public partial class Form1 : Form
    {
        // 장바구니 데이터를 저장할 리스트
        // 사용자가 메뉴 버튼을 누르면 Product 객체가 여기에 추가됨
        List<Product> cartList = new List<Product>();

        public Form1()
        {
            // Visual Studio 디자이너에서 만든 버튼, 라벨, 그리드뷰 등을 불러오는 코드
            InitializeComponent();

            // 폼이 실행될 때 장바구니 표 기본 설정
            InitCartGrid();

            // 처음 총액은 0원으로 표시
            label2.Text = "0원";
        }

        // 불고기버거 버튼 클릭
        private void button1_Click_1(object sender, EventArgs e)
        {
            // 장바구니 리스트에 불고기버거 추가
            cartList.Add(new Product { Name = "불고기버거", Price = 4000 });

            // 총액 계산
            // Replace("원", "")은 "원" 글자를 제거하는 역할
            int total = int.Parse(label2.Text.Replace("원", "")) + 4000;

            // 총액 표시
            label2.Text = total.ToString() + "원";

            // 장바구니 표를 새로고침해서 방금 추가한 상품이 보이게 함
            RefreshCart();
        }

        // 치킨버거 버튼 클릭
        private void button2_Click_1(object sender, EventArgs e)
        {
            // 장바구니 리스트에 치킨버거 추가
            cartList.Add(new Product { Name = "치킨버거", Price = 5000 });

            // 현재 총액에 5000원을 더함
            int total = int.Parse(label2.Text.Replace("원", "")) + 5000;

            // 총액 라벨 갱신
            label2.Text = total.ToString() + "원";

            // 장바구니 표 갱신
            RefreshCart();
        }

        // 감자튀김 버튼 클릭
        private void button3_Click_1(object sender, EventArgs e)
        {
            // 장바구니 리스트에 감자튀김 추가
            cartList.Add(new Product { Name = "감자튀김", Price = 2500 });

            // 현재 총액에 2500원을 더함
            int total = int.Parse(label2.Text.Replace("원", "")) + 2500;

            // 총액 표시
            label2.Text = total.ToString() + "원";

            // 장바구니 표 갱신
            RefreshCart();
        }

        // 콜라 버튼 클릭
        private void button4_Click_1(object sender, EventArgs e)
        {
            // 장바구니 리스트에 콜라 추가
            cartList.Add(new Product { Name = "콜라", Price = 2000 });

            // 현재 총액에 2000원을 더함
            int total = int.Parse(label2.Text.Replace("원", "")) + 2000;

            // 총액 표시
            label2.Text = total.ToString() + "원";

            // 장바구니 표 갱신
            RefreshCart();
        }

        // 선택 삭제 버튼 클릭
        private void button5_Click_1(object sender, EventArgs e)
        {
            // dataGridView1.CurrentRow는 현재 선택된 행을 의미함
            // 아무 행도 선택하지 않았다면 null이 됨
            if (dataGridView1.CurrentRow == null)
            {
                // 선택한 메뉴가 없으면 경고 메시지 출력
                MessageBox.Show("삭제할 메뉴를 선택하세요.");

                // 아래 코드를 실행하지 않고 메서드 종료
                return;
            }

            // 현재 선택한 행의 번호를 가져옴
            // 예: 첫 번째 행이면 0, 두 번째 행이면 1
            int index = dataGridView1.CurrentRow.Index;

            // 선택한 행 번호와 cartList의 순서가 같기 때문에
            // cartList[index]로 선택한 상품 정보를 가져올 수 있음
            Product item = cartList[index];

            // 현재 총액에서 선택한 상품 가격을 뺌
            // 예: 총액이 9000원이고 치킨버거 5000원을 삭제하면 4000원이 됨
            int total = int.Parse(label2.Text.Replace("원", "")) - item.Price;

            // 계산된 금액을 다시 label2에 표시
            label2.Text = total.ToString() + "원";

            // 장바구니 리스트에서 선택한 상품 삭제
            cartList.RemoveAt(index);

            // 장바구니 표 새로고침
            RefreshCart();
        }


        // 결제하기 버튼 클릭
        private void button6_Click_1(object sender, EventArgs e)
        {
            // 장바구니에 담긴 상품이 하나도 없으면 결제를 못 하게 함
            if (cartList.Count == 0)
            {
                MessageBox.Show("장바구니가 비어 있습니다.");
                return;
            }

            // 현재 총액 문자열 가져오기
            // 예: "11500원"
            string totalText = label2.Text;

            // 결제 확인 메시지 창을 띄움
            // MessageBoxButtons.YesNo는 예/아니오 버튼을 보여줌
            // MessageBoxIcon.Question은 물음표 아이콘을 보여줌
            DialogResult result = MessageBox.Show(
                totalText + " 결제하시겠습니까?",
                "결제 확인",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question
            );

            // 사용자가 Yes 버튼을 눌렀을 때만 결제 처리
            if (result == DialogResult.Yes)
            {
                // 결제 완료 메시지 출력
                MessageBox.Show("결제가 완료되었습니다.");

                // 장바구니 리스트 전체 비우기
                cartList.Clear();

                // 총액을 다시 0원으로 초기화
                label2.Text = "0원";

                // 장바구니 표도 빈 상태로 새로고침
                RefreshCart();
            }
        }

        // 장바구니 표 설정
        private void InitCartGrid()
        {
            // 기존 컬럼이 있다면 모두 삭제
            dataGridView1.Columns.Clear();

            // 사용자가 직접 행을 추가하지 못하게 설정
            dataGridView1.AllowUserToAddRows = false;

            // 표 내용을 직접 수정하지 못하게 설정
            dataGridView1.ReadOnly = true;

            // 행 전체 선택
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            // 장바구니 표 컬럼 만들기
            dataGridView1.Columns.Add("Name", "상품명");
            dataGridView1.Columns.Add("Price", "가격");

            // 컬럼 너비 자동 조정
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        // 장바구니 표 새로고침 메서드
        private void RefreshCart()
        {
            // 기존 표 내용 삭제
            dataGridView1.Rows.Clear();

            // cartList에 들어있는 상품들을 표에 다시 추가
            foreach (Product item in cartList)
            {
                dataGridView1.Rows.Add(item.Name, item.Price.ToString() + "원");
            }
        }


    }
}
