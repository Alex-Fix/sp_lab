#include "dllprinter.h"

extern "C" __declspec(dllexport) void PrintText(char str[], int length){
	char* word = new char[length];
	int wordLength = 0;
	for (int i = 0; i < length; i++) {
		word[i] = '\0';
	}

	//found last word
	for (int i = 0; i < length; i++) {
		if (str[i] == ' ' || str[i] == '\t' || str[i] == '\n') {
			for (int c = 0; c < wordLength; c++) {
				word[c] = '\0';
			}
			wordLength = 0;
			continue;
		}
		word[wordLength] = str[i];
		wordLength++;
	}
	
	wordLength--;
	int resultStrLength = (length - wordLength) * 2 +1;
	char* resultStr = new char[resultStrLength];
	for (int i = 0; i < (length - wordLength) * 2+1; i++) {
		resultStr[i] = '\0';
	}

	int strIndex = 0;
	char* someWord = new char[length - wordLength];
	for (int i = 0; i < length - wordLength-1;) {
		for (int j = 0; j < length - wordLength; j++) {
			someWord[j] = '\0';
		}
		int someWordLength = 0;
		
		for (int j = 0; j < length - wordLength + 1; j++) {
			someWord[j] = '\0';
		}

		for (; strIndex < length;) {
			if (str[strIndex] == ' ' || str[strIndex] == '\t' || str[strIndex] == '\n') {
				strIndex++;
				break;
			}
			someWord[someWordLength] = str[strIndex];
			if (str[strIndex] != '\0') {
				someWordLength++;
			}
			
			strIndex++;
		}

		bool isEq = true;
		if (someWordLength == wordLength) {
			for (int j = 0; j < someWordLength; j++) {
				if (someWord[j] != word[j]) {
					isEq = false;
					break;
				}
			}
		} 
		else {
			isEq = false;
		}

		if (!isEq) {
			for (int j = 0; j < someWordLength; j++, i++) {
				resultStr[i] = someWord[j];
			}
			resultStr[i] = ' ';
			i++;
		}

		
	}

	
	cout << resultStr << endl;
	
}