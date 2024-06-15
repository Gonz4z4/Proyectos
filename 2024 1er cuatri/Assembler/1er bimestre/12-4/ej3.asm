.8086
.model small
.stack 100h
.data

	texto db 255 dup (24h),0dh, 0ah, 24h
	textoOrg db 255 dup (24h),0dh, 0ah, 24h
	salto db 0dh,0ah, 24h
	cartel db "Ingrese el texto a modificar", 0dh, 0ah, 24h

.code

	main proc

	mov ax, @data
	mov ds, ax

	mov ah, 9
	mov dx, offset cartel
	int 21h

	;IniCIO CAJA DE CARGA
	mov bx, 0
 carga:
 	cmp bx, 256
 	je finCarga
	mov ah, 1
	int 21h
	cmp al, 0dh
	je finCarga
	mov texto[bx],al
	mov textoOrg[bx],al
	inc bx
 jmp carga

finCarga:
	;FIN CAJA DE CARGA

	mov bx,0
jmp comprueba
	; 61h es la a
	; 7ah es la z
proceso:
	cmp texto[bx],24h
	je finProceso
	cmp texto[bx],20h 
	je esEspacio
	inc bx
jmp proceso

esEspacio:
	inc bx
comprueba:
	cmp texto[bx], 61h
	jae casiLetra
jmp proceso
casiLetra:
	cmp texto[bx], 7ah
	jbe esLetra
jmp proceso

esLetra:
	sub texto[bx],20h 
	inc bx
jmp proceso 


finProceso:

	mov ah,9
	mov dx, offset texto
	int 21h

	mov ah, 9
	mov dx, offset salto
	int 21h

	mov ah, 9
	mov dx, offset textoOrg
	int 21h

	mov ax,4c00h
	int 21h
	main endp

end