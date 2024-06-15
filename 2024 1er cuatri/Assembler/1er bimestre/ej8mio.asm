.8086
.model small
.stack 100h
.data
		texto db 255 dup (24h),0dh, 0ah, 24h

.code
	main proc
		mov ax, @data
		mov ds, ax
		mov bx, 0
		
	carga:
		mov ah,1
		int 21h
		mov texto[bx],al
		cmp al,0dh
		je fincarga
		inc bx
		jmp carga
	fincarga:

		sub bx,1
	encriptar:
		cmp bx,-1
		je print
		add texto[bx], 5
		dec bx
		jmp encriptar

	print:
		mov ah,9
		mov dx, offset texto
		int 21h

		mov ax, 4c00h
		int 21h
	main endp

	end main