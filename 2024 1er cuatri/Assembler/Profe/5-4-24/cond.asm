.8086
.model small
.stack 100h
.data

	bienvenida db "Ingrese 1 para validar el condicional ",24h
	texto db "entre por el si",0dh, 0ah, 24h
	texto2 db "seguí viaje",0dh, 0ah, 24h
	caracter db 0

.code

	main proc
	 mov ax, @data
	 mov ds, ax

	 mov ah,9
	 mov dx, offset bienvenida
	 int 21h

	 mov ah,8
	 int 21h
	 mov caracter, al
	 mov ah, 2
	 mov dl, '*' 
	 int 21h
	 mov al, caracter
	 cmp al, 31h ;'1'
	 je elSi


	 mov ah,9
	 mov dx, offset texto2
	 int 21h

	 jmp finPrograma

	 elSi:
	 mov ah,9
	 mov dx, offset texto
	 int 21h

	 ;       AX
	 ;	AH       AL
	 ;00000000 00000000
	 ;   4c       00

	 ; mov ax, 4c00h
finPrograma:
	 mov ah, 4ch
	 mov al, 00h
	 int 21h
	main endp
end