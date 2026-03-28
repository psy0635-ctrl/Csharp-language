using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Program0327.cs
{
    internal class Program01
    {
        static void Main(string[] args)
        {
            //    if(DateTime.Now.Hour < 11)
            //    {
            //        Console.WriteLine("아침 먹을 시간입니다.");
            //    }
            //   else if(DateTime.Now.Hour < 15)
            //    {
            //         Console.WriteLine("점심 먹을 시간입니다.");
            //    }
            //    else
            //    {    Console.WriteLine("저녁 먹을 시간입니다.");
            //    }

            //if(DateTime.Now.Hour < 18)
            //   {
            //       Console.WriteLine("활동시간입니다.");
            //   }
            // else
            //   {
            //       Console.WriteLine("휴식시간 입니다.");
            //   }

            //Console.WriteLine("시간을 입력하세요.");

            //String s = Console.ReadLine();

            //int time = int.Parse(s);

            //if (9 <= time && time <= 18)
            //{
            //    Console.WriteLine("근무시간");
            //}
            //else
            //{
            //    Console.WriteLine("근무 시간 아님");
            //}

            Console.WriteLine("현재 시간을 입력하세요");

            String s = Console.ReadLine();

            int time = int.Parse(s);

            if (time < 8)
            {
                Console.WriteLine("아직 준비 중");
            }
            else if (time <= 16)
               {
                Console.WriteLine("수업 중");
                }

               else
                {
                Console.WriteLine("하교 후");
                 }
        }
    }
}
