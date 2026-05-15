using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_0515_02
{
    public partial class Form1 : Form
    {
        // ── 색상 ─────────────────────────────────────
        readonly Color C_BG = Color.FromArgb(240, 242, 248);
        readonly Color C_WHITE = Color.White;
        readonly Color C_ACCENT = Color.FromArgb(67, 97, 238);  // 파랑
        readonly Color C_ACCENT_L = Color.FromArgb(238, 240, 253);  // 연파랑
        readonly Color C_TEXT = Color.FromArgb(45, 53, 97);
        readonly Color C_SUB = Color.FromArgb(136, 146, 176);
        readonly Color C_BORDER = Color.FromArgb(232, 234, 242);
        readonly Color C_RED = Color.FromArgb(226, 75, 74);
        readonly Color C_GREEN = Color.FromArgb(45, 198, 83);

        // ── 데이터 ───────────────────────────────────
        private List<Product> productList = new List<Product>();
        private List<CartItem> cartList = new List<CartItem>();

        // ── UI 참조 ──────────────────────────────────
        private TextBox tbName, tbPrice;
        private DataGridView dgvProduct, dgvCart;
        private Label lblTotal;

        public Form1()
        {
            InitializeComponent();
            this.Text = "POS 관리";
            this.Size = new Size(920, 620);
            this.BackColor = C_BG;
            this.Font = new Font("Segoe UI", 9.5f);
            this.StartPosition = FormStartPosition.CenterScreen;

            InitData();
            BuildUI();
        }

        // ══════════════════════════════════════════
        //  초기 데이터
        // ══════════════════════════════════════════
        void InitData()
        {
            productList.Add(new Product { Name = "감자", Price = 3000 });
            productList.Add(new Product { Name = "고구마", Price = 4000 });
            productList.Add(new Product { Name = "당근", Price = 2500 });
            productList.Add(new Product { Name = "양파", Price = 1500 });
            productList.Add(new Product { Name = "배추", Price = 5000 });
            productList.Add(new Product { Name = "사과", Price = 3500 });
            productList.Add(new Product { Name = "토마토", Price = 2800 });
        }

        // ══════════════════════════════════════════
        //  UI 동적 생성
        // ══════════════════════════════════════════
        void BuildUI()
        {
            // ── 상단 입력 패널 ────────────────────
            var pnlTop = new Panel
            {
                Dock = DockStyle.Top,
                Height = 68,
                BackColor = C_WHITE,
                Padding = new Padding(14, 0, 14, 0)
            };
            // 하단 구분선 효과용
            pnlTop.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(pen, 0, pnlTop.Height - 1,
                                             pnlTop.Width, pnlTop.Height - 1);
            };

            var lblName = MakeLabel("상품명", 14, 10);
            tbName = MakeTextBox(14, 28, 150);

            var lblPrice = MakeLabel("가격", 176, 10);
            tbPrice = MakeTextBox(176, 28, 120);

            var btnAdd = MakeButton("추가", 312, 20, C_ACCENT, C_WHITE, 80, 32);
            btnAdd.Click += BtnAdd_Click;

            var btnFont = MakeButton("폰트 선택", 402, 20, C_WHITE, C_ACCENT, 90, 32);
            btnFont.FlatAppearance.BorderColor = C_ACCENT;
            btnFont.Click += BtnFont_Click;

            // Enter 키 → 추가
            tbPrice.KeyDown += (s, e) => { if (e.KeyCode == Keys.Enter) BtnAdd_Click(s, e); };

            pnlTop.Controls.AddRange(new Control[]
                { lblName, tbName, lblPrice, tbPrice, btnAdd, btnFont });

            // ── 메인 레이아웃 ─────────────────────
            var table = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 2,
                RowCount = 1,
                BackColor = C_BG,
                Padding = new Padding(12)
            };
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 63));
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 37));

            // ── 왼쪽: 상품 목록 ───────────────────
            var pnlLeft = new Panel
            {
                Dock = DockStyle.Fill,
                BackColor = C_WHITE,
                Padding = new Padding(0)
            };
            pnlLeft.Paint += PanelBorder;

            var lblProdHdr = new Label
            {
                Text = "상품 목록",
                Font = new Font("Segoe UI", 10, FontStyle.Bold),
                ForeColor = C_SUB,
                Dock = DockStyle.Top,
                Height = 36,
                TextAlign = ContentAlignment.MiddleLeft,
                Padding = new Padding(12, 0, 0, 0)
            };
            lblProdHdr.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(pen, 0, lblProdHdr.Height - 1,
                                             lblProdHdr.Width, lblProdHdr.Height - 1);
            };

            dgvProduct = BuildDataGridView();
            dgvProduct.Columns.Add(new DataGridViewTextBoxColumn
            { Name = "Name", HeaderText = "상품명", Width = 180 });
            dgvProduct.Columns.Add(new DataGridViewTextBoxColumn
            { Name = "Price", HeaderText = "가격", Width = 120 });
            dgvProduct.Columns.Add(new DataGridViewButtonColumn
            {
                Name = "Cart",
                HeaderText = "",
                Text = "+ 담기",
                UseColumnTextForButtonValue = true,
                Width = 70,
                FlatStyle = FlatStyle.Flat
            });

            RefreshProductGrid();
            dgvProduct.CellClick += DgvProduct_CellClick;

            pnlLeft.Controls.Add(dgvProduct);
            pnlLeft.Controls.Add(lblProdHdr);

            // ── 오른쪽: 장바구니 ──────────────────
            var pnlRight = new Panel
            {
                Dock = DockStyle.Fill,
                BackColor = C_WHITE,
                Padding = new Padding(0)
            };
            pnlRight.Margin = new Padding(10, 0, 0, 0);
            pnlRight.Paint += PanelBorder;

            var lblCartHdr = new Label
            {
                Text = "🛒  장바구니",
                Font = new Font("Segoe UI", 10, FontStyle.Bold),
                ForeColor = C_ACCENT,
                Dock = DockStyle.Top,
                Height = 36,
                TextAlign = ContentAlignment.MiddleLeft,
                Padding = new Padding(12, 0, 0, 0)
            };
            lblCartHdr.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(pen, 0, lblCartHdr.Height - 1,
                                             lblCartHdr.Width, lblCartHdr.Height - 1);
            };

            dgvCart = BuildDataGridView();
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            { Name = "Name", HeaderText = "상품명", Width = 90 });
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            { Name = "Qty", HeaderText = "수량", Width = 40 });
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            { Name = "Total", HeaderText = "금액", Width = 75 });
            dgvCart.Columns.Add(new DataGridViewButtonColumn
            {
                Name = "Del",
                HeaderText = "",
                Text = "✕",
                UseColumnTextForButtonValue = true,
                Width = 30
            });
            dgvCart.CellClick += DgvCart_CellClick;

            // 하단 푸터
            var pnlFooter = new Panel
            {
                Dock = DockStyle.Bottom,
                Height = 130,
                BackColor = C_WHITE,
                Padding = new Padding(12, 8, 12, 8)
            };
            pnlFooter.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(pen, 0, 0, ((Panel)s).Width, 0);
            };

            lblTotal = new Label
            {
                Text = "합계금액   0원",
                Font = new Font("Segoe UI", 13, FontStyle.Bold),
                ForeColor = C_TEXT,
                Dock = DockStyle.Top,
                Height = 32,
                TextAlign = ContentAlignment.MiddleRight
            };

            var btnPay = MakeButton("결제하기", 0, 0, C_ACCENT, C_WHITE);
            btnPay.Dock = DockStyle.Bottom;
            btnPay.Height = 38;
            btnPay.Font = new Font("Segoe UI", 11, FontStyle.Bold);
            btnPay.Click += BtnPay_Click;

            var btnRemove = MakeButton("선택 빼기", 0, 0, C_WHITE, C_RED);
            btnRemove.Dock = DockStyle.Bottom;
            btnRemove.Height = 32;
            btnRemove.FlatAppearance.BorderColor = C_RED;
            btnRemove.Margin = new Padding(0, 0, 0, 4);
            btnRemove.Click += BtnRemove_Click;

            pnlFooter.Controls.AddRange(new Control[] { btnPay, btnRemove, lblTotal });

            pnlRight.Controls.Add(dgvCart);
            pnlRight.Controls.Add(lblCartHdr);
            pnlRight.Controls.Add(pnlFooter);

            table.Controls.Add(pnlLeft, 0, 0);
            table.Controls.Add(pnlRight, 1, 0);

            this.Controls.Add(table);
            this.Controls.Add(pnlTop);
        }

        // ══════════════════════════════════════════
        //  이벤트 핸들러
        // ══════════════════════════════════════════

        // 추가 버튼 — 새 상품을 목록에 추가
        void BtnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbName.Text))
            { ShowWarn("상품명을 입력하세요!"); tbName.Focus(); return; }

            if (!int.TryParse(tbPrice.Text, out int price))
            { ShowWarn("가격은 숫자로 입력하세요!"); tbPrice.Focus(); return; }

            productList.Add(new Product { Name = tbName.Text.Trim(), Price = price });
            RefreshProductGrid();
            tbName.Clear(); tbPrice.Clear(); tbName.Focus();
        }

        // 상품 목록 "+ 담기" 클릭 → 장바구니 추가
        void DgvProduct_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0 || e.ColumnIndex != dgvProduct.Columns["Cart"].Index) return;

            var p = productList[e.RowIndex];
            var exist = cartList.FirstOrDefault(c => c.Name == p.Name);
            if (exist != null)
                exist.Qty++;
            else
                cartList.Add(new CartItem { Name = p.Name, Price = p.Price, Qty = 1 });

            RefreshCartGrid();
        }

        // 장바구니 "✕" 클릭 → 개별 삭제
        void DgvCart_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0 || e.ColumnIndex != dgvCart.Columns["Del"].Index) return;
            cartList.RemoveAt(e.RowIndex);
            RefreshCartGrid();
        }

        // 선택 빼기 버튼 → 장바구니에서 선택 행 삭제
        void BtnRemove_Click(object sender, EventArgs e)
        {
            if (dgvCart.SelectedRows.Count == 0)
            { ShowWarn("장바구니에서 빼기할 항목을 선택하세요!"); return; }

            var indices = dgvCart.SelectedRows
                .Cast<DataGridViewRow>()
                .Select(r => r.Index)
                .OrderByDescending(i => i)
                .ToList();

            foreach (int idx in indices)
                cartList.RemoveAt(idx);

            RefreshCartGrid();
        }

        // 결제 버튼
        void BtnPay_Click(object sender, EventArgs e)
        {
            if (cartList.Count == 0) { ShowWarn("장바구니가 비어 있습니다!"); return; }

            int total = cartList.Sum(c => c.Total);
            var res = MessageBox.Show($"총 {total:N0}원을 결제하시겠습니까?",
                "결제 확인", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (res == DialogResult.Yes)
            {
                MessageBox.Show("✅ 결제 완료!", "완료", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cartList.Clear();
                RefreshCartGrid();
            }
        }

        // 폰트 선택
        void BtnFont_Click(object sender, EventArgs e)
        {
            using (var fd = new FontDialog { Font = dgvProduct.DefaultCellStyle.Font })
            {
                if (fd.ShowDialog() == DialogResult.OK)
                {
                    dgvProduct.DefaultCellStyle.Font = fd.Font;
                    dgvCart.DefaultCellStyle.Font = fd.Font;
                }
            }
        }

        // ══════════════════════════════════════════
        //  그리드 갱신
        // ══════════════════════════════════════════
        void RefreshProductGrid()
        {
            dgvProduct.Rows.Clear();
            foreach (var p in productList)
                dgvProduct.Rows.Add(p.Name, $"{p.Price:N0}원", "+ 담기");
        }

        void RefreshCartGrid()
        {
            dgvCart.Rows.Clear();
            foreach (var c in cartList)
                dgvCart.Rows.Add(c.Name, c.Qty, $"{c.Total:N0}원", "✕");

            int total = cartList.Sum(c => c.Total);
            lblTotal.Text = $"합계금액   {total:N0}원";
        }

        // ══════════════════════════════════════════
        //  헬퍼
        // ══════════════════════════════════════════
        DataGridView BuildDataGridView()
        {
            var dgv = new DataGridView
            {
                Dock = DockStyle.Fill,
                ReadOnly = true,
                AllowUserToAddRows = false,
                AllowUserToResizeRows = false,
                BackgroundColor = C_WHITE,
                GridColor = C_BORDER,
                BorderStyle = BorderStyle.None,
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                ColumnHeadersHeight = 36,
                RowTemplate = { Height = 42 },
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal
            };
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(247, 248, 252);
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = C_SUB;
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9, FontStyle.Bold);
            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;

            dgv.DefaultCellStyle.BackColor = C_WHITE;
            dgv.DefaultCellStyle.ForeColor = C_TEXT;
            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);
            dgv.DefaultCellStyle.SelectionBackColor = C_ACCENT_L;
            dgv.DefaultCellStyle.SelectionForeColor = C_ACCENT;
            dgv.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            return dgv;
        }

        Label MakeLabel(string text, int x, int y)
            => new Label
            {
                Text = text,
                ForeColor = C_SUB,
                Font = new Font("Segoe UI", 8.5f, FontStyle.Bold),
                AutoSize = true,
                Location = new Point(x, y)
            };

        TextBox MakeTextBox(int x, int y, int w)
        {
            var tb = new TextBox
            {
                Location = new Point(x, y),
                Size = new Size(w, 28),
                BorderStyle = BorderStyle.FixedSingle,
                Font = new Font("Segoe UI", 10),
                ForeColor = C_TEXT
            };
            tb.Enter += (s, e) => ((TextBox)s).BackColor = Color.FromArgb(245, 246, 255);
            tb.Leave += (s, e) => ((TextBox)s).BackColor = C_WHITE;
            return tb;
        }

        Button MakeButton(string text, int x, int y,
                          Color back, Color fore,
                          int w = 120, int h = 36)
        {
            var btn = new Button
            {
                Text = text,
                Location = new Point(x, y),
                Size = new Size(w, h),
                BackColor = back,
                ForeColor = fore,
                FlatStyle = FlatStyle.Flat,
                Font = new Font("Segoe UI", 9.5f, FontStyle.Bold),
                Cursor = Cursors.Hand
            };
            btn.FlatAppearance.BorderSize = 1;
            btn.FlatAppearance.BorderColor = back == C_WHITE ? fore : back;
            return btn;
        }

        void PanelBorder(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            var p = (Panel)sender;
            using (var pen = new Pen(C_BORDER))
                e.Graphics.DrawRectangle(pen, 0, 0, p.Width - 1, p.Height - 1);
        }

        void ShowWarn(string msg)
            => MessageBox.Show(msg, "알림", MessageBoxButtons.OK, MessageBoxIcon.Warning);
    }
}
