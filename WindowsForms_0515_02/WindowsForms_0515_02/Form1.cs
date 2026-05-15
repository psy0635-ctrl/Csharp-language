// C# 기본 기능을 사용하기 위한 네임스페이스
using System;

// List<T> 같은 컬렉션 자료구조를 사용하기 위한 네임스페이스
using System.Collections.Generic;

// 일부 컴포넌트 관련 기능을 사용할 수 있는 네임스페이스
using System.ComponentModel;

// 데이터 관련 기능을 사용할 수 있는 네임스페이스
using System.Data;

// Color, Font, Point, Size 같은 그래픽/UI 관련 클래스를 사용하기 위한 네임스페이스
using System.Drawing;

// LINQ 기능 사용
// 예: FirstOrDefault(), Sum(), Select(), OrderByDescending() 등
using System.Linq;

// 문자열 관련 기능을 사용할 수 있는 네임스페이스
using System.Text;

// 비동기 작업 관련 기능을 사용할 수 있는 네임스페이스
using System.Threading.Tasks;

// Windows Forms UI를 만들기 위한 핵심 네임스페이스
// Form, Button, Label, TextBox, DataGridView, Panel 등을 사용함
using System.Windows.Forms;

namespace WindowsForms_0515_02
{
    // Form1 클래스는 Windows Forms 화면 하나를 의미함
    // Form을 상속받기 때문에 창 화면으로 동작할 수 있음
    public partial class Form1 : Form
    {
        // =====================================================
        // 1. 색상 설정 영역
        // =====================================================
        // readonly는 한 번 값을 넣으면 이후에 바꾸지 않겠다는 의미
        // 프로그램 전체 디자인 색상을 여기서 통일해서 관리함

        // 전체 배경색
        readonly Color C_BG = Color.FromArgb(240, 242, 248);

        // 흰색
        readonly Color C_WHITE = Color.White;

        // 포인트 색상, 버튼이나 강조 색상에 사용
        readonly Color C_ACCENT = Color.FromArgb(67, 97, 238);  // 파랑

        // 선택된 셀 배경 등에 쓰는 연한 파랑
        readonly Color C_ACCENT_L = Color.FromArgb(238, 240, 253);  // 연파랑

        // 기본 글자 색상
        readonly Color C_TEXT = Color.FromArgb(45, 53, 97);

        // 보조 글자 색상
        readonly Color C_SUB = Color.FromArgb(136, 146, 176);

        // 테두리 색상
        readonly Color C_BORDER = Color.FromArgb(232, 234, 242);

        // 삭제 버튼 등에 사용하는 빨간색
        readonly Color C_RED = Color.FromArgb(226, 75, 74);

        // 성공 표시 등에 사용할 수 있는 초록색
        readonly Color C_GREEN = Color.FromArgb(45, 198, 83);


        // =====================================================
        // 2. 데이터 저장 영역
        // =====================================================

        // 상품 목록을 저장하는 리스트
        // Product 객체에는 상품명과 가격이 들어감
        private List<Product> productList = new List<Product>();

        // 장바구니 목록을 저장하는 리스트
        // CartItem 객체에는 상품명, 가격, 수량, 총액이 들어감
        private List<CartItem> cartList = new List<CartItem>();


        // =====================================================
        // 3. UI 컨트롤 참조 변수
        // =====================================================
        // 나중에 이벤트나 메서드에서 접근해야 하므로 필드로 선언함

        // 상품명 입력 TextBox, 가격 입력 TextBox
        private TextBox tbName, tbPrice;

        // 상품 목록 표, 장바구니 표
        private DataGridView dgvProduct, dgvCart;

        // 합계금액을 표시할 Label
        private Label lblTotal;


        // =====================================================
        // 4. 생성자
        // =====================================================
        // Form1이 실행될 때 가장 먼저 실행되는 부분
        public Form1()
        {
            // Visual Studio 디자이너가 만든 기본 UI 초기화 코드
            InitializeComponent();

            // 창 제목 설정
            this.Text = "POS 관리";

            // 창 크기 설정
            this.Size = new Size(920, 620);

            // 전체 배경색 설정
            this.BackColor = C_BG;

            // 전체 기본 폰트 설정
            this.Font = new Font("Segoe UI", 9.5f);

            // 프로그램 실행 시 화면 중앙에 창이 뜨게 설정
            this.StartPosition = FormStartPosition.CenterScreen;

            // 기본 상품 데이터 추가
            InitData();

            // 화면 UI를 코드로 직접 생성
            BuildUI();
        }


