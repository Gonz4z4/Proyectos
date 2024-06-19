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
	db "Adiviná la palabra que pone tu compañero! Tenés 6 vidas",0ah, 0dh, 24h
	salto db 0dh,0ah, 24h ;salto de linea para las impresiones
	gracias db "Gracias por jugar! :)",0ah, 0dh, 24h
	perdiste db "Has perdido todas tus vidas! Fin del juego.", 0ah, 0dh, 24h
	ganaste db "GANASTEEE!!!!!! FELICIDADES :D", 0ah, 0dh, 24h

	;MENSAJES DENTRO DEL JUEGO
	jugarTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE JUGAR",0ah, 0dh,24h
	ingresoPalabraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE INGRESAR PALABRA (lastima que todavia no esta implementado...)",0ah, 0dh,24h
	cambioPalabraTxt db "------------------------------------------------------------------",0ah, 0dh
	db "DECIDISTE CAMBIAR LA PALABRA (lastima que todavia no esta implementado...)",0ah, 0dh,24h

	;VARIABLES
	texto db 255 dup (24h),0dh,0ah,24h
	opcion db "0",0dh,0ah,24h
	vidas db 6 ; Inicialmente el jugador tiene 6 vidas

	;ERRORES
	error db "------------------------------------------------------------------",0ah, 0dh
	db "Ingrese una opcion valida :(",0dh,0ah,24h

.code
	extrn imprimir:proc
	extrn carga:proc

main proc
    mov ax, @data 
    mov ds, ax 

    mov bx, 0

    lea bx, bienvenida
    push bx
    call imprimir


programa:
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
	lea bx, error
	push bx
	call imprimir
	jmp programa

graciasProc:
	jmp graciasProc2 ;Pongo esto porque un JE no salta tan lejos...

jugar: ;ACA TODO EL PROCESO DE JUEGO
	mov vidas, 6  ; Reiniciar las vidas cada vez que comienza un juego nuevo
	lea bx, jugarTxt
	push bx
	call imprimir

bucle_juego:
	; Simulación de una letra fallida
	; Aquí iría la lógica real del juego donde el jugador adivina una letra

	; Disminuir vidas si la letra es incorrecta
	dec vidas
	cmp vidas, 0
	je fin_del_juego

	; Continuar con el juego (repetir el bucle)
	jmp bucle_juego

fin_del_juego:
	lea bx, perdiste
	push bx
	call imprimir

	; Regresar al menú principal
	jmp programa

ingresoPalabraMenu: ;ACA INGRESO Y CAMBIO DE PALABRA
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
	jmp ingresoPalabraMenu
	
	volver:
		jmp programa

	ingresoPalabra:;SOLO CARGA LETRAS LA CAJA
		lea bx, ingresoPalabraTxt
		push bx
		call imprimir

		lea dx, texto
		mov al,0dh
		call carga

		lea bx, texto
		push bx
		call imprimir

		jmp ingresoPalabraMenu

	cambioPalabra:
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

		lea bx, texto
		push bx
		call imprimir

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
