

3100: Termina el programa
3500: Le pregunta al isr donde estaba guardada la interrupcion anterior
2500: Coloca el offset de la interrupcion creada en el vector de interrupciones
4c00: le indica al dos que borre la memoria

mov DesplntXX,BX	indica el segmento y el offset donde estaba ubicada la interrupcion anterior
mov seglnXX,ES

un paragraph es un segmento de memoria de 16 bytes
el modelo tiny(.com)tenemos bloques de datos y de instrucciones



Trabajar con un texto ingresado por teclado con el menu:
1 Leer texto
2 contar caracteres(sobre el texto ingresado)
3 imprimir cantidad de caracteres en dec
4 imprimir cantidad de caracteres en hex
5 reset
6 fin programa

el sistema debe estar y volver siempre al menu, uno debe cargar el texto, y realizar todo el recorrido, si lo desea debe limpiar todo y cargar el texto de nuevo. En el caso de no haber llenado las variables o haber reseteado las opciones de impresion deben indicar 0



.8086
.MODEL small
.STACK 100h
.DATA
	texto menu0 DB "Ingrese una opcion",0dh,0ah
	texto menu1 DB "1 leer texto",0dh,0ah
	texto menu2 DB "2 contar caracter",0dh,0ah
	texto menu3 DB "3 imprimir en dec",0dh,0ah
	texto menu4 DB "4 imprimir en hex",0dh,0ah
	texto menu5 DB "5 resetear variables",0dh,0ah
	texto menu6 DB "6 terminar programa",0dh,0ah,24h

	texto error DB "Ingrese algun valor",0dh,0ah,24h

	texto texto DB "El texto es:",0dh,0ah,24h
	texto cont DB "Texto contado",0dh,0ah,24h
	texto decimal DB "Cantidad dec:",0dh,0ah,24h
	texto hexa DB "Cantidad hex:",0dh,0ah,24h
	texto reset DB "reseteo hecho",0dh,0ah,24h
	texto fin DB "fin del programa",0dh,0ah,24h
	texto tecla DB "ingrese una tecla",0dh,0ah,24h

	texto db 255 dup (24h),0dh,0ah,24h
	cantidad db 0
	cantidadDecimal db "000",0dh,0ah,24h
	cantidadHexadecimal db "00", 0dh, 0ah, 24h
	
.code
	extrn carga:proc
	extrn regtoascii:proc   
	extrn regtoHex:proc	      
	extrn asciitodec:proc     
	extrn asciitoReg:proc    
	extrn imprimir:proc      
	extrn largoCadena:proc   
	extrn cifrar:proc
	extrn imprimir:proc
	extrn reinicioCarga:proc

main proc
	mov ax, @data
	mov dc,dx

inicio:
	lea bx,texto menu
	push bx
	call imprimir

	mov ah,1
	int 21h
	cmp al,'1'
	je leer
	cmp al,'2'
	je contar
	cmp al,'3'
	je imprimirDecimal
	cmp al,'4'
	je imprimirHexa
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

imprimirDecimal:
	mov dl,cantidad
	lea bx,cantidadDecimal
	call regtoascii

	lea bx,cantidadDecimal
	push bx
	call imprimir

jmp inicio



imprimirHexa:
	mov dl, cantidad
	lea bx, cantidadHexadecimal
	call regtoHex

	lea bx,cantidadHexadecimal
	push bx
	call imprimir

jmp inicio

reset:
	
	mov dl,255
	mov dh,24h
	lea bx,texto
	push bx
	call reinicioCarga

	mov dl,3
	mov dh,30h
	lea bx, cantidadDecimal
	push bx
	call reinicioCarga


	mov dl, 2
	mov dh, 30h
	lea bx, cantidadHexadecimal
	push bx
	call reinicioCarga

	
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
	