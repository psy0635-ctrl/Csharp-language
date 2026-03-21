using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1_0313
{
    internal class Program     //간단 계산기 프로그램
    {
        static void Main(string[] args)  
        {
            Console.Write("첫번째 숫자 입력 :"); 
            int num1 = int.Parse(Console.ReadLine());

            Console.Write("두번째 숫자 입력 :"); 
            int num2 = int.Parse(Console.ReadLine());

            Console.WriteLine(num1 + "+" + num2 + "=" + (num1 + num2));
            Console.WriteLine(num1 + "-" + num2 + "=" + (num1 - num2));
            Console.WriteLine(num1 + "*" + num2 + "=" + (num1 * num2));
            Console.WriteLine(num1 + "/" + num2 + "=" + ((double)num1 / num2));

            bool one = 10 < 0;
            bool two = 20 > 0;
            Console.WriteLine(one);
            Console.WriteLine(two);












        }
    }
}
