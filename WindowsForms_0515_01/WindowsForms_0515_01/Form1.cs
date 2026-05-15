using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_0515_01
{
    public partial class Form1 : Form

    {   // 판매 가능한 전체 상품 목록
        private List<Product> availableProducts = new List<Product>();

        // DataGridView에 연결할 선택된 상품 목록
        private BindingList<Product> selectedProducts = new BindingList<Product>();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // 1. 상품 목록 추가
            availableProducts.Add(new Product { Name = "아메리카노", Price = 3000 });
            availableProducts.Add(new Product { Name = "카페라떼", Price = 4000 });
            availableProducts.Add(new Product { Name = "아이스티", Price = 5000 });
            availableProducts.Add(new Product { Name = "말차라떼", Price = 6000 });
            availableProducts.Add(new Product { Name = "스무디", Price = 7000 });

            // 2. ListBox에 상품 목록 연결
            lstProducts.DataSource = availableProducts;

            // 3. DataGridView에 선택 목록 연결
            dataGridView1.DataSource = selectedProducts;

            // 4. DataGridView 컬럼 헤더 이름 변경
            dataGridView1.Columns["Name"].HeaderText = "상품명";
            dataGridView1.Columns["Price"].HeaderText = "가격(원)";

            // 5. DataGridView 편집 불가 설정
            dataGridView1.ReadOnly = true;
            dataGridView1.AllowUserToAddRows = false;



        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (lstProducts.SelectedItems.Count == 0)
            {
                MessageBox.Show("상품을 선택해주세요!", "알림",
                         MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            // ListBox에서 선택된 항목들을 순회
            foreach (Product selected in lstProducts.SelectedItems)
            {
                // 이미 추가된 상품은 중복 추가 방지
                bool isDuplicate = selectedProducts.Any(p => p.Name == selected.Name);
                if (!isDuplicate)
                {
                    selectedProducts.Add(selected);
                }
            }

        }
        // ── 선택 삭제 버튼 클릭 ───────────────────────
        private void btnRemove_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("삭제할 항목을 DataGridView에서 선택하세요!", "알림",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            // 선택된 행의 Product 객체 수집
            var toRemove = dataGridView1.SelectedRows
                .Cast<DataGridViewRow>()
                .Select(row => row.DataBoundItem as Product)
                .ToList();

            // 선택 목록에서 제거
            foreach (var product in toRemove)
            {
                selectedProducts.Remove(product);
            }

            UpdateTotal(); // 합계 갱신
        }

        // ── 합계금액 계산 및 표시 ─────────────────────
        private void UpdateTotal()
        {
            int total = selectedProducts.Sum(p => p.Price);
            lblTotal.Text = $"합계금액: {total:N0}원";
        }  

    }
}   
