.586
.model flat, c
EXTRN K:dword
PUBLIC calc
.data

.code

	calc PROC
		
		push ebp
		mov ebp, esp

		; X = K + B1/C2 - D2*F2 - E1
		fld dword ptr [ebp + 8]			; st(0) = B1
		fdiv qword ptr [ebp + 12]		; B1/C2
		
		fld  qword ptr [ebp + 20]		; st(0) = D2, st(1) = B1/C2
		fmul qword ptr [ebp + 32]		; st(0) = D2*F2

		fsubr st, st(1)					; st(0) = B1/C2 - D2*F2

		fsub dword ptr [ebp + 28]	; st(0) = B1/C2 - D2*F2 - E1

		fild K							; st(0) = K, st(1) = B1/C2 - D2*F2 - E1
		fadd st, st(1)					; st(0) = K + B1/C2 - D2*F2 - E1
		
		pop ebp
		ret
	calc ENDP

END