        // =====================================================
        // 5. 초기 상품 데이터 추가
        // =====================================================
        void InitData()
        {
            // 버거 메뉴
            productList.Add(new Product { Name = "불고기버거", Price = 5200 });
            productList.Add(new Product { Name = "치킨버거", Price = 5500 });
            productList.Add(new Product { Name = "새우버거", Price = 5800 });
            productList.Add(new Product { Name = "더블치즈버거", Price = 6900 });

            // 세트 메뉴
            productList.Add(new Product { Name = "불고기버거 세트", Price = 7900 });
            productList.Add(new Product { Name = "치킨버거 세트", Price = 8200 });
            productList.Add(new Product { Name = "새우버거 세트", Price = 8500 });

            // 사이드 메뉴
            productList.Add(new Product { Name = "감자튀김", Price = 2500 });
            productList.Add(new Product { Name = "치즈스틱", Price = 2800 });
            productList.Add(new Product { Name = "치킨너겟", Price = 3500 });
            productList.Add(new Product { Name = "콘샐러드", Price = 2200 });

            // 음료 메뉴
            productList.Add(new Product { Name = "콜라", Price = 2000 });
            productList.Add(new Product { Name = "사이다", Price = 2000 });
            productList.Add(new Product { Name = "아이스 아메리카노", Price = 3000 });
            productList.Add(new Product { Name = "오렌지 주스", Price = 2800 });

            // 디저트 메뉴
            productList.Add(new Product { Name = "소프트콘", Price = 1800 });
            productList.Add(new Product { Name = "애플파이", Price = 2300 });
        }


        // =====================================================
        // 6. UI 화면 만들기
        // =====================================================
        // 디자이너에서 끌어다 놓는 방식이 아니라,
        // 코드로 Panel, Button, TextBox, DataGridView 등을 직접 생성함
        void BuildUI()
        {
            // -------------------------------------------------
            // 6-1. 상단 입력 패널 만들기
            // -------------------------------------------------
            // 상품명과 가격을 입력하고 추가 버튼을 누르는 영역

            var pnlTop = new Panel
            {
                // DockStyle.Top은 화면 위쪽에 고정한다는 뜻
                Dock = DockStyle.Top,

                // 패널 높이
                Height = 68,

                // 배경색
                BackColor = C_WHITE,

                // 내부 여백
                Padding = new Padding(14, 0, 14, 0)
            };

            // Paint 이벤트는 패널이 그려질 때 실행됨
            // 여기서는 패널 아래쪽에 선을 그려서 구분선 효과를 줌
            pnlTop.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(
                        pen,
                        0,
                        pnlTop.Height - 1,
                        pnlTop.Width,
                        pnlTop.Height - 1
                    );
            };

            // 상품명 Label 생성
            var lblName = MakeLabel("상품명", 14, 10);

            // 상품명 입력 TextBox 생성
            tbName = MakeTextBox(14, 28, 150);

            // 가격 Label 생성
            var lblPrice = MakeLabel("가격", 176, 10);

            // 가격 입력 TextBox 생성
            tbPrice = MakeTextBox(176, 28, 120);

            // 추가 버튼 생성
            var btnAdd = MakeButton("추가", 312, 20, C_ACCENT, C_WHITE, 80, 32);

            // 추가 버튼을 클릭하면 BtnAdd_Click 메서드 실행
            btnAdd.Click += BtnAdd_Click;

            // 폰트 선택 버튼 생성
            var btnFont = MakeButton("폰트 선택", 402, 20, C_WHITE, C_ACCENT, 90, 32);

            // 폰트 선택 버튼의 테두리 색상 설정
            btnFont.FlatAppearance.BorderColor = C_ACCENT;

            // 폰트 선택 버튼 클릭 시 BtnFont_Click 실행
            btnFont.Click += BtnFont_Click;

            // 가격 입력창에서 Enter 키를 누르면 상품 추가 실행
            tbPrice.KeyDown += (s, e) =>
            {
                if (e.KeyCode == Keys.Enter)
                    BtnAdd_Click(s, e);
            };

