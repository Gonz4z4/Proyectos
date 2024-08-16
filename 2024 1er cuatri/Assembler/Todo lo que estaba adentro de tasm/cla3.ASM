.8086
.model small
.stack 100h
.data
	mensaje db "CLASE 1: y ahora que pase el no a dividir el user", 0dh, 0ah, 24h	;ACA VAN LAS VARIABLES
	nroADiv db '000',24h
	reg db 0
	nroAscii db '000',0dh,0ah,24h
	dataDiv db 100,10,1

	.code
	main proc
		mov ax, @data
		mov ds, ax
		;ACA VA EL CODIGO
	
		mov ah, 9
		mov dx, offset mensaje
		int 21h	

		;CAJA DE CARGA
		mov cx,3
		mov bx,0
		carga:
			mov ah, 1
			int 21h
			mov nroADiv[bx], al
			inc bx
		loop carga

		;PASO DE ASCII ESCRITO A REGISTRO
		mov bx,0
		mov cx,3
		a2r:
			mov al, nroADiv[bx] ;muevo el numero ascii iniciado
			sub al,30h ;le resto 30h (para que deje de ser un ascii)
			mov dl, dataDiv[bx] ;pongo para multiplicar ese numero
			mul dl ;resultado queda en al y ah
			add reg, al ;agrego el resultado a reg
			xor ax,ax
			inc bx
		loop a2r



		mov al, reg
		mov cx, 3
		mov bx, 0
		r2a:
			xor ah,ah
			mov dl, dataDiv[bx] ;valor por el que quiero dividir ax
			div dl ; (AX/DL) en ah queda 12 (resto) y en al queda 2 (resultado)
			add nroAscii[bx], al
			xchg al, ah ;paso el resto a al para seguir dividiendolo
			inc bx
		loop r2a; loopea cx veces
		
		mov ah, 9
		lea dx, nroAscii
		int 21h

		mov ax, 4c00h
		int 21h
	main endp

	end