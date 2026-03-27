using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Program03.cs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            if (a == 0)
            {
                Console.WriteLine("0입니다.");
            }

            else
            {
                Console.WriteLine("0이 아닙니다.");
            }

            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            if (a % 2 == 0)
            {
                Console.WriteLine("짝수입니다.");
            }
            else
            {
                Console.WriteLine("홀수입니다.");
            }

            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            if (a >= 90)
            {
                Console.WriteLine("A 입니다.");
            }
            else if (a >= 80)
            {
                Console.WriteLine("B 입니다.");
            }
            else if (a >= 70)
            {
                Console.WriteLine("C 입니다.");
            }
            else if (a >= 60)
            {
                Console.WriteLine("D 입니다.");
            }
            else
            {
                Console.WriteLine("F 입니다.");
            }

            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            if (0 <= a && a <= 8)
            {
                Console.WriteLine("아직 준비 중");
            }
            else if (9 <= a && a <= 16)
            {
                Console.WriteLine("수업 중");
            }
            else
            {
                Console.WriteLine("하교 후");
            }

            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            switch (a)
            {
                case 1:
                    Console.WriteLine("월요일입니다.");
                    break;

                case 2:
                    Console.WriteLine("화요일입니다.");
                    break;

                case 3:
                    Console.WriteLine("수요일입니다.");
                    break;

                default:
                    Console.WriteLine("잘못된 입력입니다.");
                    break;
            }


            Console.WriteLine("정수를 입력하세요:");

            int a = int.Parse(Console.ReadLine());

            switch (a)
            {
                case 1:
                    Console.WriteLine("커피입니다.");
                    break;
                case 2:
                    Console.WriteLine("콜라입니다.");
                    break;
                case 3:
                    Console.WriteLine("주스입니다.");
                    break;

                default:
                    Console.WriteLine("잘못된 입력입니다.");
                    break;
            }

            for (int i = 1; i <= 5; i++)
            {
                Console.WriteLine(i);
            }

            int sum = 0;

            for (int i = 1; i <= 10; i++)
            {
                sum += i;
            }

            Console.WriteLine(sum);

            for (int i = 1; i <= 10; i++)
            {
                if (i % 2 == 0)
                {
                    Console.WriteLine(i + "는 짝수입니다.");
                }
            }

            for (int i = 1; i <= 9; i++)
            {
                Console.WriteLine(" 2 x " + i + " = " + (2 * i));
            }

            Console.WriteLine("정수를 입력하세요:");

            int n = int.Parse(Console.ReadLine());

            for (int i = 1; i <= n; i++)
            {
                Console.WriteLine(i);
            }

            int i = 1;
            int sum = 0;

            while (i <= 10)
            {
                sum = sum + i;
                i++;
            }

            Console.WriteLine(sum);

            Console.WriteLine("정수를 입력하세요:");
            int n = int.Parse(Console.ReadLine());

            int i = 1;

            while (i <= n)
            {
                Console.WriteLine(i);
                i++;
            }

            int num = 1;

            while (num != 0)
            {
                Console.WriteLine("숫자 입력 (0이면 입력 종료):");
                num = int.Parse(Console.ReadLine());
            }





        }
    }
}
