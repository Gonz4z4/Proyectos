.8086
.model small
.stack 100h
.data
	mensaje db "CLASE 1: pasar de registros a Ascii pero ahora loopeando", 0dh, 0ah, 24h	;ACA VAN LAS VARIABLES
	reg db 212
	nroAscii db '000',0dh,0ah,24h
	dataDiv db 100,10,1

	.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov bx, 0
						;ACA VA EL CODIGO
		mov ah, 9
		mov dx, offset mensaje
		int 21h	

		mov al, reg
		mov cx, 3
		a2r:
			xor ah,ah
			mov dl, dataDiv[bx] ;valor por el que quiero dividir ax
			div dl ; (AX/DL) en ah queda 12 (resto) y en al queda 2 (resultado)
			add nroAscii[bx], al
			xchg al, ah ;paso el resto a al para seguir dividiendolo
			inc bx
		loop a2r; loopea cx veces
		
		mov ah, 9
		lea dx, nroAscii
		int 21h

		mov ax, 4c00h
		int 21h
	main endp

	end