.8086
.model small
.stack 100h
.data
	;MENSAJES---------------------------------------
	bienvenida db "Bienvenido al recupe del 2o parcial de Gonzalo Arias", 0dh, 0ah
	db "Ingrese un caracter para finalizar la entrada de texto",0ah, 0dh, 24h
	ingreseTxt db "Ingrese una cadena de caracteres, seguido del caracter de finalizacion",0ah, 0dh, 24h
	salto db 0dh,0ah, 24h ;salto de linea para las impresiones
	menu db "MENU:",0ah, 0dh
	db "1) Contar cantidad de caracteres y mostrar en pantalla",0ah, 0dh
	db "2) invertir texto",0ah, 0dh
	db "3) Volver a cargar texto",0ah, 0dh
	db "0) SALIR",0ah, 0dh
	db "Seleccion->",24h 
	caracteresTxt db "Cantidad de caracteres:",24h
	reinicioCargaTxt db "Ingrese un caracter ara finalizar la entrada de texto", 0ah,0dh,24h
	inversoTxt db "El inverso es: ",0ah,0dh,24h
	gracias db "Eso fue todo!",0ah, 0dh, 24h

	;VARIABLES
	caracter db "0",0dh,0ah,24h
	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h
	nroAscii db "000",0dh,0ah,24h
	cantidad db 0

	;ERRORES
	error db "Ingrese una opcion valida :(",0dh,0ah,24h
.code
	extrn imprimir:proc
	extrn carga:proc
	extrn contarCaracteres:proc
	extrn regToAscii:proc
	extrn limpiarVariables:proc
	extrn reinicioCarga:proc

main proc
    mov ax, @data 
    mov ds, ax 

    mov bx, 0

    lea bx, bienvenida
    push bx
    call imprimir

    mov ah, 1
    int 21h
    mov caracter, al

    lea bx, ingreseTxt
    push bx
    call imprimir

    xor ax,ax
    mov al, caracter
    lea dx, texto
    call carga


programa:
	lea bx, menu
	push bx
	call imprimir

	mov ah, 1
	int 21h
	mov opcion,al

	cmp opcion, 30h
	je graciasProc

	cmp opcion, 31h
	je contarChar

	cmp opcion, 32h
	je inverso

	cmp opcion, 33h
	je reinicioCargaProc

errorProc:
	lea bx, error
	push bx
	call imprimir
	jmp programa

graciasProc:
	jmp graciasProc2
contarChar:
	lea dx, texto
	call contarCaracteres
	
	lea bx, nroAscii
	call regToAscii

	lea bx, caracteresTxt
	push bx
	call imprimir

    lea bx, nroAscii
    push bx
    call imprimir

    lea bx, nroAscii
    xor ch,ch
    mov cl, 1
    call limpiarVariables
    mov dl, 0

    jmp programa

inverso:
	lea dx, texto
	call contarCaracteres

	lea bx, inversoTxt
	push bx
	call imprimir

	call impPaTras

	jmp programa

reinicioCargaProc:
	xor bx,bx
	xor cx,cx
  	mov bx, offset texto
  	mov cl, 4
    call limpiarVariables

    lea bx, reinicioCargaTxt
    push bx
    call imprimir
    mov ah, 1
    int 21h
    mov caracter, al

    lea bx, ingreseTxt
    push bx
    call imprimir

    xor ax,ax
    mov al, caracter
    lea dx, texto
    call carga

    jmp programa


graciasProc2:
	lea bx, gracias
	push bx
	call imprimir

fin:
    mov ax, 4c00h
    int 21h
main endp

impPaTras proc
	;RECIBE EN DL LA CANTIDAD DE CARACTERES
	push si
	push dx
	push ax
	push cx
	xor dh,dh
	mov cx, dx
	mov si,dx
	dec si
	impParatrasProc:
		mov dl, texto[si]
		mov ah,2
		int 21h
		dec si
	loop impParatrasProc

	pop cx
	pop ax
	pop dx
	pop si
	ret
impPatras endp
end