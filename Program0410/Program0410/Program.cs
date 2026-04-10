using System;
using System.Collections.Generic; // List를 사용하기 위해 반드시 필요한 도구상자입니다.
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Program0410  // 코드를 묶는 이름공간 (폴더 같은 개념)
{
    class program     // 프로그램의 큰 틀
    {
        class Product  // 데이터를 담는 설계도
        {
            public string name;  // 이름 (문자열)
            public int price;   // 가격 (정수)

            // 자기 자신의 정보를 출력하는 함수(메서드)
            public void Print()
            {
                Console.WriteLine(name + ":" + price + "원");    // Product 스스로 자기 정보를 출력할 수 있음
            }
        }

        static void Main(string[] args)   // 실제 실행되는 곳
        {
            Product product = new Product();  // Product 틀을 이용해서 실제 객체(product)를 생성
            product.name = "감자";  // 이 객체의 name 칸에 "감자" 저장
            product.price = 3000;   // 이 객체의 price 칸에 3000 저장

            Console.WriteLine(product.name + ":" + product.price + "원");
        }


        // Product 객체들을 담을 수 있는 '리스트(바구니)'를 만듭니다.
        // 일반 배열과 달리 리스트는 개수가 늘어나면 알아서 크기가 조절되어 편리합니다.
        List<Product> list = new List<Product>();

        Product potato = new Product(); // 첫 번째 상품(객체) 만들기
        potato.name = "감자";
            potato.price = 2000;

            Product tomato = new Product(); // 두 번째 상품(객체) 만들기
        tomato.name = "토마토";
            tomato.price = 3000;

            // 바구니(list)에 위에서 만든 상품들을 하나씩 담습니다.
            list.Add(potato);
            list.Add(tomato);

            // 바구니에 담긴 상품들을 하나씩 꺼내서 확인해봅니다. (반복문)
            // 바구니(list)에 있는 것들을 하나씩 꺼내서 'item'이라고 부르겠다"는 뜻입니다.
            foreach (var item in list)
            {
                // item에 담긴 name과 price를 연결해서 화면에 출력합니다.
                Console.WriteLine(item.name + ":" + item.price + "원");

            }


            list<product> list = new list<product>();

            list.add(new product() { name = "감자", price = 2000 });
            list.add(new product() { name = "토마토", price = 3000 });

            foreach (var item in list)  // list 안의 product 객체들을 하나씩 꺼내서 item에 담음
            {
                item.print();           // 각 객체의 print() 메서드 호출
            }

        }
    }
}
