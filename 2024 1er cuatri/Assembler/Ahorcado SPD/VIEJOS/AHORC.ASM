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
	bienvenida db "------------------------------------------------------------------",0ah, 0dh
	db "AHORCADO", 0dh, 0ah
	db "Adivina la palabra que pone el jugador 2! Tenes 6 vidas",0ah, 0dh, 24h
	salto db 0dh,0ah, 24h ;salto de linea para las impresiones
	gracias db "Gracias por jugar! :)",0ah, 0dh, 24h
	perdisteTxt db "------------------------------------------------------------------",0ah, 0dh
	db "Has perdido todas tus vidas! Fin del juego.", 0ah, 0dh
	db "                   ___          " , 0ah, 0dh
	db "                  /   \\        " , 0ah, 0dh
	db "             /\\ | . . \\       " , 0ah, 0dh
	db "           ////\\|     ||       " , 0ah, 0dh
	db "         ////   \\ ___//\       " , 0ah, 0dh
	db "        ///      \\      \      " , 0ah, 0dh
	db "       ///       |\\      |     " , 0ah, 0dh
	db "      //         | \\  \   \    " , 0ah, 0dh
	db "      /          |  \\  \   \   " , 0ah, 0dh
	db "                 |   \\ /   /   " , 0ah, 0dh
	db "                 |    \/   /    " , 0ah, 0dh
	db "                 |     \\/|     " , 0ah, 0dh
	db "                 |      \\|     " , 0ah, 0dh
	db "                 |       \\     " , 0ah, 0dh
	db "                 |        |     " , 0ah, 0dh
    db "                 |_________\   " , 0ah, 0dh, 24h
	ganasteTxt db "------------------------------------------------------------------",0ah, 0dh
	db "GANASTEEE!!!!!! FELICIDADES :D", 0ah, 0dh
	db "          |\      _,,,---,,_",0dh,0ah
	db "    ZZZzz /,`.-'`'    -.  ;-;;,",0dh,0ah
	db "         |,4-  ) )-,_. ,\ (  `'-'",0dh,0ah
	db "        '---''(_/--'  `-'\_)  ",0dh,0ah,24h
	continuarTxt  db "------------------------------------------------------------------",0ah, 0dh
	db "Desea continuar? S/N",0ah,0dh,24h

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
	letraCorrectaTxt db "LETRA CORRECTA!",0ah,0dh,24h
	letraIncorrectaTxt db "LETRA INCORRECTA. VIDAS: ",0ah,0dh,24h
	ingreseLetraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "INGRESE UNA LETRA",0ah,0dh,24h

	;VARIABLES
	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h
	vidas db 6 ; Inicialmente el jugador tiene 6 vidas
	ingresado db 0
	guiones db 255 dup (24h),0dh,0ah,24h
	continue db "0",0dh,0ah,24h
	vidasTxt db 0,0dh,0ah,24h

	;ERRORES
	error db "------------------------------------------------------------------",0ah, 0dh
	db "Ingrese una opcion valida :(",0dh,0ah,24h
	errorIngresado db "------------------------------------------------------------------",0ah, 0dh
	db "Ya ingresaste! Toca en CAMBIAR PALABRA",0dh,0ah,24h
	errorSinPalabraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "No hay palabra para jugar :(",0dh,0ah,24h

.code
	extrn imprimir:proc
	extrn cargaExtendida:proc
	extrn limpiarVariables:proc
	extrn limpiaPantalla:proc
	extrn ponerGuiones:proc
	extrn actualiza_guiones:proc
	extrn contarCaracteres:proc
	extrn mayus_letra:proc
	extrn mayusculizar:proc
	extrn contarCaracterEsp:proc

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
	je ingresoPalabraMenu2

	;MENSAJE DE ERROR
	call limpiaPantalla

	lea bx, error
	push bx
	call imprimir
	jmp programa

graciasProc:
		jmp graciasProc2

ingresoPalabraMenu2:
	jmp ingresoPalabraMenu
