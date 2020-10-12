.586
.model flat, stdcall
option casemap :none

include C:\masm32\include\user32.inc
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\masm32.inc
include C:\masm32\include\debug.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\masm32.lib
includelib C:\masm32\lib\debug.lib

.data

 A dd 1,2,3,4,5,1,2,3,4,5 ; масив з додатніми елементами

 K dd 10    ; кількість елементів, які потрібно взяти з масиву
 const_c dd -4    ; числова константа
 const_d dd 8    ; числова константа

k_error db 13,10,'Error! K equal or less then zero!',13,10

result dd 0

.code 
start:
    cmp K, 0
    jg kValid
    invoke StdOut, addr k_error
    invoke ExitProcess, 0

    kValid: ; Якщо K більше нуля
        mov edx, const_c
        add edx, const_d

        mov ecx, K
        make_result:
            mov eax, [A+ecx*4-4]
            cmp eax, edx
            jl Ai_l_cd
            cmp eax, 0
            jz Ai_l_cd
            add eax, result
            mov result, eax
            Ai_l_cd:
            dec ecx
            cmp ecx, 0
            jnz make_result

            PrintDec result, "Result"
            invoke ExitProcess, 0

end start