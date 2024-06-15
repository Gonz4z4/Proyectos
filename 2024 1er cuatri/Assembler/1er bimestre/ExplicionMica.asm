.8086
.model small
.stack 100h
.data
	bienvenida db "Programa de lectura de variables ",0dh,0ah, 24h
	texto db 255 dup (24h),0dh, 0ah, 24h
	textoMod db 255 dup (24h),0dh, 0ah, 24h
.code
	main proc
		mov ax, @data
		mov ds, ax

		mov ah, 9 ;establece ah como 9
		mov dx, offset bienvenida ;pone la direccion de memoria donde esta bienvenida, offset pone que el desplazamiento sea desde el inicio de la cadena bienvenida
		int 21h

		mov bx,0 ;pone bx, que es para recorrer en 0, sirve en carga
	carga:
		mov ah, 1 ;Almacena caracteres que escribimos en el teclado en al 
		int 21h 
		cmp al, 0dh; comparra al caracter con 0dh que es un retorno de carga
		je finCarga ; si son iguales, salta a finCarga
		mov texto[bx],al ;va guardando caracter por caracter de al (lo que escribimos en teclado en la linea 19) en texto
	 	mov textoMod[bx],al ;igual que el anterior pero en textoMod
	 	;bx seria la posicion en la cadena
	 	inc bx ;incrementa bx
 	jmp carga ;vuelve a carga hasta que linea 22 nos saque de aca

 	finCarga:

 	procesa:
		cmp bx, -1 ;cuando llegue a -1 de ser disminuido
		je finPrograma ; finaliza el programa
		cmp textoMod[bx],'a' ;chequea que textoMod en esa posicion tiene una a, si tiene salta a la linea 48
		jne sigueSigue; jump if not equal, es decirr que si no es igual a a, salta directo a sigue sigue, si es igual, sigue el codigo normal
		mov textoMod[bx],'x' ;cambia en esta posicion, la a por x
	    ;como no hay un jump, sigue el texto normal a siguesigue
	sigueSigue:
		dec bx ;decrece bx
		jmp procesa ;vuelve a empezar procesa

	;FIN CAJA DE CARGA	 
	finPrograma:
		mov ah, 9 
		mov dx, offset textoMod
		int 21h

			mov ah, 9
		mov dx, offset texto
		int 21h
		 
		 mov ah, 4ch
		 mov al, 00h
		 int 21h
		main endp
	end


	;uso de registros Ax registro acumulador bx registro base
	;cx registro contador dx registro de datos
	;si source index y di data index (similares a bx)
