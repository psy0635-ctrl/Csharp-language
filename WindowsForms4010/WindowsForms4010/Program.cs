using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms4010
{
    internal static class Program
    {
        /// <summary>
        /// 해당 애플리케이션의 주 진입점입니다.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();  // 겉모습(테마)
            Application.SetCompatibleTextRenderingDefault(false); // 글자를 화면에 그릴 때 어떤 방식을 쓸지 정하는 옵션입니다.
            Application.Run(new Form1()); // 실제 프로그램 창을 화면에 띄우는 명령
        }
    }
}
