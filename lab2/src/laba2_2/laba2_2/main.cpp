#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <conio.h>

extern "C" int calc(int, char, short);
extern "C"
{
	int K = 0x7055E0AC;
};

int main() {
	int b = 0;
	char e = 0;
	short f = 0;

	printf("Enter numbers:\n");
	printf("B = ");
	scanf("%d", &b);
	printf("E = ");
	scanf("%hhd", &e);
	printf("F = ");
	scanf("%hd", &f);

	calc(b, e, f);

	_getch();
	return 0;
}