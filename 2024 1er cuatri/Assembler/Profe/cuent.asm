.8086 
.model small
.stack 100h
.data
	texto db "este programa chequea la cantidad de veces que ingresas vocales o nros",0dh,0ah,24h
	comparar db "aeiouAEIOU1234567890",24h
	cantidad db 0; 		EQUIVALE A 00000000
	cantidadImp db "0",0dh,0ah,24h; EQUIVALE A 00110000
.code

	main proc
	mov ax, @data
	mov ds, ax

	mov ah,9
	mov dx, offset texto
	int 21h

arriba:
	;caja de carga
	mov ah, 1
	int 21h
	cmp al, 0dh
	je finCarga
	mov bx, 0
compara:
	cmp comparar[bx],24h
	je arriba
	cmp comparar[bx],al 
	je incrementa
	inc bx
jmp compara

	;fin caja carga

incrementa:
	inc cantidad
	jmp arriba 
finCarga:

	mov dl, cantidad
	add cantidadImp, dl

	mov ah, 9
	mov dx, offset cantidadImp
	int 21h

	mov ax, 4c00h
	int 21h
	main endp
end