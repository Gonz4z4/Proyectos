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
	db "1) Contar cantidad de espacios",0ah, 0dh
	db "2) Contar cantidad de parrafos",0ah, 0dh
	db "3) Contar largo de la cadena",0ah, 0dh
	db "4) Contar numeros",0ah, 0dh
	db "0) SALIR",0ah, 0dh
	db "Seleccion->",24h 

	gracias db "Eso fue todo!",0ah, 0dh, 24h

	;VARIABLES
	caracter db "0",0dh,0ah,24h
	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h

	;ERRORES
	error db "Ingrese una opcion valida :(",0dh,0ah,24h
.code
	extrn imprimir:proc
	extrn carga:proc

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
	jne fin


graciasProc:
	lea bx, gracias
	push bx
	call imprimir

fin:
    mov ax, 4c00h
    int 21h
main endp
end