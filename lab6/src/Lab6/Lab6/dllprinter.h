#ifndef _DLL_PRINTER_H_
#define _DLL_PRINTER_H_

#include <iostream>
#include <windows.h>
#include <stdio.h>
using namespace std;

extern "C" __declspec(dllexport) void PrintText(char str[], int length);

#endif