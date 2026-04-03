using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Program0403
{
    class FirstClass { }

    class SecondClass { }




    internal class Program
    {
        public static void Main(string[] args)
        {
            FirstClass myClass= new FirstClass();
            SecondClass myClass2 = new SecondClass();
            ThirdClass myClass3 = new ThirdClass();

            //string input = "Potato Tomato";
            //Console.WriteLine(input.ToUpper());
            //Console.WriteLine(input.ToLower());

            //Console.WriteLine(input);

            //string input = "감자 고구마 토마토";
            //string[] output = input.Split(' ');

            //for (int i = 0; i < output.Length; i++)
            //{
            //    Console.WriteLine(output[i]);
            //}

            //string input = "감자 고구마 토마토";
            //string output = input.Replace(" ",",");

            //Console.WriteLine(output);

            //string[] array = {"감자", "고구마", "토마토" };

            //Console.WriteLine(string.Join("-----" , array));

            //string[] array = { "감자", "고구마", "토마토" };

            //for (int i = 0; i < array.Length; i++)
            //{
            //    Console.WriteLine(array[i]);

            //    Thread.Sleep(1000);


            ////switch문과 무한 반복문
            //bool state = true;

            //while (state) 
            //{
            //    ConsoleKeyInfo info = Console.ReadKey();  //사용자가 키보드를 누를 때까지 대기
            //    switch (info.Key)       //지금 누른 키가 무엇인지 확인
            //    {
            //        case ConsoleKey.UpArrow:
            //            Console.WriteLine("위쪽 화살표 키가 눌렸습니다.");
            //            break;

            //        case ConsoleKey.RightArrow:
            //            Console.WriteLine("오른쪽 화살표 키가 눌렸습니다.");
            //            break;

            //        case ConsoleKey.LeftArrow:
            //            Console.WriteLine("왼쪽 화살표 키가 눌렸습니다.");
            //            break;

            //        case ConsoleKey.DownArrow:
            //            Console.WriteLine("아래쪽 화살표 키가 눌렸습니다.");
            //            break;

            //        case ConsoleKey.X:
            //            state = false;
            //            break;

            //    }

            //}

            //랜덤한 정수 생성하는 방법
            //Random random = new Random();

            //로또 번호 추천 1~ 45, 5개 중복허용

            //    for (int i = 0; i < 6; i++)             //for문을 이용한 방법
            //    {
            //        Console.WriteLine(random.Next(1, 46));

            //    }
            //}

            //int j = 0;
            //while (j < 6)                             //while문을 이용한 방법
            //{
            //    Console.WriteLine(random.Next(1, 46));
            //    j++;
            //}

            //Random random = new Random();

            //Console.WriteLine(random.NextDouble() * 10);   //NextDouble = 0.0이상 1.0미만의 랜덤한 실수 생성

            //int num = random.Next(0, 10);
            //double num2 = random.NextDouble();

            //Console.WriteLine(num + num2);
            //Console.WriteLine(random.NextDouble() * 10);

            //List 요소 추가하기
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //foreach (var item in list)
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item);

            //}

            ////List에서 요소 제거하기
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //list.Remove(52);   
            //foreach (var item in list)
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item);

            //}

            //List에서 요소 제거하기
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //list.RemoveAt(0);   //인덱스 0에 있는 요소 제거
            //foreach (var item in list)
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item);

            //}



            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //Random random = new Random();
            //for (int i = 0; i < 100; i++)
            //{
            //    list.Add(random.Next(500));
            //    list.RemoveAt(0);

            //    Console.WriteLine("Count :" + list.Count + "\t Item" + list[0]);
        }
      }
    }
 

