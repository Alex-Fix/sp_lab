.586
.model flat, STDCALL
option casemap: none

include C:\masm32\include\windows.inc
include C:\masm32\macros\macros.asm

include C:\masm32\include\masm32.inc
include C:\masm32\include\gdi32.inc
include C:\masm32\include\user32.inc
include C:\masm32\include\kernel32.inc

includelib C:\masm32\lib\masm32.lib
includelib C:\masm32\lib\gdi32.lib
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\kernel32.lib

include C:\masm32\include\debug.inc
includelib C:\masm32\lib\debug.lib

.data
fileName db 'C:\\masm32\\bin\\test2.txt', 0
hello_title db ' Лабораторна робота №5 (Варіант 12)', 0
hello_message db 'FileAtrabutes: '
result db 17 dup (0)
.code
Start:
    
    push offset fileName
    call GetFileAttributesA

    ; Конвертація 16-вого числа в строку
    mov ecx, 7
    xor edx, edx
    mov ebx, 10h
    FOR_LOOP: 
        cmp eax, ebx
        jge continue
        xor dx, dx
        mov dl, al
        shr eax, 4
        add edx, 30h
        mov [result + ecx], dl 
        mov edx, 0
        dec ecx
        cmp ecx, 0
        jge FOR_LOOP
        jmp END_FOR
        continue:
            div ebx
            add edx, 30h
            mov [result + ecx], dl
            mov edx, 0
            dec ecx
            cmp ecx, 0
            jge FOR_LOOP
    END_FOR:

    push 40h
    push offset hello_title
    push offset hello_message
    push 0
    call MessageBoxA
    push 0
    call ExitProcess
end Start

