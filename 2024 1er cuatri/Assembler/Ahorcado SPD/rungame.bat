@echo off
cd C:\Tasm 1.4\Tasm
tasm ahorlib.asm
tasm ahor.asm
tlink ahor ahorlib

tasm int81
tlink /t int81
int81

ahor.exe
