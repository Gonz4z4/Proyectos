.8086
.model small
.stack 100h
.data
	mensaje db "hola mundo", 0dh, 0ah, 24h	;ACA VAN LAS VARIABLES
.code
	main proc
		mov ax, @data
		mov ds, ax
						;ACA VA EL CODIGO
		mov ah, 9
		mov dx, offset mensaje
		int 21h	


		mov ax, 4c00h
		int 21h
	main endp

	end