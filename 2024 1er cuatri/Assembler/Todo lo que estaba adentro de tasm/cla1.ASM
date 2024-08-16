.8086
.model small
.stack 100h
.data
	mensaje db "CLASE 1: pasar de registros a Ascii", 0dh, 0ah, 24h	;ACA VAN LAS VARIABLES
	reg db 212
	nroAscii db '000',0dh,0ah,24h
	dataMul db 100,10,1

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
	asciiToReg:
		xor ah,ah
		mov dl, dataMul[bx] ;valor por el que quiero dividir ax
		div dl ; (AX/DL) en ah queda 12 (resto) y en al queda 2 (resultado)

		mov dl, 10; ahora divido por 10
		add nroAscii[0], al
		mov al, ah ;paso el resto a al para seguir dividiendolo
		xor ah, ah ;limpio ah (el resto)
		div dl
		add nroAscii[1], al
		mov al, ah ;muevo resto a al
		add nroAscii[2],ah ; aca no hace falta dividir porque el resto es 1 digito

		mov ah, 9
		lea dx, nroAscii
		int 21h

		mov ax, 4c00h
		int 21h
	main endp

	end