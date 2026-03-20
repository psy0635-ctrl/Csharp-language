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

            Console.WriteLine("덧셈 :" + (num1 + num2));
            Console.WriteLine("뺄셈:" + (num1 - num2));
            Console.WriteLine("곱셈 :" + (num1 * num2));
            Console.WriteLine("나눗셈 :" + ((double)num1 / num2));












        }
    }
}
