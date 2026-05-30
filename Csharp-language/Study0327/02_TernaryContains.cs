using System;

namespace Study0327
{
    // 주제: 삼항 연산자, String.Contains()
    internal class TernaryContains
    {
        static void Main(string[] args)
        {
            // ── 1. 삼항 연산자 ─────────────────────────────────────────
            Console.Write("숫자를 입력하세요 : ");
            int number = int.Parse(Console.ReadLine());
            Console.WriteLine(number % 2 == 0 ? "짝수" : "홀수");

            // ── 2. String.Contains() ──────────────────────────────────
            Console.Write("입력 : ");
            string line = Console.ReadLine();

            if (line.Contains("안녕"))
                Console.WriteLine("안녕하세요...!");
            else
                Console.WriteLine("^^");
        }
    }
}
