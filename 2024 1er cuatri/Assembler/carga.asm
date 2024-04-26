.8086
.model small
.stack 100h
.data
	bienvenida db "bienvenido",0dh,0ah, 24h
	texto db 255 dup (24h), 0dh, 0ah, 24h
.code
	main proc
		mov ax, @data
		mov ds, ax
		mov bx, 0

		mov ah, 9
		mov dx, offset bienvenida
		int 21h

		
	carga:
		mov ah, 1
		int 21h
		mov texto[bx], al
		cmp al,0dh
		je fincarga
		inc bx
		jmp carga
	fincarga:

	print:
		mov ah, 9
		mov dx, offset texto
		int 21h
	

	mov ax, 4c00h
	int 21h
	main endp
	end main