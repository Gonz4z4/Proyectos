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
		mov ah, 1
		int 21h
		mov texto[bx], al 
		cmp al, 0dh
		je finCarga
		inc bx 
		jmp carga 
	finCarga:
	
		sub bx,1
	encriptar:
		cmp bx, -1
		je printear
		add texto[bx],5d
		dec bx
		cmp texto[bx], 24h
		je printear
		jmp encriptar

	printear:
		mov ah, 9 
		mov dx, offset texto
		int 21h

			;ACA VA EL CODIGO


		mov ax, 4c00h
		int 21h
	main endp

	end main