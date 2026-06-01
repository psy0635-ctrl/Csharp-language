using System;

namespace Study0327
{
    // 주제: while 반복문
    internal class WhileLoop
    {
        static void Main(string[] args)
        {
            // ── 1. while + 배열 순회 ──────────────────────────────────
            int[] intArray = { 52, 273, 32, 65, 103 };
            int cnt = 0;

            while (cnt < intArray.Length)
            {
                Console.WriteLine(cnt + "번째 출력: " + intArray[cnt]);
                cnt++;
            }

            // ── 2. 'X'가 입력될 때까지 반복 ──────────────────────────
            Console.WriteLine("'X'를 입력하면 종료됩니다.");
            while (!Console.ReadLine().Contains("X"))
            {
                // 입력 대기
            }
            Console.WriteLine("프로그램 종료");
        }
    }
}
