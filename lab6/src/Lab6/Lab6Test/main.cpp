#include <conio.h>
#include "../Lab6/dllprinter.h"

int main() {
	char str[] = "a b c a";
	cout <<"Before: "<< str << endl<<"After: ";

	PrintText(str, sizeof(str));

	_getch();
	return 0;
}