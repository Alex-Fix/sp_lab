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

.data
buflen dd 256
hello_title db ' Лабораторна робота №5', 0
hello_message db 'ComputerName: '
user_name db 256 dup (0)
.code
Start:
    push offset buflen
    push offset user_name
    call GetComputerNameA

    push 40h
    push offset hello_title
    push offset hello_message
    push 0
    call MessageBoxA
    push 0
    call ExitProcess
end Start

