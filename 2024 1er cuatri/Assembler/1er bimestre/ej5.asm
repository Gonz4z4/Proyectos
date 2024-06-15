.8086
.model small
.stack 100h
.data
mensaje db "Ingrese un texto",0dh,0ah,24h
mensaje2 db "No es palindromo :(",0dh,0ah,24h
mensaje3 db "Si es palindromo! :)",0dh,0ah,24h
texto db 255 dup (24h)
palin db 30h 
.code
	main proc
		mov ax, @data
		mov ds, ax


		mov ah,9
		mov dx,offset mensaje
		int 21h

		mov bx, 0
		
		carga:
			mov ah,1
			int 21h
			cmp al, 0dh
			je fincarga
			mov texto[bx], al
			inc bx
			jmp carga

		fincarga:
			mov word ptr palin, bx
			mov si, 0
			mov di, word ptr palin ;no estoy seguro, buscar, pero tiene que ver con que comparamos distintos tipos de datos
			dec di ; Empieza a contar en 0, asi que necesitamos esto para que compare con la ultima letra
		
		proceso:
			mov al, texto[si]
			cmp al, texto[di] ;si no son iguales, finaliza (no es palindromo)
			jne nopalindromo
			inc si
			dec di
			cmp di, si ;compara si di es greater or equal que si (si di>si)
			jge espalindromo ;
			jmp proceso
		
		nopalindromo:
			mov ah,9
			mov dx,offset mensaje2
			int 21h
			jmp fin
		
		espalindromo:
			mov ah,9
			mov dx,offset mensaje3
			int 21h


		fin:


	mov ax, 4c00h
	int 21h
main endp
end main