using System;

namespace Study0327
{
    // 주제: foreach 반복문, break
    internal class ForEach
    {
        static void Main(string[] args)
        {
            // ── 1. foreach (타입 명시) ─────────────────────────────────
            string[] fruits = { "사과", "배", "포도", "딸기", "바나나" };
            foreach (string item in fruits)
                Console.WriteLine(item);

            // ── 2. foreach (var 사용) ──────────────────────────────────
            foreach (var item in fruits)
                Console.WriteLine(item);

            // ── 3. break: 짝수 입력 시 반복 종료 ─────────────────────
            while (true)
            {
                Console.Write("숫자를 입력하세요 (짝수 입력 시 종료): ");
                int input = int.Parse(Console.ReadLine());
                if (input % 2 == 0)
                    break;
            }
        }
    }
}
