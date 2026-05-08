using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms0508
{
    public partial class Form2 : Form
    {
        TextBox myText;
        public Form2()
        {
            InitializeComponent();
        }
        public void SetTextBox(TextBox tb)
        {
          myText = tb;
        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            myText.Text = "Form2에서 수정되었습니다.";
        }

        public void SetMyTextBoxText(String msg)
        {
            textBox1.Text = msg;
        }
    }
}
