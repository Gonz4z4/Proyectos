.8086
.model small
.stack 100h

.data

	dataDivMul db 100,10,1 ;100 10 1
.code
public carga
public contarCaracteres
public regToAscii
public imprimir
public contarCaracterEsp
public contarNumeros
public limpiarVariables


;---------------------------------------------------------
;llena una variable con caracteres ascii, termina la carga con caracter en AL, 
;recibe en bx, el offset
;de la variable a llenar
carga proc

        push bx ; PROFILAXIS
        push dx
        push ax

        mov bx, dx ; CARGO EL OFFSET EN BX
        mov dl, al ; MUEVO EL CARACTER DE FINALIZACIÖN A DL
        xor dh, dh 
 cargaTexto:
        mov ah, 1
        int 21h
        cmp al, dl
        je finCarga 
        mov [bx], al 
        inc bx
 jmp cargaTexto
 finCarga:
        pop ax
        pop dx
        pop bx
 ret
carga endp
;---------------------------------------------------------
; RECIBE EL OFFSET DE VARIABLE DESDE DX, DEVUELVE EN DL EL RESULTADO
contarCaracteres proc
       push bx

       mov bx, dx ; cargo el offset de la variable en [bx]
       xor dx, dx ; Limpio para usar dl
contar:
       cmp [bx], byte ptr 24h
       je finContar
       inc dl
       inc bx
jmp contar 
finContar:
       mov dh, 0 ; Limpio dh por las dudas

       pop bx
 ret
contarCaracteres endp
;---------------------------------------------------------
; RECIBE EL OFFSET DE VARIABLE DESDE DX, DEVUELVE EN DL EL RESULTADO
contarNumeros proc
       push bx

       mov bx, dx ; cargo el offset de la variable en [bx]
       xor dx, dx ; Limpio para usar dl
contarNum:
       cmp [bx], byte ptr 24h
       je finContarNum
       cmp [bx], byte ptr 30h
       jae casiNum
       jne sigo

sigo:
       inc bx
jmp contarNum


casiNum:
	   cmp [bx], byte ptr 39h
       jbe esNum
       jne sigo
esNum:
       inc dl
       inc bx
     jmp contarNum

finContarNum:
       mov dh, 0 ; Limpio dh por las dudas

       pop bx
 ret
contarNumeros endp
;---------------------------------------------------------
; RECIBE EL OFFSET DE VARIABLE DESDE DX, 
; Y EL CARACTER A CONTAR EN AL
; DEVUELVE EN DL EL RESULTADO
contarCaracterEsp proc
       push bx
       push ax

       mov bx, dx ; cargo el offset de la variable en [bx]
       xor dx, dx ; Limpio para usar dl
       xor ah,ah
recorro:
       cmp [bx], byte ptr 24h
       je finContarCar
       cmp [bx], al
       je contarCar
       inc bx
jmp recorro 

contarCar:
      inc dl
      inc bx
      jmp recorro
finContarCar:
       mov dh, 0 ; Limpio dh por las dudas

       pop ax
       pop bx
 ret
contarCaracterEsp endp
;---------------------------------------------------------
;RECIBE EN DL UN NRO DE UN BYTE
;Y DEVUELVE EN UN OFFSET BX (DIRECCIÓN)
;UNA VARIABLE CON 3 ASCII LLENA
regToAscii proc
        push ax
        push dx
        push cx
        push si
        push bx

        xor si,si
        xor ax, ax
        mov al, dl ;MUEVO EL NUMERO(reg) A al PARA HACER LA DIVISION

        mov cx, 3
 rta: ;("Reg.To.Ascii" = rta)
        mov dl, dataDivMul[si] ; [si] -> dataDivMul
        div dl 
        add [bx],al     ; Se suma porque [bx] es "000", o sea: 30h, 30h, 30h
        xchg al, ah     ;INTERCAMBIA VALORES
        xor ah, ah 
        inc bx 
        inc si
 loop rta
        
        pop bx
        pop si
        pop cx
        pop dx
        pop ax
 ret
regToAscii endp
;---------------------------------------------------------
; GUARDA DESDE EL STACK EN DX
; LA CADENA A IMPRIMIR
;(enviar cadena como parametro con si o bx)
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
;---------------------------------------------------------
; REVIBE EL OFFSET DE LA VARIABLE A LIMPIAR EN BX Y
; EN [CL] EL NUMERO DE TIPO DE VARIABLE
; [1] DECIMAL [2] HEX [3] BIN [4] TEXTO
limpiarVariables proc
       push cx 
       push bx


       cmp cl, 1
       je VarAscii
       cmp cl, 2
       je VarHex
       cmp cl, 3
       je VarBin
       cmp cl, 4
       je VarText

VarAscii:
       mov cx, 3   
 limpiarNroAscii:
       mov [bx], byte ptr 30h
       inc bx
 loop limpiarNroAscii
 jmp finLimpiar

VarHex:
       mov cx, 2
 limpiarNroHex:
       mov [bx], byte ptr 30h
       inc bx
 loop limpiarNroHex
 jmp finLimpiar

VarBin:
       mov cx, 8
 limpiarNroBin:
       mov [bx], byte ptr 30h
       inc bx
 loop limpiarNroBin
jmp finLimpiar

VarText:

 limpiarTexto:
       cmp [bx], byte ptr 24h
       jmp finLimpiar
       mov [bx], byte ptr 24h
       inc bx
 loop limpiarTexto
jmp finLimpiar

finLimpiar:
       mov cx, 0

       pop bx 
       pop cx
       ; pop bp
       ret ;2
limpiarVariables endp
;---------------------------------------------------------

end