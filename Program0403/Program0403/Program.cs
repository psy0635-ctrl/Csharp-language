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
            FirstClass first = new FirstClass();   //FirstClass 타입의 객체 first 생성
            SecondClass second = new SecondClass();
            ThirdClass third = new ThirdClass();


            ////문자열 처리하기
            //string input = "Potato Tomato";
            //Console.WriteLine(input.ToUpper()); //모든 글자를 대문자로 바꿈
            //Console.WriteLine(input.ToLower()); //모든 글자를 소문자로 바꿈
            //       //----->원본을 바꾸는 게 아니라 “새로운 문자열”을 만듦
            //Console.WriteLine(input);


            ////문자열 자르기
            //string input = "감자 고구마 토마토";
            //string[] output = input.Split(' ');    // ' ' = 공백(스페이스) 기준으로 나눔

            //for (int i = 0; i < output.Length; i++)
            //{
            //    Console.WriteLine(output[i]);   // Split = 문자열을 잘라서 배열로 만드는 함수
            //}

            ////문자 바꾸기
            //string input = "감자 고구마 토마토";
            //string output = input.Replace(" ", ",");  //" " (공백)을 "," (콤마)로 바꿈

            //Console.WriteLine(output);  // Replace = 문자열 안의 특정 문자를 다른 문자로 바꿈


            //// 배열 합치기
            //string[] array = { "감자", "고구마", "토마토" }; //문자열 배열 생성

            //Console.WriteLine(string.Join("-----", array));
            //// Join = 배열을 하나의 문자열로 합침 --> "-----"를 사이에 넣음



            //string[] array = { "감자", "고구마", "토마토" };

            //for (int i = 0; i < array.Length; i++)      //배열 전체 반복
            //{
            //    Console.WriteLine(array[i]);            //하나씩 출력

            //    Thread.Sleep(1000);     //1초 동안 멈춤 -- 단위 = 밀리초(ms) 1000ms = 1s
            //}


            ////switch문과 무한 반복문
            //bool state = true;  // 반복을 계속할지 말지 결정하는 변수

            //while (state)   // state가 true인 동안 계속 반복
            //{
            //    ConsoleKeyInfo info = Console.ReadKey();  //사용자가 키보드를 누를 때까지 대기→ 키 입력 받기
            //    switch (info.Key)       //지금 누른 키가 무엇인지 확인 --> switch로 키별 처리
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


            //    랜덤한 정수 생성하는 방법

            //    Random random = new Random();   //  랜덤 숫자를 만들어주는 기계 생성

            //    로또 번호 추천 1~45, 6개 중복허용

            //        for (int i = 0; i < 6; i++)             //for문을 이용한 방법
            //    {
            //        Console.WriteLine(random.Next(1, 46));  //1 ~ 45 까지 나옴

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

            //int num = random.Next(0, 10);       //0 ~ 9까지의 랜덤한 정수 생성
            //double num2 = random.NextDouble();  //0.0 ~ 1.0미만의 랜덤한 실수 생성

            //Console.WriteLine(num + num2);  //정수와 실수 더하기 → 실수로 나옴


            ////List 요소 추가하기 - 크기가 늘어나는 배열
            //List<int> list = new List<int>();  //정수(int)를 여러 개 저장할 수 있는 리스트 생성
            ////List<int> = 정수(int)만 저장 가능한 리스트 , list = 변수 이름(변경 가능), new List<int>() = 객체 생성(진짜 리스트(실제 저장공간)를 생성)

            //list.Add(52);       
            //list.Add(273);              // 리스트에 값 추가
            //list.Add(32);
            //list.Add(64);

            //foreach (var item in list)      //리스트에 있는 값을 하나씩 꺼냄
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item); 
            //    //list.Count = 리스트에 있는 요소의 개수, item = 리스트에서 꺼낸 요소

            //}


            ////List에서 값으로 제거하기
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);          //현재 = [52,273,32,64]
            //list.Add(32);
            //list.Add(64);

            //list.Remove(52);  // 리스트에서 "52" 값을 찾아서 삭제(같은 값 여러 개면 → 첫 번째만 삭제)
            //foreach (var item in list)
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item);

            //}

            ////List에서 위치로 제거하기
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //list.RemoveAt(0);   //인덱스 0번째 위치(첫 번째 값) 삭제
            //foreach (var item in list)
            //{
            //    Console.WriteLine("Count:" + list.Count + "\t Item" + item);

            //}


            // 리스트를 계속 “밀면서(앞 제거 + 뒤 추가)” 유지하는 구조
            // --> 컨베이어 벨트 / 대기열(queue) 같은 느낌 - 항상 최신 데이터만 유지됨
            //List<int> list = new List<int>();

            //list.Add(52);
            //list.Add(273);
            //list.Add(32);
            //list.Add(64);

            //Random random = new Random();    //랜덤 숫자 생성 기계 만들기
            //for (int i = 0; i < 100; i++)
            //{
            //    list.Add(random.Next(500));   //0 ~ 499 랜덤 숫자 생성해서 맨 뒤에 추가
            //    list.RemoveAt(0);             //맨 앞 요소 삭제


            //    Console.WriteLine("Count :" + list.Count + "\t Item" + list[0]);
            // 뒤에 추가하고 앞에서 제거하면서 최신 데이터만 유지하는 코드


            //Console.WriteLine(Math.Abs(-5));  //절대값 구하는 메서드

            //Console.WriteLine(Math.Max(52, 273));  //두 수 중에서 큰 수를 구하는 메서드
            //    Console.WriteLine(Math.Min(52, 273));  //두 수 중에서 작은 수를 구하는 메서드

            //    Console.WriteLine(Math.Pow(2, 10));  //2의 10제곱을 구하는 메서드


            //Console.WriteLine("입력 : ");

            //int input = int.Parse(Console.ReadLine());

            //if (input % 2 == 0)
            //{
            //    Console.WriteLine("짝수입니다.");
            //}
            //else
            //{
            //    Console.WriteLine("홀수입니다.");

            //}

            //👉 숫자를 입력받아서
            //👉 짝수면 "짝수", 홀수면 "홀수" 출력
            //1부터 10까지 출력
            //for (int i = 1; i <= 10; i ++)
            //{
            //    Console.WriteLine(i);
            //}

            //리스트에 숫자 3개 추가하고 전부 출력
            //int[] arr = new int[3];

            //arr[0] = 20;
            //arr[1] = 30;
            //arr[2] = 40;

            //Console.WriteLine(arr[0]);
            //Console.WriteLine(arr[1]);
            //Console.WriteLine(arr[2]);

            ////배열에 숫자 3개 넣고 출력
            //List<int> list = new List<int>();

            //list.Add(20);
            //list.Add(30);
            //list.Add(40);

            //Console.WriteLine(list[0]);
            //Console.WriteLine(list[1]);
            //Console.WriteLine(list[2]);


            ////1부터 5까지 출력
            //int num = 1;

            //while (num <= 5)
            //{

            //    Console.WriteLine(num);
            //    num++;
            //}

            //문자열 입력받아서
            //👉 "안녕" 포함되면 "인사입니다" 출력

            //Console.WriteLine("문자열 입력 : ");
            //String input = Console.ReadLine();

            //if (input.Contains("안녕"))
            //{
            //    Console.WriteLine("인사입니다.");
            //}
            //else
            //{
            //    Console.WriteLine("인사가 아닙니다.");
            //}

            ////1~10 랜덤 숫자 하나 출력
            //Random random = new Random();

            //Console.WriteLine("랜덤한 정수 : " + random.Next(1,11));   //1 ~ 11까지의 랜덤한 정수 생성


            Console.WriteLine("입력 : ");
            int input = int.Parse(Console.ReadLine()); 

            int result = (int)Math.Pow(input, 2);   //input의 제곱 구하기 → 결과는 double이지만 int로 변환해서 저장

            Console.WriteLine("결과 : " + result);

        }
     }
  }
 

