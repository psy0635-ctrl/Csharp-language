#include <stdio.h>

int main()
{
	int a = 20;
	float b = 5.15F, c = 12000.149;

	printf("정수형의 다양한 출력 형태\n\n");

	printf("1)%d\n\n", a);
	printf("2)%6d\n\n", a);
	printf("3)%+6d\n\n", a);
	printf("4)%-6d\n\n", a);

	printf("1)%f\n\n", b);
	printf("2)%6.1f\n\n", b);
	printf("3)+%6.1f\n\n", b);
	printf("4)%6f\n\n", c);

	return 0;

}