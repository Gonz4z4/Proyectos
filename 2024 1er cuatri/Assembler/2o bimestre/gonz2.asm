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
		mov bx, 0 
		mov cx, 3 ;de vuelta para el loop
		atr:
			mov al, nroLeido[bx]
			mov dl, datadiv[bx]
			mul dl ;multiplica al por el datadiv[bx]
			add reg, al ; le sumo a reg el al
			xor ax, ax ;limpio ax para que este en 0
			inc bx
		loop atr

		;REG TO ASCII
			xor ah, ah
			mov ax, reg ;aca me falta!! no se que puso



		mov ah,9
		lea dx,noAscii ;leo lo que hay en el array
		int 21h
	
		mov ax, 4c00h
		int 21h
	main endp
end main

;CON ESTO SE PUEDEN HACER TODOS LOS EJERCICIOS!!