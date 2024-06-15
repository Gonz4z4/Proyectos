.8086
.model small
.stack 100h
.data
	texto db 255 dup (24h),0dh, 0ah, 24h
	cantidad db 0

.code

	main proc ;queremos que encuentre las a del texto
		mov ax,@data
		mov ds,ax

		mov dx, offset texto ;offset variable a llenar
		mov al 0dh
		call carga

		mov dx, offset texto ;offset variable a revisar 
		mov al, 'a' ;caracter a buscar
		xor ah, ah
		push dx
		lea dx, cantidad
		push dx
		push ax
		call encuentra
		;HACER FUNCION QUE IMPRIMA CANTIDAD


		mov ax 4c00h
		int 21h
	main endp

	encuentra proc
		;caracter SS:[BP+4]
		;OF POS   SS:[BP+6]
		;OF TEXTO SS:[BP+8]
		
		push bp ;salvo bp primero
		mov bp, sp
		push bx
		push ax
		push si
		
		mov bx,	ss:[bp+8]
		mov si, ss:[bp+6]
		mov ax, ss:[bp+4]

		xor ah,ah 

		procEncuentro:
			cmp [bx], byte ptr 24h
			je finEncuentra
			cmp [bx],al 
			je encontrado
			inc ah
			inc bx 
			jmp procEncuentro

		encontrado:
			inc ah
			mov[si], byte ptr ah
			jmp final

		finEncuentra:
			mov[si], byte ptr 255 ;devuelvo codigo de error no encontro

		final:

		pop si
		pop ax
		pop bx
		pop bp
		ret 6
	encuentra endp

	carga proc
		push bx
		push dx
		push ax

		mov bx,dx ;cargo el offset en bx
		mov dl, al ;muevo caracter de finalizacion a dl
		cargaTexto:
			mov ah,1
			int 21h
			cmp al, dl
			je fincarga
			mov [bx],al
			inc bx
			jmp cargatexto
		fincarga:
		
		pop ax
		pop dx
		pop bx
	ret
	carga endp
end 