.8086
.model small
.stack 100h
.data
	nroLeido db '000', 24h
	reg db 212
	noAscii db '000', 0dh,0ah,24h
	divisores db 100,10,1
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov cx, 3 ; para el loop
		mov bx,0
		;CAJA DE CARGA
		carga:
			mov ah, 1
			int 21h
			mov nroLeido[bx], al
			inc bx
		loop carga ;hace carga hasta que se ttermine cx (creo)

		;ASCII TO REG (atr)
		
		lea bx, nroLeido ;no hay nombre de variables afuera, necesito pasarlo por registro
		;en vez de usar texto[bx] se usa solo [bx] dentro de las funciones
		lea si, divisores
		call asciiToReg
		lea bx nroAscii

		;REG TO ASCII
		;se que en dl esta el offset
		call regToAscii

			xor ah, ah
			mov ax, reg ;aca me falta!! no se que puso



		mov ah,9
		lea dx,noAscii ;leo lo que hay en el array
		int 21h
	
		mov ax, 4c00h
		int 21h
	main endp

	;RECIBE EN DL UN NRO DE UN BYTE
	;DEVUELVE OFFSET (DIRECCION)
	;UNA VARIABLE CON 3 ASCII LLENA
	regToAscii proc
		push ax
		push cx
		push si
		mov dx,0
		mov bx, 0 
		mov cx, 3 ;de vuelta para el loop
		atr:
			mov al, [bx]
			sub al, 30h
			mov dl, [si]
			mul dl ;multiplica al por el [bx]
			add dh, al ; le sumo a reg el al
			xor ax, ax ;limpio ax para que este en 0
			inc bx
			inc si
		loop atr

		mov dl, dh
		mov dh, 0
		pop ax
		pop cx
		pop si
		ret

	regToAscii endp

		
	;RECIBE EN BX EL OFFSET DE UNA VARIABLE LLENA CON 3 DIGITS
	;DEVUELVE UN NUMEROO DE UN BYTE
	;ME SIGUE FALTANDO ESTA PARTE PEDRO NO LA MUESTRA EN PANTALLA
	asciiToReg proc
		xor ax, ax
		mov al, dl

		mov cx, 3

		proceso:
			mov dl, datadiv[bx]
			div dl
			add nroAscii[bx],al
			xchg al, ah 
			xor ah, ah 
			inc bx
			inc si
	asciiToReg endp

end main

;CON ESTO SE PUEDEN HACER TODOS LOS EJERCICIOS!!