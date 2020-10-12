.386
.model flat, c

includelib "C:\masm32\lib\msvcrt.lib"

EXTRN K:dword

extern C printf:proc

.data

format db "Result =  %x", 13, 10, 0

.code


	calc PROC
		; f = [ebp+8]
		; e = [ebp+12]
		; b = [ebp+16]
		
		push ebp
		mov ebp, esp

		; B/2;
		mov eax, [ebp+8]
		sar eax, 1
		
		; K + B/2
		add eax, K

		; K + B/2 - 4*F
		xor ebx, ebx
		mov bx, [ebp+16]
		sal ebx, 2
		sub eax, ebx

		; K + B/2 - 4*F - E
		mov ebx, [ebp+12]
		sub eax, ebx


		pop ebp
		push eax
		push offset format
		call printf
		pop eax
		pop eax
		ret
	calc ENDP


END