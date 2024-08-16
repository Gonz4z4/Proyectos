.8086
.model small
.stack 100h
.data
    mensaje db "CLASE 2: pasar parametros por stack",0dh,0ah,24h
    texto db 255 dup (24h),0dh,0ah,24h
    cantidad db 0
    caracter db "Caracter a en:",0dh,0ah,24h
    posicion db '000', 0dh, 0ah, 24h
    dataDiv db 100,10,1
.code

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

carga proc
    ;RECIBE POR DX EL OFFSET DE UNA VARIABLE PARA LLENAR CON TEXTO
    ;RECIBE POR AL EL CARACTER DE FINALIZACION
    ;Devuelve llena la variable de la cual entregamos el offset
    push bx
    push ax
    push dx

    mov bx, dx ;cargo el offset de la variable a llenar en bx
    mov dl, al ;en al esta el caracter de finalizacion
    procCarga:
        mov ah, 1
        int 21h
        cmp al, dl ;cuando escriba el caracter de finalizacion, termina la carga
        je finCarga
        mov [bx], al
        inc bx
    jmp procCarga
    fincarga:
    pop dx
    pop ax
    pop bx
    ret
carga endp

encuentra proc
    ;ENCUENTRA UN CARACTER Y DEVUELVE SU POSICION
    ;Ingresar caracter a buscar en al, en dx el offset del texto a buscar el caracter y devuelve en si la posicion
    ;ss:[bp+4] CARACTER
    ;ss:[bp+6] OFFSET POSICION
    ;ss:[bp+8] OFFSET TEXTO

    push bp
    mov bp, sp ;hago que bp y sp estén en el mismo lugar
    push bx
    push ax
    push si

    mov bx, ss:[bp+8] ;offset texto a recorrer
    mov si, ss:[bp+6] ;offset posicion
    mov ax, ss:[bp+4] ;caracter a buscar
    xor ah, ah
    procEncuentro:
        cmp [bx], byte ptr 24h
        je finEncuentra
        cmp [bx], al ;en al está en caracter a encontrar
        je encontrado
        inc ah
        inc bx
    jmp procEncuentro

    encontrado:
        mov[si],ah ;la posicion en la que se encuentra el caracter
        jmp final

    finEncuentra:
    mov [si], byte ptr 255 ;DEVUELVO CODIGO DE ERROR

    final: 
    pop si
    pop ax
    pop bx
    pop bp 
    ret 6 ; limpio 3 bytes
encuentra endp

    ;RECIBE EN DL UN NUM DE 1 BYTE, DEVUELVE EN UN OFFSET
    ;UNA VARIABLE CON 3 ASCII LLENA
    regToAscii proc
        push dx
        push ax
        push si
        push cx
        push bx

        mov al, dl
        mov cx, 3
        r2a:
            xor ah,ah
            mov dl, [si] ;valor por el que quiero dividir ax
            div dl ; (AX/DL) en ah queda 12 (resto) y en al queda 2 (resultado)
            add [bx], al
            xchg al, ah ;paso el resto a al para seguir dividiendolo
            inc bx
            inc si
        loop r2a; loopea cx veces
        
        pop bx
        pop cx
        pop si
        pop ax
        pop dx
    ret
    regToAscii endp
end