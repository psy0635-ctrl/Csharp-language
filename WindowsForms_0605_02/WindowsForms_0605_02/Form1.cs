using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ActMultiLib;

namespace WindowsForms_0605_02
{
    public partial class Form1 : Form
    {
        // ★ PLC 통신 객체 선언
        ActEasyIF plc = new ActEasyIF();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // PLC 통신 설정
            plc.ActLogicalStationNumber = 1; // 시뮬레이터 국번 (보통 1)

            int ret = plc.Open(); // 연결 시작
            if (ret != 0)
            {
                MessageBox.Show($"PLC 연결 실패! 오류코드: {ret}");
            }
            else
            {
                MessageBox.Show("PLC 연결 성공!");
            }
        }

        // =============================================
        //  PLC에 명령 보내는 핵심 함수 (공통으로 사용)
        // =============================================
        // deviceName : "Y01", "Y02" 등 Y 디바이스 주소
        // value      : 1 = ON(동작), 0 = OFF(정지)
        private void PLC쓰기(string deviceName, int value)
        {
            int[] data = new int[] { value }; // 보낼 데이터 배열
            int ret = plc.WriteDeviceBlock2(deviceName, 1, ref data[0]);

            if (ret != 0)
            {
                MessageBox.Show($"{deviceName} 쓰기 실패! 오류코드: {ret}");
            }
        }

        //  B 실린더 전진 버튼 (Y01 = ON)
        private void btnB_Forward_Click(object sender, EventArgs e)
        {
            PLC쓰기("Y01", 1); // B 전진 ON
            PLC쓰기("Y02", 0); // B 후진 OFF (동시 작동 방지)
        }

        //  B 실린더 후진 버튼 (Y02 = ON)
        private void btnB_Backward_Click(object sender, EventArgs e)
        {
            PLC쓰기("Y02", 1); // B 후진 ON
            PLC쓰기("Y01", 0); // B 전진 OFF (동시 작동 방지)
        }

        //  C 실린더 전진 버튼 (Y03 = ON)
        private void btnC_Forward_Click(object sender, EventArgs e)
        {
            PLC쓰기("Y03", 1); // C 전진 ON
            PLC쓰기("Y04", 0); // C 후진 OFF (동시 작동 방지)
        }

        //  C 실린더 후진 버튼 (Y04 = ON)
        private void btnC_Backward_Click(object sender, EventArgs e)
        {
            PLC쓰기("Y04", 1); // C 후진 ON
            PLC쓰기("Y03", 0); // C 전진 OFF (동시 작동 방지)
        }

        //  폼 닫힐 때 PLC 연결 해제
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            plc.Close();
        }
    }
}
