;Ingrese un texto de hasta 255 caracteres terminados por el signo $.Imprima el
;texto modificando la letra a por la letra x. Imprima el texto modificado y luego
;el texto original.

.8086
.model small
.stack 100h
.data

	bienvenida db "Programa de LEctura de Variables ",0dh,0ah, 24h
	texto db 255 dup (24h),0dh, 0ah, 24h
	textoMod db 255 dup (24h),0dh, 0ah, 24h
	

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
	 mov textoMod[bx],al
	 inc bx
 jmp carga 

finCarga:

recorrido:
;	mov bx, 0

procesa:
	cmp bx, -1
	je finPrograma
	cmp textoMod[bx],'a'
	jne sigueSigue
	mov textoMod[bx],'x'

sigueSigue:
	dec bx
 jmp procesa


; recorrido:
;	mov bx, 0
;
;procesa:
;	cmp textoMod[bx],24h
;	je finPrograma
;	cmp textoMod[bx],'a'
;	jne sigueSigue
;	mov textoMod[bx],'x'
;
;sigueSigue:
;	inc bx
; jmp procesa



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