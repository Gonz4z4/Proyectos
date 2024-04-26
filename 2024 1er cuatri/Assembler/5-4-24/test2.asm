.8086
.model small
.stack 100h
.data

	bienvenida db "Programa de LEctura de Variables ",0dh,0ah, 24h
	texto db 255 dup (24h),0dh, 0ah, 24h
	

.code

	main proc
	 mov ax, @data
	 mov ds, ax

	 mov ah,9
	 mov dx, offset bienvenida
	 int 21h

	 mov bx, 0

;CAJA DE CARGA
carga:
	 mov ah, 1
	 int 21h
	 cmp al, 0dh
	 je finCarga
	 mov texto[bx],al
	 inc bx
 jmp carga 

finCarga:
;FIN CAJA DE CARGA	 

	mov ah, 9
	mov dx, offset texto
	int 21h
	 
	 mov ah, 4ch
	 mov al, 00h
	 int 21h
	main endp
end