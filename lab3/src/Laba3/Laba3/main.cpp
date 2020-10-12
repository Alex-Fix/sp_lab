#include <stdio.h>
#include <conio.h>

extern "C" {
	int K = 0x7055E0AC;
}

extern "C" double calc(float, double, double, float, double);

int main() {

	float B = 0;
	double C = 0;
	double D = 0;
	float E = 0;
	double F = 0;

	double result = 0;

	printf("Enter numbers:\n");
	printf("B = ");
	scanf("%f", &B);
	printf("C = ");
	scanf("%lf", &C);
	printf("D = ");
	scanf("%lf", &D);
	printf("E = ");
	scanf("%f", &E);
	printf("F = ");
	scanf("%lf", &F);

	result = calc(B, C, D, E, F);

	printf("Result = %lf", result);
	printf("\nResult = %x", (int)result);

	_getch();
	return 0;
}