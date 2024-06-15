

;3100: Termina el programa
;3500: Le pregunta al isr donde estaba guardada la interrupcion anterior
;2500: Coloca el offset de la interrupcion creada en el vector de interrupciones
;4c00: le indica al dos que borre la memoria

;mov DesplntXX,BX	indica el segmento y el offset donde estaba ubicada la interrupcion anterior
;mov seglnXX,ES

;un paragraph es un segmento de memoria de 16 bytes
;el modelo tiny(.com)tenemos bloques de datos y de instrucciones



;Trabajar con un texto ingresado por teclado con el menu:
;1 Leer texto
;2 contar caracteres(sobre el texto ingresado)
;3 imprimir cantidad de caracteres en dec
;4 imprimir cantidad de caracteres en hex
;5 reset
;6 fin programa

;el sistema debe estar y volver siempre al menu, uno debe cargar el texto, y realizar todo el recorrido, si lo desea debe limpiar todo y cargar el texto de nuevo. En el caso de no haber llenado las variables o haber reseteado las opciones de impresion deben indicar 0



.8086
.MODEL small
.STACK 100h
.DATA
	textoInicio db "Ingrese una opcion",0dh,0ah
	textoInicio2 db "1 leer texto",0dh,0ah
	textoInicio3 db "2 contar caracter",0dh,0ah
	textoInicio4 db "3 imprimir en dec",0dh,0ah
	textoInicio5 db "4 imprimir en hex",0dh,0ah
	textoInicio6 db "5 resetear variables",0dh,0ah
	textoInicio7 db "6 terminar programa",0dh,0ah,24h

	textoError db "Ingrese algun valor sugerido!",0dh,0ah,24h

	textoa db "El texto es:",0dh,0ah,24h
	textocant db "Texto contado",0dh,0ah,24h
	textodec db "Cantidad dec:",0dh,0ah,24h
	textohex db "Cantidad hex:",0dh,0ah,24h
	textoreset db "reseteo hecho",0dh,0ah,24h
	textofin db "fin del programa",0dh,0ah,24h
	textotecla db "ingrese una tecla",0dh,0ah,24h

	texto db 255 dup(24h),0dh,0ah,24h
	cantidad db 0
	cantidadDec db "000",0dh,0ah,24h
	cantidadHex db "00",0dh,0ah,24h
	
.code
	extrn carga:proc
	extrn regtoascii:proc
	extrn reiniciocarga:proc
	extrn regtoHex:proc
	extrn imprimir:proc
	extrn largoCadena:proc


main proc
	mov ax, @data
	mov ds,dx

inicio:
	lea bx,textoInicio
	push bx
	call imprimir
	mov ah,1
	int 21h
	cmp al,'1'
	je leer
	cmp al,'2'
	je contar
	cmp al,'3'
	je impdec
	cmp al,'4'
	je imphex
	cmp al,'5'
	je reset
	cmp al,'6'
	je fin


jmp inicio


leer:
	lea bx, texto
	mov dl,0
	mov dh,0dh
	mov ah,0
	call carga

	lea bx, texto
	push bx
	call imprimir
	jmp inicio


contar:
	lea bx,texto
	call largocadena
	mov cantidad,al

jmp inicio

impDec:
	mov dl,cantidad
	lea bx,cantidadDec
	call regtoascii

	lea bx,cantidadDec
	push bx
	call imprimir
	jmp inicio

imphex:
	mov dl, cantidad
	lea bx, cantidadhex
	call regtohex

	lea bx,cantidadHex
	push bx
	call imprimir
	jmp inicio

reset:
	;reset texto
	mov dl,255
	mov dh,24h
	lea bx,texto
	push bx
	call reiniciocarga

	;reseteo cantidad dec
	mov dl,3
	mov dh,30h
	lea bx, cantidaddec
	push bx
	call reiniciocarga

	;reseteo cantidad hex
	mov dl, 2
	mov dh, 30h
	lea bx, cantidadhex
	push bx
	call reiniciocarga

	;reseteocantidad
	mov dl,0
	mov cantidad,dl
	

jmp inicio

fin:

	lea bx, textofin
	push bx
	call imprimir

	mov dx, 4c00h
	int 21h

	main endp
end
	