#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {
	//int n;

	//printf("n 값 입력: ");
	//scanf("%d", &n);

	//int count = (n + 1) / 2;
	//int sum = count * count;

	//printf("홀수의 합: %d\n", sum);

	//return 0;


 //   int n;
 //   
	//printf("n의 값을 입력하세요: ");

	//scanf("%d", &n);

	//int count = n  / 2; // 짝수의 개수 계산
	//int sum = count * (count + 1); // 짝수의 합 계산

	//printf("짝수의 합: %d\n", sum);

	//return 0;


	//int n;

	//printf("n의 값을 입력하세요: ");

	//scanf("%d", &n);
 //  

	//int sum = n * (n + 1) / 2;  // 전체 합 계산

	// printf("%d\n", sum);

	//return 0;


	//int age = 0;

	//printf("나이를 입력하세요: ");
	//scanf("%d", &age);

	//printf("당신의 나이는 %d입니다.\n", age);

	//return 0;


	//int age = 0, birthyear= 0;

	//printf("당신의 나이와 출생년도를 입력하세요: ");
	//scanf("%d %d", &age, &birthyear);

	//printf("당신의 나이는 %d이고, 출생년도는 %d입니다.\n", age, birthyear);

	//return 0;


	//printf("\t\"안녕하세요\"\n\n");

	//printf("탈출기법을 제대로 사용한 예\n");
	//printf("\t10%%5 =0\n\n");

	//printf("탈출기법을 제대로 사용하지 않은 예\n");
	//printf("\t10%5 =0\n\n");
	//
	//return 0;


	//문자열 입출력 예제

	//char Name[20];

	//printf("이름을 입력하세요: ");

	//gets(Name);
	//puts(Name);	

	//return 0;



	//int n;    // 사용자로부터 입력받을 정수 변수

	//printf("정수를 입력하세요: ");   // 사용자에게 정수 입력을 요청하는 메시지 출력
	//scanf("%d", &n);				// 사용자로부터 정수를 입력받아 변수 n에 저장
	//								// %d : 정수형 데이터를 입력 받기 위한 형식 지정자
	//								//&n : 변수 n의 메모리 주소 -> scanf는 주소를 통해 입력 받은 값을 직접 저장

	////1부터 n까지 숫자를 for문으로  순서대로 출력

	//for (int i = 1; i <= n; i++) {			// i는 1부터 n까지 1씩 증가하면서 반복

	//	if (i == n)
	//		printf("%d", i);				/*현재 반복 중인 i가 마지막 숫자 n과 같은지 확인
	//										i가 n과 같을 때, 마지막 숫자이므로 줄바꿈 없이 출력*/
	//	else
	//		printf("%d ", i);				// i가 n과 다를 때, 숫자 뒤에 공백을 추가하여 출력
	//	}

	//printf("\n");						// 숫자 출력이 끝난 후 줄바꿈을 추가하여 다음 출력이 새로운 줄에서 시작되도록 함

	//// n 과 5 비교
	//if (n > 5) {						// n이 5보다 크면 참(True)
	//	printf("%d는 5보다 큰 수 입니다.\n",n);
	//}
	//else if (n < 5) {					//앞의 if(n > 5)가 거짓일 때만 이 조건을 검사
	//	printf("%d이 5보다 작은 수 입니다.\n",n);
	//}
	//else {								// 위의 두 조건(n>5, n<5)이 모두 거짓인 경우		
	//	printf("5와 같은 수 입니다.\n");
	//}

	//return 0;

	//int n;

	//printf("정수를 입력하세요: ");
	//scanf("%d", &n);

	//for (int i = 1;i <= n;i++)
	//{
	//	if (i % 2 == 0) {				// i가 짝수인지 확인
	//		printf("%d ", i);			// i가 짝수일 때, 숫자 뒤에 공백을 추가하여 출력
	//	}
	//}
	//	printf("\n");	

	//	if (n % 2 == 0) {				// n이 짝수인지 확인
	//		printf("%d는 짝수입니다.\n", n); // n이 짝수일 때, 해당 메시지 출력
	//	}
	//	else {							// n이 짝수가 아닐 때 (즉, 홀수일 때)
	//		printf("%d는 홀수입니다.\n", n); // n이 홀수일 때, 해당 메시지 출력
	//	}
	//}

	//int n;

	//printf("정수를 입력하세요: ");
	//scanf("%d", &n);

	//for (int i = 1;i <= n;i++)
	//{
	//	if (i % 2 == 1) {					// i가 홀수인지 확인
	//		printf("%d ", i);			// i가 홀수일 때, 숫자 뒤에 공백을 추가하여 출력
	//	}
	//}
	//printf("\n");

	//if (n % 2 == 1) {
	//	printf("%d는 홀수입니다.\n", n); // n이 홀수일 때, 해당 메시지 출력
	//}
	//else
	//{
	//	printf("%d는 짝수입니다.\n", n); // n이 짝수일 때, 해당 메시지 출력
	//}

	//int n;

	//printf("정수를 입력하세요: ");
	//scanf("%d", &n);

	//for (int i = 1; i <= n; i++)
	//{
	//	if (i % 2 == 1) {
	//		printf("%d ", i);
	//	}
	//}
	//	printf("\n");

	//	if (n > 10)
	//	{
	//		printf("%d는 10보다 큽니다.\n", n);
	//	}
	//	else if (n == 10)
	//	{
	//		printf("%d는 10과 같습니다.\n", n);
	//	}
	//	else
	//	{
	//		printf("%d는 10보다 작습니다.\n", n);
	//	}

		//int n;

		//printf("정수를 입력하세요 : ");
		//scanf("%d", &n);

		//for (int i = n; i >= 1;i--)
		//{
		//	if (i == 1)
		//		printf("%d", i);
		//	else
		//		printf("%d ", i);
		//}
		//printf("\n");

		//if (n % 2 == 0)
		//{
		//	printf("%d는 짝수입니다.\n", n);
		//}
		//else
		//{
		//	printf("%d는 홀수입니다.\n", n);
		//}


		//int n;

		//printf("정수를 입력하세요 : ");
		//scanf("%d",&n);

		//for (int i = 1; i <= n; i++)
		//{
		//	if (i == n)
		//		printf("%d",i);
		//	else
		//		printf("%d ",i);
		//}
		//
		//printf("\n");

		//if (n > 5)
		//{
		//	printf("%d는 5보다 큰 수 입니다.",n);
		//}

		//else if (n < 5)
		//{
		//	printf("%d는 5보다 작은 수 입니다.",n);
		//}
		//else
		//{
		//	printf("%d는 5와 같은 수 입니다.",n);
		//}
		//return 0;


    // 직각 삼각형
	//int n = 5;

	//for (int i = 1; i <= n; i++) {      //i를 1로 시작 → 1층부터 출력하겠다는 의미
	//	for (int j = 1; j <= i; j++) {
	//		printf("*");
	//	}
	//	printf("\n");
	//}
	//return 0;

