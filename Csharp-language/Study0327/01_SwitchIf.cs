using System;

namespace Study0327
{
    // 주제: switch / if 조건문 (홀짝 구분, 계절 구분)
    internal class SwitchIf
    {
        static void Main(string[] args)
        {
            // ── 1. switch 조건문 (홀짝 구분) ──────────────────────────
            Console.Write("숫자를 입력하세요 : ");
            int input1 = int.Parse(Console.ReadLine());
            int result = input1 % 2;

            switch (result)
            {
                case 0:
                    Console.WriteLine("짝수입니다.");
                    break;
                case 1:
                    Console.WriteLine("홀수입니다.");
                    break;
            }

            // ── 2. if 조건문으로 같은 로직 구현 ──────────────────────
            if (result == 0)
                Console.WriteLine("짝수입니다.");
            else
                Console.WriteLine("홀수입니다.");

            // ── 3. switch 조건문 (계절 구분, fall-through 활용) ───────
            Console.Write("이번 달은 몇 월인가요 : ");
            int month = int.Parse(Console.ReadLine());

            switch (month)
            {
                case 12: case 1: case 2:
                    Console.WriteLine("겨울입니다.");
                    break;
                case 3: case 4: case 5:
                    Console.WriteLine("봄입니다.");
                    break;
                case 6: case 7: case 8:
                    Console.WriteLine("여름입니다.");
                    break;
                case 9: case 10: case 11:
                    Console.WriteLine("가을입니다.");
                    break;
                default:
                    Console.WriteLine("대체 어떤 행성에 살고 계신가요?");
                    break;
            }

            // ── 4. if 조건문으로 계절 구분 ────────────────────────────
            Console.Write("이번 달은 몇 월인가요 : ");
            int month2 = int.Parse(Console.ReadLine());

            if (month2 < 1 || month2 > 12)
                Console.WriteLine("대체 어떤 행성에 살고 계신가요?");
            else if (month2 <= 2 || month2 == 12)
                Console.WriteLine("겨울입니다.");
            else if (month2 <= 5)
                Console.WriteLine("봄입니다.");
            else if (month2 <= 8)
                Console.WriteLine("여름입니다.");
            else
                Console.WriteLine("가을입니다.");
        }
    }
}
