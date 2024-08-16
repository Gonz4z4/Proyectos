.8086
.model tiny
.code
	org 100h

start:
	jmp main

Funcion proc FAR
	push ax
	mov ah, 0fh
	int 10h	
	mov ah, 0	
	int 10h
	pop ax
	iret
endp

DespIntXX dw 0
SegIntXX  dw 0

FinResidente LABEL BYTE               ;Marca el fin de la porción a dejar residente

Cartel    db "Programa instalado exitosamente", 0dh, 0ah, 24h

main:
	mov ax, CS
	mov DS, ax
	mov ES, ax

InstalarInt:
	mov ax, 3581h                      ;obtiene la ISR que esta instalada en la interrupción
	int 21h

	mov DespIntXX, bx
	mov SegIntXX, ES

	mov ax, 2581h                      ;coloca la nueva ISR en el vector de interrupciones
	mov dx, offset Funcion
	int 21h

MostrarCartel:
	mov dx, offset Cartel 
	mov ah, 9
	int 21h

DejarResidente:
	mov ax, (15 + offset FinResidente) ;sumo 15 para asegurarme un paragrafo mas
	shr ax, 1	
	shr ax, 1	
	shr ax, 1	
	shr ax, 1	
	mov dx, ax
	mov ax, 3100h                      ;guarda residente
	int 21h
end start	