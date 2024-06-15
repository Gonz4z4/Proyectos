.8086
.model small
.stack 100h

.data


		
.code

public carga
public regtoascii
public reinicioCarga
public regtoHex
public imprimir
public largoCadena

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

regtoascii proc  
	;recibe en bx el offset de una variable de 3 bytes, y el numero a convertir por dl no mayor a 255

	        push ax
	        push dx

		add bx,2
		xor ax,ax
		mov al, dl
		mov dl, 10
		div dl
		add [bx],ah

		xor ah,ah
		dec bx
	        div dl
		add [bx],ah

		xor ah,ah
		dec bx
	        div dl
		add [bx],ah

	        pop dx
	        pop ax

	        ret
	regtoascii endp

reinicioCarga proc 
	;reinicio variables de tipo texto

		push bp
		mov bp, sp
		push cx
		push si
		push dx

		mov si, ss:[bp+4]

		mov cl, dl
	cargaX:
		mov byte ptr[si], dh
		inc si
	loop cargaX
		
		pop dx 
		pop si 
		pop cx 
		pop bp 

		ret 2

reinicioCarga endp

regtoHex proc  
	;recibe en bx el offset de una variable de 2 bytes, y el numero a convertir por dl no mayor a 255
	        push ax
	        push dx

		add bx,1
		xor ax,ax
		mov al, dl
		mov dl, 16
		div dl
		cmp ah, 9
		ja esLetra
		add [bx],ah

	prox:
		xor ah,ah
		dec bx
	    div dl
	    cmp ah, 9
		ja esLetra2    
		add [bx],ah
		jmp finRegHex

		esLetra:
			mov [bx], ah
			add byte ptr [bx], 55
		jmp prox
		esLetra2:
			mov [bx], ah
			add  byte ptr[bx], 55


	finRegHex:
	        pop dx
	        pop ax

	        ret
	regtoHex endp	

	imprimir proc ;paramertos necesarios --> offset texto en BX, push BX	

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

largoCadena proc
	;recibe en bx el offset de una variable devuelvo cantidad de caracteres hasta encontrar $ en cx

		xor cx, cx 
		push bx
	largo:
		cmp byte ptr [bx], 24h 
		je fin
		inc bx
		inc cx 
		jmp largo

	fin:
	 	pop bx
	 ret
	largoCadena endp
	
end