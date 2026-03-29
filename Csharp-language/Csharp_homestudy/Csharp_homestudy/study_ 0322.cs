using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Csharp_homestudy
{
    internal class study
    {
        static void Main(string[] args)
        {
            Console.WriteLine("한국\t폴리텍대학");
            Console.WriteLine("한국\n폴리텍대학");
            Console.WriteLine("\"\"W");

            Console.WriteLine("가나다" + "라마바" + "사아자카" + "타파하");

            Console.WriteLine(DateTime.Now.Hour > 9 || DateTime.Now.Hour < 12);
            Console.WriteLine(DateTime.Now.Hour > 9 && DateTime.Now.Hour < 12);

            //int a = 273;
            // int b = 52;

            //Console.WriteLine(a + b);
            // Console.WriteLine(a - b);
            // Console.WriteLine(a * b);
            // Console.WriteLine(a / b);
            // Console.WriteLine(a % b);

            char A = 'a';

            Console.WriteLine(A);

            Console.WriteLine("int:" + sizeof(int));
            Console.WriteLine("long:" + sizeof(long));
            Console.WriteLine("char:" + sizeof(char));
      

            char a = 'a';
            char b = 'b';

            Console.WriteLine(a + b);
            Console.WriteLine(a - b);
            Console.WriteLine(a * b);
            Console.WriteLine(a / b);
            Console.WriteLine(a % b);

            bool one = 10 < 0;
            bool two = 20 > 100;

            Console.WriteLine(one);
            Console.WriteLine(two);

            string output = "hello";
            output += "world";
            output += "!";  
            Console.WriteLine(output);

            int number = 10;
            Console.WriteLine(number);
            Console.WriteLine(number++);
            Console.WriteLine(number--);
            Console.WriteLine(number);
            Console.WriteLine(++number);
            Console.WriteLine(--number);
            Console.WriteLine(number);

            var numberA = 100L;  //long 자료형으로 선언
            var numberB = 100.0; //double 자료형으로 선언 
            var numberC = 100.0F;//float 자료형으로 선언

            Console.WriteLine(int.Parse("52"));
            Console.WriteLine(double.Parse("52.273"));
            Console.WriteLine(float.Parse("52.273"));
            Console.WriteLine(long.Parse("52273"));

            Console.WriteLine(int.Parse("52").GetType());
            Console.WriteLine(double.Parse("52.273").GetType());
            Console.WriteLine(float.Parse("52.273").GetType());
            Console.WriteLine(long.Parse("52273").GetType());

            Console.WriteLine((52).ToString());
            Console.WriteLine((52.273).ToString());
            Console.WriteLine(('a').ToString());
            Console.WriteLine((true).ToString());
            Console.WriteLine((false).ToString());

            double number0 = 52.273103;
            Console.WriteLine(number0.ToString("0.0"));
            Console.WriteLine(number0.ToString("0.00"));
            Console.WriteLine(number0.ToString("0.000"));
            Console.WriteLine(number0.ToString("0.0000"));

            Console.WriteLine(52 + 273);   
            Console.WriteLine("52" + 273);
            Console.WriteLine(52 + "273");
            Console.WriteLine("52" + "273");

            int number10 = 52145;
            string outputA = number10+ "";
            Console.WriteLine(outputA);

            char character = 'a';
            string outputB = character + "";
            Console.WriteLine(outputB);




        }
    }
}
