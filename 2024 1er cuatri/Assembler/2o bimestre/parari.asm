.8086
.model small
.stack 100h
.data

	saltoDeLinea db 0dh,0ah,24h
	texto db 255 dup(24h),0dh,0ah,24h

	bienvenida db "Bienvenido! Introduzca un caracter de finalizacion de cadena: ", 0dh, 0ah, 24h
	cadena db "Introduzca una cadena ", 0dh, 0ah, 24h
	menu db "MENU:1)Contar cantidad de espacios. 2) Contar parrafos. 0) Salir (caracteres y num no disponible)", 0dh, 0ah, 24h
	espaciosText db "Espacios: ", 0dh, 0ah, 24h
	parrafosText db "Parrafos: ", 0dh, 0ah, 24h
	charText db "Caracteres: ", 0dh, 0ah, 24h

	caracter db "a",0dh,0ah,24h
	dataDiv db 100 ,10 ,1 
	eleccion db 0
	cantidad db 0
	cantidadAscii db '000',0dh,0ah,24h

.code




	main proc
		mov ax, @data
		mov ds, ax
 		
 		;COMIENZA EL CODIGO
		mov dx,offset bienvenida
		mov ah,9
		int 21h

		mov ah,1 
		int 21h
		mov caracter,al

		call saltoLinea

		mov dx,offset cadena
		mov ah,9
		int 21h

		mov bx,0
	carga:
		mov ah,1
		int 21h
		cmp al, caracter
		je finCarga
		mov texto[bx],al 

		inc bx
		jmp carga
	finCarga:

		call saltoLinea

	mostrarMenu:
		mov cantidad,0
		mov eleccion,0
		mov dx,offset menu
		mov ah,9
		int 21h

		xor ax,ax
		mov ah,8 
		int 21h
		mov eleccion,al

		cmp eleccion,"0"
		je finProc
		cmp eleccion,"1"
		je espacios
		cmp eleccion,"2" ;MAS O MENOS
		je parrafos
   		;FALTAN 3 Y 4
		jmp finProc

	espacios:
		mov al, " "
		call contadorCar
		jmp mostrarMenu
	parrafos:
		mov al, 0dh
		call cantAscii
		jmp mostrarMenu

	finProc:
		mov ax, 4c00h
		int 21h
	main endp


;hubo errores al subirlo de librerias, lo implemente en el mismo codigo
cantAscii proc
		push bx
		push cx
		push dx
		push ax
		push si
		mov bx,0
		mov cl,0
		sigue2:
			mov al,caracter
			cmp texto[bx],al
			je sumarCaracter
			cmp texto[bx],24h
			je terminaCaracter
			inc bx
			jmp sigue2
		sumarCaracter:
			inc bx
			inc cl
			jmp sigue2
		terminaCaracter:
			mov cantidad,cl

			mov dl, cantidad
			lea bx, cantidadAscii
			lea si, dataDiv
			call regToAscii

			mov dx,offset charText
			mov ah,9
			int 21h

			mov dx,offset cantidadAscii
			mov ah,9
			int 21h
		pop si
		pop ax
		pop dx
		pop cx
		pop bx
	cantAscii endp



	contadorCar proc ;cuenta caracter de al
		push bx
		push cx
		push dx
		push ax
		push si
			mov bx,0
			mov cl,0
		sigue:
			cmp texto[bx],al
			je sumarEspacios
			cmp texto[bx],24h
			je terminaEspacio
			inc bx
			jmp sigue
		sumarEspacios:
			inc bx
			inc cl
			jmp sigue
		terminaEspacio:
			mov cantidad,cl

			mov dl, cantidad
			lea bx, cantidadAscii
			lea si, dataDiv
			call regToAscii

			cmp eleccion,"1"
			je espaciosTexto
			cmp eleccion,"2"
			je parrafosTexto
		parrafosTexto:
			mov dx,offset parrafosText
			mov ah,9
			int 21h	
			jmp finFunc	
		espaciosTexto:
			mov dx,offset espaciosText

			mov ah,9
			int 21h
			jmp finFunc

		finFunc:
			mov dx,offset cantidadAscii
			mov ah,9
			int 21h
		pop si
		pop ax
		pop dx
		pop cx
		pop bx
	contadorCar endp

	saltoLinea proc
		mov dx,offset saltoDeLinea
		mov ah,9
		int 21h
		ret	
	saltoLinea endp


	regToAscii proc
			push ax
			push dx
			push cx
			push si
			push bx

			xor ax, ax	
			mov al, dl

			mov cx, 3 		

		proceso:
			mov dl, [si]
			div dl 
			add [bx],al 
			xchg al, ah  	
			xor ah, ah 
			inc bx 
			inc si
		loop proceso
		
			pop bx
			pop si
			pop cx
			pop dx
			pop ax
			ret
	regToAscii endp
end