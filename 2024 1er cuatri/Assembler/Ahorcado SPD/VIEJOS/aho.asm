;MI GENTE, ACUERDENSE DE COMPILAR ESTO CON LA LIBRERIA (AHORLIB.ASM)
.8086
.model small
.stack 100h
.data
	;MENUES---------------------------------------
	menu db "------------------------------------------------------------------",0ah, 0dh
	db "MENU:",0ah, 0dh
	db "1) JUGAR",0ah, 0dh
	db "2) INGRESAR/CAMBIAR PALABRA A ADIVINAR",0ah, 0dh
	db "0) SALIR",0ah, 0dh
	db "Seleccion->",24h 
	ingresarPalabraMenu db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE INGRESAR O CAMBIAR TEXTO",0ah, 0dh
	db "1) INGRESAR PALABRA",0ah, 0dh
	db "2) CAMBIAR PALABRA",0ah, 0dh
	db "0) VOLVER",0ah, 0dh
	db "Seleccion->",24h

	;MENSAJES GENERICOS-------------------------------------
	bienvenida db "AHORCADO", 0dh, 0ah
	db "Adivina la palabra que pone el jugador 2! Tenes 6 vidas",0ah, 0dh, 24h
	salto db 0dh,0ah, 24h ;salto de linea para las impresiones
	gracias db "Gracias por jugar! :)",0ah, 0dh, 24h
	perdiste db "Has perdido todas tus vidas! Fin del juego.", 0ah, 0dh, 24h
	ganaste db "GANASTEEE!!!!!! FELICIDADES :D", 0ah, 0dh, 24h

	;MENSAJES DENTRO DEL JUEGO
	jugarTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE JUGAR (lastima que todavia no esta implementado...)",0ah, 0dh,24h
	ingresoPalabraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE INGRESAR PALABRA...",0ah, 0dh
	db "INGRESE UNA SOLA PALABRA", 0ah, 0dh,24h
	cambioPalabraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE CAMBIAR LA PALABRA...",0ah, 0dh
	db "INGRESE UNAS SOLA PALABRA:",0ah, 0dh,24h
	tuPalabraEs db "Tu palabra es: ",24h
	;VARIABLES
	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h
	vidas db 6
	ingresado db 0
	guiones db 255 dup (24h),0dh,0ah,24h

	;ERRORES
	error db "------------------------------------------------------------------",0ah, 0dh
	db "Ingrese una opcion valida :(",0dh,0ah,24h
	errorIngresado db "------------------------------------------------------------------",0ah, 0dh
	db "Ya ingresaste! Toca en CAMBIAR PALABRA",0dh,0ah,24h

.code
	extrn imprimir:proc
	extrn carga:proc
	extrn limpiarVariables:proc
	extrn limpiaPantalla:proc
	extrn ponerGuiones:proc

main proc
    mov ax, @data 
    mov ds, ax 

    mov bx, 0

    lea bx, bienvenida
    push bx
    call imprimir


programa:
	call limpiaPantalla

	lea bx, menu
	push bx
	call imprimir

	mov ah, 1
	int 21h
	mov opcion,al

	cmp opcion, 30h
	je graciasProc ;ENVIA AL FINAL (OPCION 0)

	cmp opcion, 31h
	je jugar

	cmp opcion, 32h
	je ingresoPalabraMenu

	;MENSAJE DE ERROR
	call limpiaPantalla

	lea bx, error
	push bx
	call imprimir
	jmp programa


jugar: ;ACA TODO EL PROCESO DE JUEGo
	call limpiaPantalla

	lea bx, jugarTxt
	push bx
	call imprimir
;parte que cambia la palabra a guiones
	lea bx, guiones
	xor ch,ch
	mov cl, 4
	call limpiarVariables

	lea dx, texto
	lea si, guiones
	call ponerGuiones

	lea bx, guiones
	push bx
	call imprimir

	mov ah, 1
	int 21h

	jmp programa

ingresoPalabraMenu: ;ACA INGRESO Y CAMBIO DE PALABR
	call limpiaPantalla

	lea bx, ingresarPalabraMenu
	push bx
	call imprimir

	mov ah, 1
	int 21h
	mov opcion,al

	cmp opcion, 30h
	je volver ;ENVIA AL PROGRAMA (OPCION 0)

	cmp opcion, 31h
	je ingresoPalabra

	cmp opcion, 32h
	je cambioPalabra

	;MENSAJE DE ERROR
	call limpiaPantalla

	lea bx, error
	push bx
	call imprimir
	
	mov ah, 1
	int 21h
	jmp ingresoPalabraMenu
	
	volver:
		jmp programa

	graciasProc:
		jmp graciasProc2

	ingresoPalabra:;SOLO CARGA LETRAS LA CAJA
		cmp ingresado, 1
		je errorIngresoPal
	
		call limpiaPantalla

		lea bx, ingresoPalabraTxt
		push bx
		call imprimir

		lea dx, texto
		mov al,0dh
		call carga

		lea bx, tuPalabraEs
		push bx
		call imprimir

		lea bx, texto
		push bx
		call imprimir

		;call limpiaPantalla

		mov ingresado, 1

		mov ah, 1
		int 21h

		jmp ingresoPalabraMenu

	errorIngresoPal:
		call limpiaPantalla

		lea bx, errorIngresado
		push bx
		call imprimir

		mov ah, 1
		int 21h

		jmp ingresoPalabraMenu

	cambioPalabra:
		call limpiaPantalla

		lea bx, cambioPalabraTxt
		push bx
		call imprimir

		lea bx, texto
		xor ch,ch
		mov cl, 4
		call limpiarVariables

		lea dx, texto
		mov al,0dh
		call carga

		lea bx, tuPalabraEs
		push bx
		call imprimir

		lea bx, texto
		push bx
		call imprimir

		mov ah, 1
		int 21h

		;call limpiaPantalla


		jmp ingresoPalabraMenu

graciasProc2:
	lea bx, gracias
	push bx
	call imprimir

fin:
    mov ax, 4c00h
    int 21h
main endp

end