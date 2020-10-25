#include <conio.h>
#include "../Lab6/dllprinter.h"

int main() {
	char str[] = "testfasdf test\tano test ano ano text test ano";
	cout <<"Before: "<< str << endl<<"After: ";

	PrintText(str, sizeof(str));

	_getch();
	return 0;
}