//## 전체 동작 흐름(n = 5)
//```
//i = 1 → j : 1        → * 출력 1번 → \n → 1층 완성 : *
//i = 2 → j : 1, 2      → * 출력 2번 → \n → 2층 완성 : **
//i = 3 → j : 1, 2, 3    → * 출력 3번 → \n → 3층 완성 : ***
//i = 4 → j : 1, 2, 3, 4  → * 출력 4번 → \n → 4층 완성 : ****
//i = 5 → j : 1, 2, 3, 4, 5→ * 출력 5번 → \n → 5층 완성 : *****
//i = 6 →(6 <= 5 거짓) → for문 종료
//```
//
//-- -
//
//## 이중 for문 관계 정리
//```
//바깥 for문(i)                 안쪽 for문(j)
//─────────────────────────────────────────────
//i = 1  ──────────────────────→ j = 1          → * 1개
//i = 2  ──────────────────────→ j = 1, 2       → * 2개
//i = 3  ──────────────────────→ j = 1, 2, 3    → * 3개
//i = 4  ──────────────────────→ j = 1, 2, 3, 4 → * 4개
//i = 5  ──────────────────────→ j = 1~5        → * 5개
//↑                        ↑
//층 수 결정               별 개수 결정(j <= i 에 연동)

	//정삼각형 피라미드

	int n = 5;

	for (int i = 1; i <= n; i++) {
		for (int j = 1; j <= n - i; j++) {
			printf(" ");
		}
		for (int j = 1; j <= 2 * i - 1; j++) {
			printf("*");
		}
		printf("\n");

	}
	return 0;
	
	
}
	


