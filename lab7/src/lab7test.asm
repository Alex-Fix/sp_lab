.586
.model flat, stdcall
option casemap:none

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


LibName db "lab7dll.dll",0
FunctionName db "PrintUniqueWords",0
DllNotFound db "Cannot load library",0
AppName db "Load explisit Library", 0
NotFound db "PrintUniqueWords function not found",0


string db "test anon ano some text text test test", 0,0
lengthStr dd 39


.data?
    hLib dd ?
    PrintUniqueWordsAddr dd ?
.code

start:
    invoke LoadLibraryA, addr LibName
    .if eax == 0
        invoke MessageBoxA, 0, addr DllNotFound, addr AppName, 40h
    .else
        mov hLib, eax
        invoke GetProcAddress, hLib, addr FunctionName
        .if eax == 0
            invoke MessageBoxA, 0, addr NotFound, addr AppName, 40h
        .else
         push lengthStr
            push offset string
           
            
            
            
            mov PrintUniqueWordsAddr, eax
            call [PrintUniqueWordsAddr]
        .endif
        invoke FreeLibrary, hLib
     .endif
  invoke ExitProcess, 0
end start