#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main(void)
{
    int n;

    printf("숫자 입력: ");
    scanf("%d", &n);

    // 바로 계산해서 출력 (변수 최소화)
    printf("홀수의 합: %d\n", ((n + 1) / 2) * ((n + 1) / 2));

    return 0;
}