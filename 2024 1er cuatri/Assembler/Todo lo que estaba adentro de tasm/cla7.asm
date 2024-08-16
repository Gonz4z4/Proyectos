.8086
.model small
.stack 100h
.data
    mensaje db "CLASE 2: pasando parametros a funciones en lib6",0dh,0ah,24h
    texto db 255 dup (24h),0dh,0ah,24h
    cantidad db 0
    posicion db '000', 0dh, 0ah, 24h
    dataDiv db 100,10,1
.code
extrn carga:proc
extrn encuentra:proc
extrn regToAscii:proc
main proc
    mov ax, @data 
    mov ds, ax 

    mov ah, 9
    lea dx, mensaje
    int 21h

    mov dx, offset texto ;offset variable a llenar
    mov al, 0dh ;caracter de finalizacion
    call carga

    mov dx, offset texto
    mov al, 'a' ;BUSCA LA a EN EL TEXTO
    xor ah, ah
    push dx
    lea dx, cantidad
    push dx
    push ax
    call encuentra

    ;IMPRIMO LA POSICION DEL CARACTER
    mov dl, cantidad ;paso por dl el reg para pasar a ascii
    lea bx, posicion ;pongo en bx la variable a llenar de ascii
    lea si, dataDiv ;pongo en si los numeros por los que dividir
    call regToAscii

    mov ah, 9
    lea dx, posicion
    int 21h


    mov ax, 4c00h
    int 21h
main endp


end