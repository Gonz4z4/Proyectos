.8086 ;no esta terminado, es como ej clase pero con n numeros
.model small
.stack 100h
.data
	
	data db 255 ,0dh,0ah,24h


.code
	main proc
	mov ax, @data
	mov ds, ax

	mov bx,0

carga:
	cmp bx 256
	je finCarga
	mov ah,1
	int 21h
	cmp al, 0dh
	je finCarga
	mov data [bx], al
	inc bx

finCarga

print:
	mov ah,2
	mov dl, data[bx]
	int 21h
	dec bx
loop print

	mov ax, 4c00h
	int 21h
	main endp
end