            // 상단 패널에 컨트롤들을 추가함
            pnlTop.Controls.AddRange(new Control[]
            {
                lblName, tbName, lblPrice, tbPrice, btnAdd, btnFont
            });


            // -------------------------------------------------
            // 6-2. 메인 레이아웃 만들기
            // -------------------------------------------------
            // TableLayoutPanel은 화면을 표처럼 나누는 레이아웃
            // 여기서는 왼쪽 상품 목록 63%, 오른쪽 장바구니 37%로 나눔

            var table = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 2,
                RowCount = 1,
                BackColor = C_BG,
                Padding = new Padding(12)
            };

            // 왼쪽 영역 비율 63%
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 63));

            // 오른쪽 영역 비율 37%
            table.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 37));


            // -------------------------------------------------
            // 6-3. 왼쪽 상품 목록 패널 만들기
            // -------------------------------------------------

            var pnlLeft = new Panel
            {
                Dock = DockStyle.Fill,
                BackColor = C_WHITE,
                Padding = new Padding(0)
            };

            // 패널 테두리를 그리는 이벤트 연결
            pnlLeft.Paint += PanelBorder;

            // 상품 목록 제목 Label
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

            // 상품 목록 제목 아래에 선 그리기
            lblProdHdr.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(
                        pen,
                        0,
                        lblProdHdr.Height - 1,
                        lblProdHdr.Width,
                        lblProdHdr.Height - 1
                    );
            };

            // 상품 목록 DataGridView 생성
            dgvProduct = BuildDataGridView();

            // 상품명 컬럼 추가
            dgvProduct.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Name",
                HeaderText = "상품명",
                Width = 180
            });

            // 가격 컬럼 추가
            dgvProduct.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Price",
                HeaderText = "가격",
                Width = 120
            });

            // 장바구니에 담기 버튼 컬럼 추가
            dgvProduct.Columns.Add(new DataGridViewButtonColumn
            {
                Name = "Cart",
                HeaderText = "",
                Text = "+ 담기",

                // 모든 버튼 셀에 Text 값을 그대로 표시
                UseColumnTextForButtonValue = true,

                Width = 70,
                FlatStyle = FlatStyle.Flat
            });

            // 상품 목록 표에 productList 데이터 표시
            RefreshProductGrid();

            // 상품 목록 셀 클릭 이벤트 연결
            dgvProduct.CellClick += DgvProduct_CellClick;

            // 왼쪽 패널에 상품 목록 표와 제목 추가
            pnlLeft.Controls.Add(dgvProduct);
            pnlLeft.Controls.Add(lblProdHdr);


            // -------------------------------------------------
            // 6-4. 오른쪽 장바구니 패널 만들기
            // -------------------------------------------------

            var pnlRight = new Panel
            {
                Dock = DockStyle.Fill,
                BackColor = C_WHITE,
                Padding = new Padding(0)
            };

            // 왼쪽 패널과 오른쪽 패널 사이 간격
            pnlRight.Margin = new Padding(10, 0, 0, 0);

            // 오른쪽 패널 테두리 그리기
            pnlRight.Paint += PanelBorder;

            // 장바구니 제목 Label
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

            // 장바구니 제목 아래 구분선
            lblCartHdr.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(
                        pen,
                        0,
                        lblCartHdr.Height - 1,
                        lblCartHdr.Width,
                        lblCartHdr.Height - 1
                    );
            };

            // 장바구니 DataGridView 생성
            dgvCart = BuildDataGridView();

            // 장바구니 상품명 컬럼
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Name",
                HeaderText = "상품명",
                Width = 90
            });

            // 수량 컬럼
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Qty",
                HeaderText = "수량",
                Width = 40
            });

            // 금액 컬럼
            dgvCart.Columns.Add(new DataGridViewTextBoxColumn
            {
                Name = "Total",
                HeaderText = "금액",
                Width = 75
            });

            // 삭제 버튼 컬럼
            dgvCart.Columns.Add(new DataGridViewButtonColumn
            {
                Name = "Del",
                HeaderText = "",
                Text = "✕",
                UseColumnTextForButtonValue = true,
                Width = 30
            });

            // 장바구니 셀 클릭 이벤트 연결
            dgvCart.CellClick += DgvCart_CellClick;


            // -------------------------------------------------
            // 6-5. 장바구니 하단 영역 만들기
            // -------------------------------------------------
            // 합계금액, 선택 빼기, 결제하기 버튼이 들어가는 영역

            var pnlFooter = new Panel
            {
                Dock = DockStyle.Bottom,
                Height = 130,
                BackColor = C_WHITE,
                Padding = new Padding(12, 8, 12, 8)
            };

            // 푸터 위쪽에 구분선 그리기
            pnlFooter.Paint += (s, e) =>
            {
                using (var pen = new Pen(C_BORDER))
                    e.Graphics.DrawLine(pen, 0, 0, ((Panel)s).Width, 0);
            };

            // 합계금액 표시 Label
            lblTotal = new Label
            {
                Text = "합계금액   0원",
                Font = new Font("Segoe UI", 13, FontStyle.Bold),
                ForeColor = C_TEXT,
                Dock = DockStyle.Top,
                Height = 32,
                TextAlign = ContentAlignment.MiddleRight
            };

            // 결제하기 버튼
            var btnPay = MakeButton("결제하기", 0, 0, C_ACCENT, C_WHITE);

            // 푸터 아래쪽에 붙임
            btnPay.Dock = DockStyle.Bottom;

            // 버튼 높이
            btnPay.Height = 38;

            // 폰트 강조
            btnPay.Font = new Font("Segoe UI", 11, FontStyle.Bold);

            // 클릭 시 결제 이벤트 실행
            btnPay.Click += BtnPay_Click;

            // 선택 빼기 버튼
            var btnRemove = MakeButton("선택 빼기", 0, 0, C_WHITE, C_RED);

            // 결제 버튼 위쪽에 배치됨
            btnRemove.Dock = DockStyle.Bottom;

            btnRemove.Height = 32;

            // 빨간 테두리
            btnRemove.FlatAppearance.BorderColor = C_RED;

            // 아래쪽 여백
            btnRemove.Margin = new Padding(0, 0, 0, 4);

            // 클릭 시 선택된 장바구니 항목 삭제
            btnRemove.Click += BtnRemove_Click;

            // 푸터에 버튼과 합계금액 Label 추가
            pnlFooter.Controls.AddRange(new Control[]
            {
                btnPay, btnRemove, lblTotal
            });

            // 오른쪽 패널에 장바구니 표, 제목, 푸터 추가
            pnlRight.Controls.Add(dgvCart);
            pnlRight.Controls.Add(lblCartHdr);
            pnlRight.Controls.Add(pnlFooter);

            // TableLayoutPanel에 왼쪽, 오른쪽 패널 추가
            table.Controls.Add(pnlLeft, 0, 0);
            table.Controls.Add(pnlRight, 1, 0);

            // Form 화면에 메인 레이아웃과 상단 패널 추가
            this.Controls.Add(table);
            this.Controls.Add(pnlTop);
        }


        // =====================================================
        // 7. 이벤트 핸들러 영역
        // =====================================================
        // 버튼 클릭, 표 클릭 같은 사용자 행동이 발생했을 때 실행되는 메서드들


        // -----------------------------------------------------
        // 7-1. 상품 추가 버튼 클릭 이벤트
        // -----------------------------------------------------
        void BtnAdd_Click(object sender, EventArgs e)
        {
            // 상품명 입력칸이 비어 있으면 경고창 출력
            if (string.IsNullOrWhiteSpace(tbName.Text))
            {
                ShowWarn("상품명을 입력하세요!");
                tbName.Focus();
                return;
            }

            // 가격 입력값이 숫자인지 검사
            // int.TryParse는 문자열을 숫자로 바꿀 수 있으면 true 반환
            // 바꿀 수 있으면 price 변수에 숫자가 저장됨
            if (!int.TryParse(tbPrice.Text, out int price))
            {
                ShowWarn("가격은 숫자로 입력하세요!");
                tbPrice.Focus();
                return;
            }

            // 입력받은 상품명과 가격으로 새 Product 객체를 만들어 상품 목록에 추가
            productList.Add(new Product
            {
                Name = tbName.Text.Trim(),
                Price = price
            });

            // 상품 목록 표 새로고침
            RefreshProductGrid();

            // 입력창 초기화
            tbName.Clear();
            tbPrice.Clear();

            // 다시 상품명 입력칸으로 커서 이동
            tbName.Focus();
        }


        // -----------------------------------------------------
        // 7-2. 상품 목록에서 "+ 담기" 버튼 클릭 이벤트
        // -----------------------------------------------------
        void DgvProduct_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // e.RowIndex < 0이면 헤더를 클릭한 경우
            // 상품 행이 아니므로 아무 작업도 하지 않음
            if (e.RowIndex < 0)
                return;

            // 클릭한 컬럼이 "Cart" 컬럼이 아니면 아무 작업도 하지 않음
            if (e.ColumnIndex != dgvProduct.Columns["Cart"].Index)
                return;

            // 클릭한 행 번호와 productList의 인덱스가 같다고 보고 상품 가져오기
            var p = productList[e.RowIndex];

            // 장바구니에 이미 같은 이름의 상품이 있는지 찾기
            var exist = cartList.FirstOrDefault(c => c.Name == p.Name);

            // 이미 장바구니에 있으면 수량만 1 증가
            if (exist != null)
            {
                exist.Qty++;
            }
            // 없으면 새 장바구니 항목으로 추가
            else
            {
                cartList.Add(new CartItem
                {
                    Name = p.Name,
                    Price = p.Price,
                    Qty = 1
                });
            }

            // 장바구니 표 새로고침
            RefreshCartGrid();
        }


        // -----------------------------------------------------
        // 7-3. 장바구니에서 "✕" 버튼 클릭 이벤트
        // -----------------------------------------------------
        void DgvCart_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // 헤더를 클릭했거나 삭제 버튼 컬럼이 아니면 종료
            if (e.RowIndex < 0 || e.ColumnIndex != dgvCart.Columns["Del"].Index)
                return;

            // 선택한 장바구니 항목 삭제
            cartList.RemoveAt(e.RowIndex);

            // 장바구니 표 새로고침
            RefreshCartGrid();
        }


        // -----------------------------------------------------
        // 7-4. 선택 빼기 버튼 클릭 이벤트
        // -----------------------------------------------------
        void BtnRemove_Click(object sender, EventArgs e)
        {
            // 장바구니에서 선택된 행이 없으면 경고
            if (dgvCart.SelectedRows.Count == 0)
            {
                ShowWarn("장바구니에서 빼기할 항목을 선택하세요!");
                return;
            }

            // 선택된 행들의 인덱스를 가져옴
            // Cast<DataGridViewRow>() : 선택된 행들을 DataGridViewRow 형태로 변환
            // Select(r => r.Index) : 각 행의 번호만 가져옴
            // OrderByDescending(i => i) : 큰 번호부터 정렬
            //
            // 큰 번호부터 삭제하는 이유:
            // 리스트에서 앞쪽부터 삭제하면 뒤쪽 인덱스가 밀려서 오류가 날 수 있기 때문
            var indices = dgvCart.SelectedRows
                .Cast<DataGridViewRow>()
                .Select(r => r.Index)
                .OrderByDescending(i => i)
                .ToList();

            // 선택된 인덱스를 하나씩 삭제
            foreach (int idx in indices)
            {
                cartList.RemoveAt(idx);
            }

            // 장바구니 표 새로고침
            RefreshCartGrid();
        }


        // -----------------------------------------------------
        // 7-5. 결제하기 버튼 클릭 이벤트
        // -----------------------------------------------------
        void BtnPay_Click(object sender, EventArgs e)
        {
            // 장바구니가 비어 있으면 결제 불가
            if (cartList.Count == 0)
            {
                ShowWarn("장바구니가 비어 있습니다!");
                return;
            }

            // 장바구니 전체 합계 계산
            // c.Total은 각 상품의 가격 * 수량
            int total = cartList.Sum(c => c.Total);

            // 결제 여부 확인창 출력
            var res = MessageBox.Show(
                $"총 {total:N0}원을 결제하시겠습니까?",
                "결제 확인",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question
            );

            // 사용자가 Yes를 누른 경우
            if (res == DialogResult.Yes)
            {
                // 결제 완료 메시지 출력
                MessageBox.Show(
                    "✅ 결제 완료!",
                    "완료",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information
                );

                // 결제 후 장바구니 비우기
                cartList.Clear();

                // 장바구니 표 새로고침
                RefreshCartGrid();
            }
        }


        // -----------------------------------------------------
        // 7-6. 폰트 선택 버튼 클릭 이벤트
        // -----------------------------------------------------
        void BtnFont_Click(object sender, EventArgs e)
        {
            // FontDialog는 윈도우 기본 폰트 선택 창
            // using을 쓰면 사용 후 자동으로 정리됨
            using (var fd = new FontDialog { Font = dgvProduct.DefaultCellStyle.Font })
            {
                // 사용자가 폰트를 선택하고 OK를 눌렀을 때
                if (fd.ShowDialog() == DialogResult.OK)
                {
                    // 상품 목록 표 폰트 변경
                    dgvProduct.DefaultCellStyle.Font = fd.Font;

                    // 장바구니 표 폰트 변경
                    dgvCart.DefaultCellStyle.Font = fd.Font;
                }
            }
        }


        // =====================================================
        // 8. DataGridView 새로고침 영역
        // =====================================================

        // -----------------------------------------------------
        // 8-1. 상품 목록 표 새로고침
        // -----------------------------------------------------
        void RefreshProductGrid()
        {
            // 기존 표 행들을 모두 지움
            dgvProduct.Rows.Clear();

            // productList에 있는 상품들을 한 줄씩 표에 추가
            foreach (var p in productList)
            {
                dgvProduct.Rows.Add(
                    p.Name,
                    $"{p.Price:N0}원",
                    "+ 담기"
                );
            }
        }


        // -----------------------------------------------------
        // 8-2. 장바구니 표 새로고침
        // -----------------------------------------------------
        void RefreshCartGrid()
        {
            // 기존 장바구니 표 행들을 모두 지움
            dgvCart.Rows.Clear();

            // cartList에 있는 장바구니 항목들을 표에 추가
            foreach (var c in cartList)
            {
                dgvCart.Rows.Add(
                    c.Name,
                    c.Qty,
                    $"{c.Total:N0}원",
                    "✕"
                );
            }

            // 장바구니 전체 합계 계산
            int total = cartList.Sum(c => c.Total);

            // 합계금액 Label에 표시
            lblTotal.Text = $"합계금액   {total:N0}원";
        }


        // =====================================================
        // 9. 헬퍼 메서드 영역
        // =====================================================
        // 반복되는 UI 생성 코드를 메서드로 분리해서 코드 중복을 줄임


        // -----------------------------------------------------
        // 9-1. DataGridView 기본 디자인 생성 메서드
        // -----------------------------------------------------
        DataGridView BuildDataGridView()
        {
            // DataGridView 객체 생성과 동시에 여러 속성 설정
            var dgv = new DataGridView
            {
                // 부모 컨트롤 전체를 채우도록 설정
                Dock = DockStyle.Fill,

                // 사용자가 직접 셀 내용을 수정하지 못하게 함
                ReadOnly = true,

                // 마지막에 새 행 추가 줄이 생기지 않게 함
                AllowUserToAddRows = false,

                // 행 높이를 사용자가 직접 바꾸지 못하게 함
                AllowUserToResizeRows = false,

                // 배경색
                BackgroundColor = C_WHITE,

                // 격자선 색상
                GridColor = C_BORDER,

                // 기본 테두리 제거
                BorderStyle = BorderStyle.None,

                // 셀 하나가 아니라 행 전체가 선택되도록 설정
                SelectionMode = DataGridViewSelectionMode.FullRowSelect,

                // 컬럼 헤더 높이
                ColumnHeadersHeight = 36,

                // 각 행의 높이
                RowTemplate = { Height = 42 },

                // 컬럼들이 전체 너비에 맞게 자동 조절
                AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,

                // 셀 사이 테두리를 가로선 중심으로 표시
                CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal
            };

            // 헤더 배경색
            dgv.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(247, 248, 252);

            // 헤더 글자색
            dgv.ColumnHeadersDefaultCellStyle.ForeColor = C_SUB;

            // 헤더 폰트
            dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9, FontStyle.Bold);

            // 헤더 가운데 정렬
            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

            // 헤더 테두리 스타일
            dgv.ColumnHeadersBorderStyle = DataGridViewHeaderBorderStyle.Single;

            // 일반 셀 배경색
            dgv.DefaultCellStyle.BackColor = C_WHITE;

            // 일반 셀 글자색
            dgv.DefaultCellStyle.ForeColor = C_TEXT;

            // 일반 셀 폰트
            dgv.DefaultCellStyle.Font = new Font("Segoe UI", 10);

            // 선택된 셀 배경색
            dgv.DefaultCellStyle.SelectionBackColor = C_ACCENT_L;

            // 선택된 셀 글자색
            dgv.DefaultCellStyle.SelectionForeColor = C_ACCENT;

            // 셀 내용 가운데 정렬
            dgv.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

            // 완성된 DataGridView 반환
            return dgv;
        }


        // -----------------------------------------------------
        // 9-2. Label 생성 메서드
        // -----------------------------------------------------
        Label MakeLabel(string text, int x, int y)
            => new Label
            {
                // Label에 표시할 글자
                Text = text,

                // 글자색
                ForeColor = C_SUB,

                // 폰트 설정
                Font = new Font("Segoe UI", 8.5f, FontStyle.Bold),

                // 글자 크기에 맞게 Label 크기 자동 조절
                AutoSize = true,

                // 위치 설정
                Location = new Point(x, y)
            };


        // -----------------------------------------------------
        // 9-3. TextBox 생성 메서드
        // -----------------------------------------------------
        TextBox MakeTextBox(int x, int y, int w)
        {
            var tb = new TextBox
            {
                // 위치
                Location = new Point(x, y),

                // 크기
                Size = new Size(w, 28),

                // 테두리 스타일
                BorderStyle = BorderStyle.FixedSingle,

                // 폰트
                Font = new Font("Segoe UI", 10),

                // 글자색
                ForeColor = C_TEXT
            };

            // TextBox에 커서가 들어오면 배경색을 연한 파랑으로 변경
            tb.Enter += (s, e) =>
                ((TextBox)s).BackColor = Color.FromArgb(245, 246, 255);

            // TextBox에서 커서가 빠져나가면 배경색을 흰색으로 변경
            tb.Leave += (s, e) =>
                ((TextBox)s).BackColor = C_WHITE;

            return tb;
        }


        // -----------------------------------------------------
        // 9-4. Button 생성 메서드
        // -----------------------------------------------------
        Button MakeButton(
            string text,
            int x,
            int y,
            Color back,
            Color fore,
            int w = 120,
            int h = 36
        )
        {
            var btn = new Button
            {
                // 버튼에 표시할 글자
                Text = text,

                // 위치
                Location = new Point(x, y),

                // 크기
                Size = new Size(w, h),

                // 버튼 배경색
                BackColor = back,

                // 버튼 글자색
                ForeColor = fore,

                // 기본 윈도우 버튼 스타일 대신 Flat 스타일 사용
                FlatStyle = FlatStyle.Flat,

                // 폰트
                Font = new Font("Segoe UI", 9.5f, FontStyle.Bold),

                // 마우스를 올렸을 때 손가락 모양 커서
                Cursor = Cursors.Hand
            };

            // 버튼 테두리 두께
            btn.FlatAppearance.BorderSize = 1;

            // 배경이 흰색이면 글자색을 테두리색으로 사용
            // 아니면 배경색과 같은 색을 테두리로 사용
            btn.FlatAppearance.BorderColor = back == C_WHITE ? fore : back;

            return btn;
        }


        // -----------------------------------------------------
        // 9-5. 패널 테두리 그리기 메서드
        // -----------------------------------------------------
        void PanelBorder(object sender, System.Windows.Forms.PaintEventArgs e)
        {
            // sender는 이 이벤트를 발생시킨 Panel
            var p = (Panel)sender;

            // 지정한 색상으로 사각형 테두리 그리기
            using (var pen = new Pen(C_BORDER))
                e.Graphics.DrawRectangle(
                    pen,
                    0,
                    0,
                    p.Width - 1,
                    p.Height - 1
                );
        }


        // -----------------------------------------------------
        // 9-6. 경고 메시지 출력 메서드
        // -----------------------------------------------------
        void ShowWarn(string msg)
            => MessageBox.Show(
                msg,
                "알림",
                MessageBoxButtons.OK,
                MessageBoxIcon.Warning
            );
    }
}