.386
.model flat, c

EXTRN K:dword
PUBLIC calc
.data

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

		ret
	calc ENDP


END