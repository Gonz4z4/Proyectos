.8086
.model small
.stack 100h

.data
salto db 0dh,0ah,24h
;--------------DIBUJOS
gatete db "      |\      _,,,---,,_",0dh,0ah
	db"ZZZzz /,`.-'`'    -.  ;-;;,",0dh,0ah
	db"     |,4-  ) )-,_. ,\ (  `'-'",0dh,0ah
	db"    '---''(_/--'  `-'\_)  ",0dh,0ah,24h
;-------------ERRORES
error db "ingrese correctamente!",0dh,0ah,24h
;-------------finales
fin1 db " te vas a una isla tropical o algo asi no me acuerdo bien los finales",0dh,0ah,24h
fin2 db "final 2 tampoco me acuerdo pero bueno",0dh,0ah,24h
fin3 db "todo era un sueño. el gato eras vos",0dh,0ah,24h
fin4 db "te hacen puchero",0dh,0ah,24h
fin5 db "te rendis, los esclavos gatunos y vos hacen una revolucion francesa. te convertis en el rey d los gato y aprobas spd",0dh,0ah,24h

;--------------situaciones
situacion1 db "Saliste del trabajo temprano, a unos pocos pasos de la puerta te encontras un gato, parece perdido",0dh,0ah,24h
opcion1 db "1. lo acaricias				2. lo pateas",0dh,0ah,24h
decision1 db "0",0dh,0ah,24h

situacion1a db "Lo acariciaste y te lo llevaste a casa. Vino quien parece ser que lo cuida a preguntar si lo viste",0dh,0ah,24h
opcion1a db "1. Decir la verdad (devolverlo)				2. Mentir (quedartelo)",0dh,0ah,24h
decision1a db "0",0dh,0ah,24h

situacion2 db "Por que harías eso? Llegas a tu casa e inmediatamente sentis que hay algo mal... Escuchas un ruido en tu patio",0dh,0ah,24h
opcion2 db "1. Ignorar, no debe ser nada				2. Vas a investigar",0dh,0ah,24h
decision2 db "0",0dh,0ah,24h

situacion2a db "Te levantas a ver, una vez cruzas el ventanal que lleva al patio sentis un golpe en la nuca. Te levantás atado",0dh,0ah,24h
puntos db "...",0dh,0ah,24h
situacion2b db "Lo que ",0dh,0ah,24h
opcion2a db "1. luchar				2. rendirse",0dh,0ah,24h
decision2ab db "0",0dh,0ah,24h

.code
main proc
	mov ax, @data
	mov ds, ax

	mov bx, 0

	lea bx, gatete
	push bx
	call imprimir

	lea bx, salto
	push bx
	call imprimir

	lea bx, situacion1
	push bx
	call imprimir

	lea bx, opcion1
	push bx
	call imprimir

	decision:
	mov ah,1
	int 21h
	mov decision1, al

	sub decision1, 30h
	cmp decision1, 2
	je patear
	cmp decision1, 1
	je acariciar

	nodec:
	lea bx, error
	push bx
	call imprimir
	jmp decision

	acariciar:
	mov ah,9
	mov dx, offset salto
	int 21h

	mov ah,9
	mov dx, offset situacion1a
	int 21h

	mov ah,9
	mov dx, offset opcion1a
	int 21h	

	mov ah,1
	int 21h
	mov decision1a, al
	
	sub decision1a,30h
	cmp decision1a,2
	je quedar

		devolver:
		mov ah,9
		mov dx, offset salto
		int 21h

		mov ah,9
		mov dx, offset fin1
		int 21h
		
		jmp fin

		quedar:

		mov ah,9
		mov dx, offset salto
		int 21h

		mov ah,9
		mov dx, offset fin2
		int 21h
		
		jmp fin

	patear:
	mov ah,9
	mov dx, offset salto
	int 21h

	mov ah,9
	mov dx, offset situacion2
	int 21h

	mov ah,9
	mov dx, offset opcion2
	int 21h	

	
	mov ah,1
	int 21h
	mov decision2, al
	

	sub decision2,30h
	cmp decision2,2
	je investigar

		ignorar:
		mov ah,9
		mov dx, offset salto
		int 21h

		mov ah,9
		mov dx, offset fin3
		int 21h

		jmp fin

		investigar:
		mov ah,9
		mov dx, offset salto
		int 21h

		mov ah,9
		mov dx, offset situacion2a
		int 21h

		mov ah,9
		mov dx, offset situacion2b
		int 21h

		mov ah,9
		mov dx, offset opcion2a
		int 21h	

		mov ah,1
		int 21h
		add decision2ab, al

		sub decision2ab,30h
		cmp decision2ab,2
		je rendirse

			luchar:
			mov ah,9
			mov dx, offset salto
			int 21h

			mov ah,9
			mov dx, offset fin4
			int 21h

			jmp fin 
			rendirse:
			mov ah,9
			mov dx, offset salto
			int 21h

			mov ah,9
			mov dx, offset fin5
			int 21h
				
fin:
	mov ax, 4c00h
	int 21h
	
	main endp


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
imprimir endp

end main