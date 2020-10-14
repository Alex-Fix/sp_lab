.586
.model flat, c
PUBLIC calc
EXTRN const_c:dword
EXTRN const_d:dword
.data

const_53 dd 53
const_4 dd 4
const_1 dd 1
const_15 dd 15
error db 13, 10,'Not correct value: %lf',13,10,'$'

.code
	
	calc PROC
		push ebp
		mov ebp, esp
		finit
			fld const_d
			fld const_c
			fcom
			fstsw ax
			cmp ax, 3000h
			jne C_LE_D

			fild const_53
			fdiv qword ptr [ebp+8]
			fadd const_d
			fild const_4
			fmul qword ptr [ebp+8]
			fsubr st(0), st(1)
			fsqrt
			fld const_c
			fmul qword ptr [ebp+8]
			fild const_1
			fadd st(0), st(1)
			fdivr st(0), st(2)

			jmp end_proc
			
			C_LE_D:
			fild const_15
			fmul qword ptr [ebp+8]
			fsqrt
			fadd const_d
			fild const_4
			fdivr qword ptr [ebp+8]
			fsubr st(0), st(1)
			fld const_c
			fmul const_d
			fild const_1
			fsubr st(0), st(1)
			fdivr st(0), st(2)

		end_proc:
		pop ebp
		ret
	calc ENDP
END