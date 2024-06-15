.8086
.model small
.stack 100h
.data
	reg db 212
	noAscii db '000', 0dh,0ah,24h
	dataMul db 10,100,1
.code
	main proc
		mov ax, @data
		mov ds, ax

		xor ah, ah ;limpio ah para que este en 0
		mov al, reg; muevo para dividir este numer
		mov dl, 100 ;muevo para usar de divisor del numero
		
		div dl ;divido al/dl (212/100) (dl siempre va a dividir lo que esta en el regiistro acumulador)
		add noAscii[0], al
		mov al, ah ;paso lo que quedo en ah a al (es decir el resto (creo, chequear en video))
		xor ah, ah ;limpio 
		mov dl, 10 
		div dl ;divido el resto por 10
		add noAscii[1], al
		add noAscii[2], ah


		mov ah,9
		lea dx,noAscii ;leo lo que hay en el array
		int 21h
	
		mov ax, 4c00h
		int 21h
	main endp
end main