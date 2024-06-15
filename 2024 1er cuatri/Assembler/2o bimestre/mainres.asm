.8086
.model small
.stack 100h
.data
	titulo1 db "Ingrese un texto:",0dh,0ah,24h
	titulo2 db "Con que caracter finaliza la carga?",0dh,0ah,24h
	menu db ":: MENU ::",0dh,0ah
	db"[1] CONTAR ESPACIOS",0dh,0ah
	db"[2] CONTAR PARRAFOS",0dh,0ah
	db"[3] CONTAR LARGO DE CADENA",0dh,0ah
	db"[4] CONTAR NUMEROS",0dh,0ah
	db"[0] SALIR",0dh,0ah
	db"OPCION > ",0dh,0ah,24h

	opcionInv db "OPCION INVALIDA",0dh,0ah,24h
	salto db 0dh,0ah, 24h

	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h
	cantidad db 0
	caracter db "0",0dh,0ah,24h
	nroAscii db "000",0dh,0ah,24h

.code
extrn carga:proc
extrn contarCaracteres:proc
extrn regToAscii:proc
extrn imprimir:proc
extrn contarCaracterEsp:proc
extrn contarNumeros:proc
extrn limpiarVariables:proc

main proc
    mov ax, @data 
    mov ds, ax 

    mov bx, 0 ; pone bx en 0

    lea bx, titulo2 
    push bx
    call imprimir

    mov ah, 1
    int 21h
    mov caracter, al

    lea bx, salto
    push bx
    call imprimir


    lea bx, titulo1
    push bx
    call imprimir

    xor ah, ah
    lea dx, texto
    mov al, caracter
    call carga

    lea bx, salto
    push bx
    call imprimir

    lea bx, texto
    push bx
    call imprimir

programa:
    lea bx, menu
    push bx
    call imprimir

    lea dx, opcion
    mov al, 0dh
    call carga

    lea bx, texto
    push bx
    call imprimir

    lea bx, salto
    push bx
    call imprimir

    cmp opcion, 30h
    je fin
    cmp opcion, 31h
    je opcion1
    cmp opcion, 32h
    je opcion2
    cmp opcion, 33h
    je opcion3
    cmp opcion, 34h
    je opcion4
    jne opInv

opcion1:
	lea dx, texto
	mov al, 20h
	call contarCaracterEsp
	jmp RTA

opcion2:
	lea dx, texto
	mov al, 0dh
	call contarCaracterEsp
    add dl, 1
	jmp RTA

opcion3:
	lea dx, texto
	call contarCaracteres
	jmp RTA

opcion4:
	lea dx, texto
	call contarNumeros
	jmp RTA

opInv:
	lea bx, opcionInv
    push bx
    call imprimir
    jmp programa

RTA: ;reg to ascii
	lea bx, nroAscii ;EN DL ESTA EL NUMERO
	call regToAscii

    lea bx, nroAscii
    push bx
    call imprimir

    lea bx, nroAscii
    xor ch,ch
    mov cl, 1
    call limpiarVariables
    mov dl, 0



  jmp programa






jmp programa


fin:
    mov ax, 4c00h
    int 21h
main endp
end