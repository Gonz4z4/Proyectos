.8086
.model small
.stack 100h
.data
	mensaje db "CLASE 1: Ahora con funciones", 0dh, 0ah, 24h	;ACA VAN LAS VARIABLES
	nroADiv db '000',24h
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

		lea bx, nroADiv ;guarda el offset de nroADiv
		lea si, dataDiv ;lo guarda para pasarlo a la funcion por registro
		call asciiToReg

		lea bx, nroAscii
		call regToAscii
		
		
		mov ah, 9
		lea dx, nroAscii
		int 21h

		mov ax, 4c00h
		int 21h
	main endp

	;RECIBE EN DL UN NUM DE 1 BYTE, DEVUELVE EN UN OFFSET
	;UNA VARIABLE CON 3 ASCII LLENA
	regToAscii proc
		push dx
		push ax
		push si
		push cx
		push bx

		mov al, dl
		mov cx, 3
		r2a:
			xor ah,ah
			mov dl, [si] ;valor por el que quiero dividir ax
			div dl ; (AX/DL) en ah queda 12 (resto) y en al queda 2 (resultado)
			add [bx], al
			xchg al, ah ;paso el resto a al para seguir dividiendolo
			inc bx
			inc si
		loop r2a; loopea cx veces
		
		pop bx
		pop cx
		pop si
		pop ax
		pop dx
	ret
	regToAscii endp

	;RECIBE EN BX EL OFFSET DE UNA VARIABLE LLENA CON 3 DIGITOS
	;DE UN BYTE, DEVUELVE EN DL EL VALOR CORRESPONDIENTE
	asciiToReg proc
		push cx
		push ax
		push si

		mov dx,0
		mov cx,3
		a2r:
			mov al, [bx] ;muevo el numero ascii iniciado
			sub al,30h ;le resto 30h (para que deje de ser un ascii)
			mov dl, [si] ;pongo para multiplicar ese numero
			mul dl ;resultado queda en al y ah
			add dh, al ;agrego el resultado a reg
			xor ax,ax
			inc bx
			inc si
		loop a2r
		xchg dl, dh ;guardo el resultado final en dl
		mov dh,0
		pop si
		pop ax
		pop cx
	ret
	asciiToReg endp

	end