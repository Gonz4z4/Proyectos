.8086
.model small
.stack 100h

.data


		
.code

public carga
public imprimir

;FUNCION DE CARGA**************************************
	carga proc ;paramertos necesarios --> offset texto en dx, caracter de finalizacion en al || ESTA FUNCA 
		push bx 
		push dx
		push ax

		mov bx, dx ;el dato esta en dx, NO EN BX --> Uso bx para recorrer el offset 
		mov dl, al ;estas cosas son por conveniencia segun servicio de int, por ejemplo, en al se va a guardar el caracter siempre
	cargaTexto:
		mov ah, 1
		int 21h
		cmp al, dl
		je finCarga 
		mov [bx], al 
		inc bx
	jmp cargaTexto
	finCarga:

		pop ax
		pop dx
		pop bx
		ret
	carga endp
;FUNCION DE CARGA**************************************



;IMPRESION EN PANTALLA TEXTO**************************************
	imprimir proc

		push bp
		mov bp, sp
		push dx
		push ax
		mov dx, ss:[bp+4]

		mov ah,9
		int 21h

		pop ax
		pop dx
		pop bp
		ret 2

	imprimir endp ;en caso de imprimir sin la funcion, poner "lea dx,texto"
;IMPRESION EN PANTALLA TEXTO**************************************


end