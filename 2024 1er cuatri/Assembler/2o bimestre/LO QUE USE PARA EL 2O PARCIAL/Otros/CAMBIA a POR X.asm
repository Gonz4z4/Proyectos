.8086
.model small
.stack 100h
.data
        cartel1 db "Bienvenido al Programa que cambia A x X", 0dh, 0ah,"Ingrese un texto de hasta 255 Caracteres" , 0dh, 0ah, '$'
        cargav db 255 dup('$'), 0dh, 0ah, '$'
        cargaMod db 255 dup('$'), 0dh, 0ah, '$'
        salto db 0dh, 0ah, 24h
.code
main proc
        mov ax, @data
        mov ds, ax

        mov ah,9
        mov dx, offset cartel1
        int 21h
        mov bx, 0

carga:  cmp bx, 255
        je termine
        mov ah, 1
        int 21h
        cmp al, 0dh
        je termine
        mov cargav[bx], al
        cmp al, 'a'
        je cambiar
        mov cargaMod[bx],al
        inc bx
        jmp carga

cambiar: mov cargaMod[bx],'x'
        inc bx
        jmp carga


termine:

        mov ah, 9
        mov dx, offset salto
        int 21h


        mov ah, 9
        mov dx, offset cargav
        int 21h

        mov ah, 9
        mov dx, offset salto
        int 21h

        mov ah, 9
        mov dx, offset cargaMod
        int 21h

        mov ax,4C00h
        int 21h
main endp
end main
