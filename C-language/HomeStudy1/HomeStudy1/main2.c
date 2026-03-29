#include <stdio.h>

int main(void)
{
	float a = 12.34;
	double b = 56.78;

	printf("float형의 a의 값은 %f입니다.\n", a);
	printf("double형의 b의 값은 %lf입니다.\n", b);
	
	//소수점 자릿수를 조정하면
	printf("소수점 자릿수를 조정한 후의 값\n");
	printf("float형의 a의 값은 %.2f입니다.\n", a);
	printf("double형의 b의 값은 %.3lf입니다.\n", b);

	return 0;
}