errorSinPalabra:
	lea bx, errorSinPalabraTxt
	push bx
	call imprimir
	
	mov ah, 1
	int 21h

	jmp programa

jugar: ;ACA TODO EL PROCESO DE JUEGo
	lea dx, texto
	call contarCaracteres

	cmp dl,0
	je errorSinPalabra

	mov vidas, 6 	
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

	;aca empieza el juego?

	buclejuego: 

	CALL limpiaPantalla 

	lea bx, ingreseLetraTxt
	push bx
	call imprimir

	lea bx, guiones
	push bx
	call imprimir

	lea bx, salto
	push bx
	call imprimir

	mov ah, 1
	int 21h ;registra el caracter a evaluar
	;lo guarda en AL 

	;funcion que mayusculiza el caracter 
	CALL mayus_letra

	lea bx,guiones 
	lea si, texto 
	CALL actualiza_guiones

	cmp cx,1 
	je letraCorrecta

	lea dx, guiones
	mov al, 2Dh
	call contarCaracterEsp
	cmp dl, 1
	je ganaste

	jmp letraIncorrecta

	letraCorrecta:
	lea bx, letraCorrectaTxt
	push bx
	call imprimir

	mov ah, 1
	int 21h

	jmp buclejuego

	letraIncorrecta:
	lea bx, letraIncorrectaTxt
	push bx
	call imprimir

	dec vidas

	mov al, vidas
	mov vidasTxt,al
	add vidasTxt,30h

	lea bx, vidasTxt
	push bx
	call imprimir

	mov ah, 1
	int 21h

	cmp vidas, 0
	je perdiste

	
	jmp buclejuego

	perdiste:
		call limpiaPantalla
		lea bx, perdisteTxt
		push bx
		call imprimir

		mov ah,1
		int 21h
		jmp continuar

	ganaste:
		call limpiaPantalla
		lea bx, ganasteTxt
		push bx
		call imprimir

		mov ah,1
		int 21h
		jmp continuar


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

	lea bx, error
	push bx
	call imprimir
	
	mov ah, 1
	int 21h
	jmp ingresoPalabraMenu
	
	volver:
		jmp programa


	ingresoPalabra:;SOLO CARGA LETRAS LA CAJA
		cmp ingresado, 1
		je errorIngresoPal
	
		call limpiaPantalla

		lea bx, ingresoPalabraTxt
		push bx
		call imprimir

		lea bx, texto
		mov al,0dh
		call cargaExtendida

		lea dx, texto
		CALL mayusculizar

		lea bx, tuPalabraEs
		push bx
		call imprimir

		lea bx, texto
		push bx
		call imprimir


		mov ingresado, 1

		mov ah, 1
		int 21h

		jmp ingresoPalabraMenu

	errorIngresoPal:

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

		lea bx, texto
		mov al,0dh
		call cargaExtendida

		lea dx, texto
		CALL mayusculizar

		lea bx, tuPalabraEs
		push bx
		call imprimir

		lea bx, texto
		push bx
		call imprimir

		mov ah, 1
		int 21h

		jmp ingresoPalabraMenu

	continuar:
		call limpiaPantalla
		lea bx, continuarTxt
		push bx
		call imprimir

		mov ah, 1
		int 21h
		mov continue,al

		cmp continue,53h ;S
		je vueltaPrograma
		cmp continue,73h ;s
		je vueltaPrograma

		cmp continue, 4Eh ;N
		je graciasProc2
		cmp continue, 6Eh ;n
		je graciasProc2

		;ERROR

		lea bx, error
		push bx
		call imprimir
		
		mov ah, 1
		int 21h
		jmp continuar

vueltaPrograma:
	lea bx, texto
	xor ch,ch
	mov cl, 4
	call limpiarVariables

	mov ingresado, 0

	jmp programa
graciasProc2:
	lea bx, gracias
	push bx
	call imprimir

fin:
    mov ax, 4c00h
    int 21h
main endp

end