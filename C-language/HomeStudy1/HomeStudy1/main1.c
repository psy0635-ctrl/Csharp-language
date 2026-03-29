#include <stdio.h>
//pow()함수를 사용하기위해 <math.h>헤더파일을 포함한다.
#include <math.h>

int main(void)
{
	short a, b;
	unsigned short c;

	a = pow(2, 15) - 1; //2^15 -1 = 32767
	b = pow(2, 15); //2^15 = 32768
	c = pow(2, 15); //2^15 = 32768

	printf("a의 값은 %d입니다.\n", a);
	printf("b의 값은 %d입니다.\n", b);
	printf("c의 값은 %d입니다.\n", c);

	return 0;
}