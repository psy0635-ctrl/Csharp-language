using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Program0327.cs
{
    internal class Program01
    {
        static void Main(string[] args)
        {
            Console.Write("숫자를 입력하세요 : ");

            String s = Console.ReadLine();

            int input = int.Parse(s);

            int result = input % 2;


            // switch 조건문 (홀짝 구분)
            switch (result)
            {
                case 0:
                    Console.WriteLine("짝수입니다.");
                    break;
                case 1:
                    Console.WriteLine("홀수입니다.");
                    break;
            }


            //  switch 조건문 --> if 조건문 (홀짝 구분)
            if (result == 0)
            {
                Console.WriteLine("짝수입니다.");
            }
            else if (result == 1)
            {
                Console.WriteLine("홀수입니다.");

            }


            // switch 조건문 (계절 구분) --> break문을 의도적으로 사용하지 않는 예
            Console.Write("이번 달은 몇 월인가요 : ");

            int input = int.Parse(Console.ReadLine());

            switch (input)
            {
                case 12:
                case 1:
                case 2:

                    Console.WriteLine("겨울입니다.");
                    break;

                case 3:
                case 4:
                case 5:
                    Console.WriteLine("봄입니다.");
                    break;
                case 6:
                case 7:
                case 8:
                    Console.WriteLine("여름입니다.");
                    break;

                case 9:
                case 10:
                case 11:
                    Console.WriteLine("가을입니다.");
                    break;

                default:
                    Console.WriteLine("대체 어떤 행성에 살고 계신가요?");
                    break;
            }


            // if 조건문(계절 구분) -- > break문을 의도적으로 사용하지 않는 예
            Console.WriteLine("이번 달은 몇 월인가요 : ");

            String s = Console.ReadLine();

            int input = int.Parse(s);

            if (input < 1 || input > 12)
            {
                Console.WriteLine("대체 어떤 행성에 살고 계신가요?");
            }

            else if (input <= 2 || input == 12)
            {
                Console.WriteLine("겨울입니다.");
            }

            else if (input <= 5)
            {
                Console.WriteLine("봄입니다.");
            }
            else if (input <= 8)
            {
                Console.WriteLine("여름입니다.");
            }
            else
            {
                Console.WriteLine("가을입니다.");
            }


            // 삼항 연산자 사용 예
            Console.WriteLine(number % 2 == 0 ? true : false);



            // String.Contains() 메서드 사용 예
            Console.WriteLine("입력:");

            string line = Console.ReadLine();

            if (line.Contains("안녕"))
            {
                Console.WriteLine(("안녕하세요...!"));
            }
            else
            {
                Console.WriteLine("^^");
            }


            Console.WriteLine("출력");
            Console.WriteLine("출력");
            Console.WriteLine("출력");
            Console.WriteLine("출력");
            Console.WriteLine("출력");


            // for 반복문 사용 예
            for (int i = 0; i < 1000; i++)   // for (초기화; 조건식; 증감식)
            {
                Console.WriteLine("출력");
            }

            for (int i = 0; i <= 10; i++)
            {
                Console.WriteLine(i); Co
            }

            int sum = 0;

            for (int i = 1; i <= 100; i++)
            {
                sum += i;
            }
            Console.WriteLine(sum);


            // 배열과 반복문 사용 예
            int[] intArray = { 52, 273, 32, 65, 103 };
            {
                Console.WriteLine(intArray[0]);
                Console.WriteLine(intArray[1]);
                Console.WriteLine(intArray[2]);
                Console.WriteLine(intArray[3]);
                Console.WriteLine(intArray[4]);
            }


            // 배열과 반복문 사용 예
            int[] intArray = { 52, 273, 32, 65, 103 };

            for (int i = 0; i < intArray.Length; i++)
            {
                Console.WriteLine(intArray[i]);
            }

            int[] array = new int[100];

            for (int i = 0; i < array.Length; i++)
            {
                array[i] = i + 1;
            }
            for (int i = 0; i < array.Length; i++)
            {
                Console.WriteLine(array[i]);
            }


            // while 반복문 사용 예
            int[] intArray = { 52, 273, 32, 65, 103 };
            int cnt = 0;

            while (cnt < intArray.Length)
            {
                Console.WriteLine(cnt + "번째 출력" + intArray[cnt]);
                cnt++;
            }


            // while 반복문 사용 예
            while (!Console.ReadLine().Contains("X"))
            {

            }
            Console.WriteLine("프로그램 종료");



            // foreach 반복문 사용 예
            string[] array = { "사과", "배", "포도", "딸기", "바나나" };

            foreach (string item in array)
            {
                Console.WriteLine(item);
            }

            string[] array = { "사과", "배", "포도", "딸기", "바나나" };

            foreach (var item in array)
            {
                Console.WriteLine(item);
            }


            //break 조건문 or 반복문 탈출 예
            while (true)
            {
                Console.WriteLine("숫자를 입력하세요 (짝수입력시 종료): ");
                int input = int.Parse(Console.ReadLine());
                if (input % 2 == 0)
                {
                    break;
                }
            }



        }
    }
}
