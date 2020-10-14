#define _CRT_SECURE_NO_WARNINGS
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <math.h>

extern "C" double calc(double);

extern "C" {
	float const_c = 0;
	float const_d = 0;
}

int main() {
	int length = 0;

	printf("Const c = ");
	scanf("%f", &const_c);
	printf("Const d = ");
	scanf("%f", &const_d);

	printf("Enter length of array: ");
	scanf("%d", &length);

	double* A = (double*)calloc(length, sizeof(double));
	double* X = (double*)calloc(length, sizeof(double));

	for (int i = 0; i < length; i++) {
		printf("A[%d] = ", i);
		scanf("%lf", &A[i]);
	}
	
	for (int i = 0; i < length; i++) {
		X[i] = calc(A[i]);
	}

	printf("\nResults:\n\n");
	for (int i = 0; i < length; i++) {
		printf("X[%d] = %lf\n", i, X[i]);
	}


	printf("\n\nThe result is formed on C\n\n");
	for (int i = 0; i < length; i++) {
		if (const_c > const_d) {
			if (A[i] == 0 || 53.0/A[i]+const_d-4.0*A[i] < 0 || 1 + A[i] * const_c == 0) {
				printf("X[%d] = Error! Divide by zero or the sqrt is negative!\n", i);
			} else {
				double result = sqrt(53.0 / A[i] + const_d - 4.0 * A[i]) / (1.0 + A[i] * const_c);
				printf("X[%d] = %lf\n", i, result);
			}
		}
		else {
			if (15.0*A[i]<0 ||const_c*const_d - 1 == 0) {
				printf("X[%d] = Error! Divide by zero or the sqrt is negative!\n", i);
			}
			else {
				double result = (sqrt(15.0 * A[i]) + const_d - A[i]/4.0)/(const_c*const_d-1.0);
				printf("X[%d] = %lf\n", i, result);
			}
		}
	}

	
	free(A);
	free(X);
	_getch();
	return 0;
}