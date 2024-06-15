.8086
.model small
.stack 100h
.data
	bienvenida db "ingrese 1 para validar el condicional",24h
	texto db "entre por el si",0dh, 0ah, 24h
	texto2 db "entre por el si",0dh, 0ah, 24h
.code
	main proc
		mov ax, @data
		mov ds, ax

		mov ah,9
		mov dx, offset bienvenida
		int 21h

		mov ah,1
		int 21h
		cmp al, 31h ; '1'
		je elSi

		mov ah,9
		mov dx, offset texto2
		int 21h

		

		elSi:
			mov ah,9
			mov dx, offset texto 
			int 21h


		mov ax, 4c
		mov al, 00h
		int 21h
	main endp

	end main