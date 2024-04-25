.8086
.model small
.stack 100h
.data

	data db 255 dup(24h),0dh, 0ah, 24h
.code

	main proc
	mov ax, @data
	mov ds, ax

	mov bx, 0
 carga:
 	cmp bx, 256
 	je finCarga
	mov ah, 1
	int 21h
	cmp al, 0dh
	je finCarga
	mov data[bx],al
	inc bx
 jmp carga

finCarga:
	;FIN CAJA DE CARGA
	dec bx
	mov si, 0 
 
 proceso:
 	cmp si, bx
 	ja esPali
	mov al, data[bx]
	cmp data[si],al 
	jne noEsPali

	inc si
	dec bx
 jmp proceso

noEsPali:
	
	mov ah, 2
	mov dl, 2
	int 21h
jmp fin
esPali:
	mov ah, 2
	mov dl, 1
	int 21h
fin:
	mov ax, 4c00h
	int 21h

	main endp
end