using System;

namespace Study0327
{
    // 주제: for 반복문
    internal class ForLoop
    {
        static void Main(string[] args)
        {
            // ── 1. 기본 for 반복 (1000번 출력) ───────────────────────
            for (int i = 0; i < 1000; i++)
                Console.WriteLine("출력");

            // ── 2. 0 ~ 10 출력 ────────────────────────────────────────
            for (int i = 0; i <= 10; i++)
                Console.WriteLine(i);

            // ── 3. 1부터 100까지의 합 ─────────────────────────────────
            int sum = 0;
            for (int i = 1; i <= 100; i++)
                sum += i;
            Console.WriteLine("1~100 합계: " + sum);   // 5050

            // ── 4. 배열 + for (인덱스 직접 접근) ─────────────────────
            int[] intArray = { 52, 273, 32, 65, 103 };
            for (int i = 0; i < intArray.Length; i++)
                Console.WriteLine(intArray[i]);

            // ── 5. 배열에 값 채우고 출력 ──────────────────────────────
            int[] array = new int[100];
            for (int i = 0; i < array.Length; i++)
                array[i] = i + 1;
            for (int i = 0; i < array.Length; i++)
                Console.WriteLine(array[i]);
        }
    }
}
