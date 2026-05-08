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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //    DialogResult result;

            //    result = MessageBox.Show("내용", "제목", MessageBoxButtons.YesNo);

            //    if (result == DialogResult.Yes)
            //    {
            //        MessageBox.Show("Yes를 클릭");
            //    }
            //   else
            //    {
            //        MessageBox.Show("No를 클릭");
            //    }

            Form2 child = new Form2();
            child.SetTextBox(textBox1);           // ① Form1의 textBox1 참조 전달
            child.SetMyTextBoxText("Form1에서 수정"); // ② ShowDialog() 전에 텍스트 설정
            child.ShowDialog();                   // ③ Form2 열기
            MessageBox.Show("TEST");             // ④ Form2 닫힌 후 실행
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //toolStripStatusLabel1.Text = "코드에서 바꿈";
            System.Diagnostics.Process.Start("notepad.exe");
        }

        private void label1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("notepad.exe");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            List<string> strings = new List<string>();

            foreach (var item in groupBox1.Controls)
            {
                if (item is CheckBox)
                {
                    CheckBox checkBox = (CheckBox)item;
                    if (checkBox.Checked)
                    {
                        strings.Add(checkBox.Text);
                    }
                }
            }
            MessageBox.Show(string.Join(",", strings));
        }

        private void button4_Click(object sender, EventArgs e)
        {
            List<string> strings = new List<string>();
            String selectedText = "";

            foreach (var item in Controls)
            {
                if (item is RadioButton)
                {
                    RadioButton checkBox = (RadioButton)item;
                    if (checkBox.Checked)
                    {
                        strings.Add(checkBox.Text);
                        break;
                    }
                }
            }
            MessageBox.Show(selectedText);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            productBindingSource.Add(
            new Product()
            {
                Name = "사과",
                Price = 5000
            });

            productBindingSource.Add(
           new Product()
           {
               Name = "포도",
               Price = 10000
           });
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int index = comboBox1.SelectedIndex;

            string name = ((Product)comboBox1.Items[index]).Name;
            int price = ((Product)comboBox1.Items[index]).Price;
            MessageBox.Show("항목 : " + name + "\n 가격 : " + price);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            int index = listBox1.SelectedIndex;

            if (index < 0)
                return;

            bindingSource1;

            listBox2.Items.Add(listBox1.Items[index].ToString());
            listBox1.Items.RemoveAt(index);

        }

        private void button7_Click(object sender, EventArgs e)
        {
            int index = listBox2.SelectedIndex;

            if (index < 0)
                return;

            listBox1.Items.Add(listBox2.Items[index].ToString());
            listBox2.Items.RemoveAt(index);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            int sum = 0;
            foreach(Product p in bindingSource1)
            {
                sum += p.Price;
            }
            MessageBox.Show("총합 : " + sum);
        }
    }
}
