.8086
.model small
.stack 100h
.data
;INDICACIONES-------------------------------------
	bienvenida db "Bienvenido!",0dh,0ah
        db "Ingrese un caracter para finalizar la carga de su texto", 0dh,0ah,24h
    salto db 0dh,0ah, 24h  
    ingreso db "Ingrese un texto:"


;VARIABLES----------------------------------------
    caracter db "0" ,0dh,0ah,24h
    texto db 255 dup (24h),0dh,0ah,24h

;ERRORES------------------------------------------
    error db "INGRESE UN NUMERO VALIDO"
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

    mov ah, 1
    int 21h
    mov caracter, al

    lea bx, salto
    push bx
    call imprimir

    lea bx, ingreso
    push bx
    call imprimir

    xor ah,ah
    lea dx, texto ;TENGO QUE CARGAR EN DX LA VARIABLE A ESCRIBIR
    mov al, caracter ;en esta carga con el contenido de al se termina, así que le paso a al el caracter
    call carga



fin:
    mov ax, 4c00h
    int 21h
main endp
end