;MI GENTE, ACUERDENSE DE COMPILAR ESTO CON LA LIBRERIA (AHORLIB.ASM)
.8086
.model small
.stack 100h
.data
	;MENUES---------------------------------------
	menu db "--------------------------------------------------------------------------------",0ah, 0dh
	db "MENU:",0ah, 0dh
	db "1) JUGAR",0ah, 0dh
	db "2) INGRESAR/CAMBIAR PALABRA A ADIVINAR",0ah, 0dh
	db "0) SALIR",0ah, 0dh
	db "Seleccion->",24h 
	ingresarPalabraMenu db "--------------------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE INGRESAR O CAMBIAR TEXTO",0ah, 0dh
	db "1) INGRESAR PALABRA",0ah, 0dh
	db "2) CAMBIAR PALABRA",0ah, 0dh
	db "0) VOLVER",0ah, 0dh
	db "Seleccion->",24h

	;MENSAJES GENERICOS-------------------------------------
	integrantes db "Integrantes: Augusto De Zan, Bianca Melissa Nava, Gonzalo Arias Lucini, Juan Estevez y Lucia Arrieta", 0dh, 0ah,24h
	bienvenida db "--------------------------------------------------------------------------------",0ah, 0dh
	db "Adivina la palabra que pone el jugador 2! Tenes 6 vidas",0ah, 0dh, 24h
	bienvenidaSeguir db "Presione cualquier tecla para empezar",0ah, 0dh, 24h
	seguir db "Presione cualquier tecla para seguir",0ah, 0dh, 24h
	salto db 0dh,0ah, 24h ;salto de linea para las impresiones
	gracias db "Gracias por jugar! :)",0ah, 0dh, 24h
	perdisteTxt db "--------------------------------------------------------------------------------",0ah, 0dh
	db "Has perdido todas tus vidas! Fin del juego.", 0ah, 0dh
	db "                                   ___          " , 0ah, 0dh
	db "                                  /   \\        " , 0ah, 0dh
	db "                             /\\ | . . \\       " , 0ah, 0dh
	db "                           ////\\|     ||       " , 0ah, 0dh
	db "                         ////   \\ ___//\       " , 0ah, 0dh
	db "                        ///      \\      \      " , 0ah, 0dh
	db "                       ///       |\\      |     " , 0ah, 0dh
	db "                      //         | \\  \   \    " , 0ah, 0dh
	db "                      /          |  \\  \   \   " , 0ah, 0dh
	db "                                 |   \\ /   /   " , 0ah, 0dh
	db "                                 |    \/   /    " , 0ah, 0dh
	db "                                 |     \\/|     " , 0ah, 0dh
	db "                                 |      \\|     " , 0ah, 0dh
	db "                                 |       \\     " , 0ah, 0dh
	db "                                 |        |     " , 0ah, 0dh
    db "                                 |_________\   " , 0ah, 0dh, 24h
	continuarTxt  db "--------------------------------------------------------------------------------",0ah, 0dh
	db "Desea continuar? S/N",0ah,0dh,24h



	;MENSAJES DENTRO DEL JUEGO
	ingresoPalabraTxt db "--------------------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE INGRESAR PALABRA...",0ah, 0dh
	db "INGRESE UNA SOLA PALABRA", 0ah, 0dh,24h
	cambioPalabraTxt db "--------------------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE CAMBIAR LA PALABRA...",0ah, 0dh
	db "INGRESE UNAS SOLA PALABRA:",0ah, 0dh,24h
	tuPalabraEs db "Tu palabra es: ",24h
	letraCorrectaTxt db "LETRA CORRECTA!",0ah,0dh,24h
	letraIncorrectaTxt db "LETRA INCORRECTA. VIDAS: ",0ah,0dh,24h
	ingreseLetraTxt db "--------------------------------------------------------------------------------",0ah, 0dh
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
	error db "--------------------------------------------------------------------------------",0ah, 0dh
	db "Ingrese una opcion valida :(",0dh,0ah,24h
	errorIngresado db "--------------------------------------------------------------------------------",0ah, 0dh
	db "Ya ingresaste! Toca en CAMBIAR PALABRA",0dh,0ah,24h
	errorSinPalabraTxt db "--------------------------------------------------------------------------------",0ah, 0dh
	db "No hay palabra para jugar :(",0dh,0ah,24h

	; Dibujo del muñeco del ahorcado
	img0 	db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img1 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img2 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img3 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "  /|   |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img4 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "  /|\  |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img5 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "  /|\  |   ",0dh,0ah
            db "  /    |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h

       img6 db "   +---+   ",0dh,0ah
            db "   |   |   ",0dh,0ah
            db "   O   |   ",0dh,0ah
            db "  /|\  |   ",0dh,0ah
            db "  / \  |   ",0dh,0ah
            db "       |   ",0dh,0ah
            db "  =========",0dh,0ah,24h


       ganasteMsj 	db"                    ____                       _       ",0dh,0ah
               		db"                  / ____|                     | |      ",0dh,0ah
               		db"                 | |  __  __ _ _ __   __ _ ___| |_ ___ ",0dh,0ah
               		db"                 | | |_ |/ _` | '_ \ / _` / __| __/ _ \",0dh,0ah
               		db"                 | |__| | (_| | | | | (_| \__ \ ||  __/",0dh,0ah
               		db"                  \_____|\__,_|_| |_|\__,_|___/\__\___|",0dh,0ah,24h
                                       
                                       
                                                                  
                                              
       perdisteMsj 	db"                  _____             _ _     _       ",0dh,0ah
                	db"                 |  __ \           | (_)   | |      ",0dh,0ah
                	db"                 | |__) |__ _ __ __| |_ ___| |_ ___ ",0dh,0ah
                	db"                 |  ___/ _ \ '__/ _` | / __| __/ _ \",0dh,0ah
                	db"                 | |  |  __/ | | (_| | \__ \ ||  __/",0dh,0ah
                	db"                 |_|   \___|_|  \__,_|_|___/\__\___|",0dh,0ah,24h

       ahorcadoMsj  db"                         ",0dh,0ah
       				db"                         ",0dh,0ah
       				db"                          )    )  (               (        )    ",0dh,0ah
					db"                  (     ( /( ( /(  )\ )  (    (    )\ )  ( /(   ",0dh,0ah
					db"                  )\    )\()))\())(()/(  )\   )\  (()/(  )\())  ",0dh,0ah
					db"               ((((_)( ((_)\((_)\  /(_)|((_|(((_)( /(_))((_)\   ",0dh,0ah
					db"                )\ _ )\ _((_) ((_)(_)) )\___)\ _ )(_))_   ((_)  ",0dh,0ah
					db"                (_)_\(_) || |/ _ \| _ ((/ __(_)_\(_)   \ / _ \  ",0dh,0ah
					db"                 / _ \ | __ | (_) |   /| (__ / _ \ | |) | (_) | ",0dh,0ah
					db"                /_/ \_\|_||_|\___/|_|_\ \___/_/ \_\|___/ \___/  ",0dh,0ah
					db"                         ",0dh,0ah
					db"                         ",0dh,0ah,24h
                                                 


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
	extrn vidas6:proc
	extrn esperarTecla:proc


