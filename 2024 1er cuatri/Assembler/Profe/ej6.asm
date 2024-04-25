.8086
.model small
.stack 100h
.data
	var db 255 dup(24h),0dh,0ah,24h

.code

	main proc

	mov ax, @data
	mov ds, ax 

	mov bx, 0
		;caja carga
	carga:
		mov ah,1
		int 21h
		cmp al, 0dh
		je finCarga
		mov var[bx],al 

		inc bx
	jmp carga
finCarga:

	mov bx, 0
	mov cx, 0

proceso:
	cmp var[bx],24h
	je termine

	cmp var[bx], 41h
	jae casiLetra

termine:
	jmp fin


sigueSigue:
	inc bx
	jmp proceso

casiLetra:
	cmp var[bx],7ah
	jbe esLetra
jmp sigueSigue

esLetra:
	cmp var[bx],'A'
	je cuentaVoc
	cmp var[bx],'E'
	je cuentaVoc
	cmp var[bx],'I'
	je cuentaVoc
	cmp var[bx],'O'
	je cuentaVoc
	cmp var[bx],'U'
	je cuentaVoc
	cmp var[bx],'a'
	je cuentaVoc
	cmp var[bx],'e'
	je cuentaVoc
	cmp var[bx],'i'
	je cuentaVoc
	cmp var[bx],'o'
	je cuentaVoc
	cmp var[bx],'u'
	je cuentaVoc
	cmp var[bx],5bh
	je sigueSigue
	cmp var[bx],5ch
	je sigueSigue
	cmp var[bx],5dh
	je sigueSigue
	cmp var[bx],5eh
	je sigueSigue
	cmp var[bx],5fh
	je sigueSigue
	cmp var[bx],60h
	je sigueSigue
	inc cl ;INCREMENTO CONTADOR CONSONANTES
	jmp sigueSigue

cuentaVoc:
	inc ch ;INCREMENTO CONTADOR VOCALES
	jmp sigueSigue

fin:
	mov ah, 2
	mov dl, ch ;VOCALES
	add dl, 30h
	int 21h

	mov ah, 2
	mov dl, cl ;CONSONANTES
	add dl, 30h
	int 21h


	mov ax, 4c00h
	int 21h

	main endp
end