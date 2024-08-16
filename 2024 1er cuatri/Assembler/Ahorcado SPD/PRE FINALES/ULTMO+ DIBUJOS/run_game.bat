@echo off
cd C:\Tasm 1.4\Tasm
tasm ahorlib.asm
tasm ahor.asm
tlink ahor ahorlib
ahor.exe