main proc
    mov ax, @data 
    mov ds, ax 

    mov bx, 0

    call limpiaPantalla

    lea bx, ahorcadoMsj
    push bx
    call imprimir

    lea bx, salto
	push bx
	call imprimir

    lea bx, bienvenida
    push bx
    call imprimir


	lea bx, integrantes
	push bx
	call imprimir


    lea bx, bienvenidaSeguir
    push bx
    call imprimir

    call esperarTecla

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
	lea bx, error
	push bx
	call imprimir

	mov ah, 1
	int 21h

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

jugar: ;ACA TODO EL PROCESO DE JUEGO
	lea dx, texto
	call contarCaracteres

	cmp dl,0
	je errorSinPalabra

	mov vidas, 6
	call limpiaPantalla

	;parte que cambia la palabra a guiones
	lea bx, guiones
	xor ch,ch
	mov cl, 4
	call limpiarVariables

	lea dx, texto
	lea si, guiones
	call ponerGuiones

    ; Dibujar el hombrecito del ahorcado antes de empezar el juego
    call estado_vidas
	
buclejuego: ;aca empieza el juego!

	CALL limpiaPantalla

    ; Dibujar el hombrecito del ahorcado en cada iteración
	call estado_vidas 

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

	CALL limpiaPantalla

	cmp cx,1 
	je letraCorrecta

	lea dx, guiones
	mov al, 2Dh
	call contarCaracterEsp
	cmp dl, 1
	je ganaste

	; Dibujar el hombrecito del ahorcado
	call estado_vidas

	jmp letraIncorrecta

	letraCorrecta:
	lea bx, letraCorrectaTxt
	push bx
	call imprimir

	; Dibujar el hombrecito del ahorcado
	call estado_vidas

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
		CALL limpiaPantalla
		lea bx, perdisteMsj
		push bx
		call imprimir

		lea bx, salto
		push bx
		call imprimir

		lea bx, seguir
		push bx
		call imprimir

		mov ah,1
		int 21h
		jmp continuar

	ganaste:
		CALL limpiaPantalla
		lea bx, ganasteMsj
		push bx
		call imprimir

		lea bx, salto
		push bx
		call imprimir

		lea bx, seguir
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
	lea bx, salto
	push bx
	call imprimir

	lea bx, gracias
	push bx
	call imprimir

fin:
    mov ax, 4c00h
    int 21h
main endp

estado_vidas proc
	cmp vidas, 6
	je estado_vidas_6
    cmp vidas, 5
    je estado_vidas_5
    cmp vidas, 4
    je estado_vidas_4
    cmp vidas, 3
    je estado_vidas_3
    cmp vidas, 2
    je estado_vidas_2
    cmp vidas, 1
    je estado_vidas_1
    cmp vidas, 0
    je estado_vidas_0
    ret

estado_vidas_6:
    lea bx, img0
    push bx
    call imprimir
    ret

estado_vidas_5:
    lea bx, img1
    push bx
    call imprimir
    ret

estado_vidas_4:
    lea bx, img2
    push bx
    call imprimir
    ret

estado_vidas_3:
    lea bx, img3
    push bx
    call imprimir
    ret

estado_vidas_2:
    lea bx, img4
    push bx
    call imprimir
    ret

estado_vidas_1:
    lea bx, img5
    push bx
    call imprimir
    ret

estado_vidas_0:
    lea bx, img6
    push bx
    call imprimir
    ret

estado_vidas endp
end
