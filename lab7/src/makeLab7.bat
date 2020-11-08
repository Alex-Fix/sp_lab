@echo off


\masm32\bin\ml /c /coff lab7dll.asm
\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /DEF:lab7dll.def lab7dll.obj

\masm32\bin\ml /c /Zd /coff lab7test.asm
\masm32\bin\Link /SUBSYSTEM:CONSOLE lab7test.obj