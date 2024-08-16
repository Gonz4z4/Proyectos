.8086
.model small
.stack 100h

.data
       color db ?  
       salto db 0dh,0ah, 24h ;salto de linea para las impresiones
       img0 db "   +---+   ",0dh,0ah
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


       ganaste db"    ____                       _       ",0dh,0ah
               db"  / ____|                     | |      ",0dh,0ah
               db" | |  __  __ _ _ __   __ _ ___| |_ ___ ",0dh,0ah
               db" | | |_ |/ _` | '_ \ / _` / __| __/ _ \",0dh,0ah
               db" | |__| | (_| | | | | (_| \__ \ ||  __/",0dh,0ah
               db"  \_____|\__,_|_| |_|\__,_|___/\__\___|",0dh,0ah,24h
                                       
                                       
                                                                  
                                              
       perdiste db"  _____             _ _     _       ",0dh,0ah
                db" |  __ \           | (_)   | |      ",0dh,0ah
                db" | |__) |__ _ __ __| |_ ___| |_ ___ ",0dh,0ah
                db" |  ___/ _ \ '__/ _` | / __| __/ _ \",0dh,0ah
                db" | |  |  __/ | | (_| | \__ \ ||  __/",0dh,0ah
                db" |_|   \___|_|  \__,_|_|___/\__\___|",0dh,0ah,24h
                                    
  

.code

.code
public imprimir ;imprime lo que le pases por bx
public contarCaracteres ; cuenta caracteres
public contarCaracterEsp ;cuenta cantidad de caracteres en una variable
public limpiarVariables ;llena variables de $$$$
public ponerGuiones ;Genera una variable llena de guiones
public actualiza_guiones ;guiones letra pone
public cargaExtendida ;caja de carga mejorada
public mayus_letra ;letra ingresada pasa a mayus
public mayusculizar ;MAYUSCULIZA EL TEXTO PALABRA
public esperarTecla ;espera tecla seguir



;---------------------------------------------------------
cargaExtendida proc ;(a)
     push bx
     push ax
     ;Pasa la dir de la variable  en bx del tipo "xxx db 255 dup (24h),0dh,0ah"
     ;Lee hasta 255 caracteres y solo letras no numeros 
     dec bx 
     caja_carga:
         inc bx
     no_metio_letra:
         mov ah,1;8;valor modificable para sin eco 
         int 21h
         cmp bx,255
         je termino_carga
         cmp al,0dh
         je termino_carga
         cmp al,20h
         je termino_carga
         ;////////////////Modulo de deteccion de errores;////////////////////////
         cmp al, 'a'
         jb no_metio_letra
         cmp al, 'z'
         ja es_letra
         cmp al, 'A'
         jb no_metio_letra
         cmp al, 'Z'
         ja es_letra
         jmp no_metio_letra
         ;//////////////////////////////////////////////////////////////////////
     es_letra:
         mov [bx],al
         jmp caja_carga
     termino_carga:
     pop ax
     pop bx
     ret 
cargaExtendida endp
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
; RECIBE EL OFFSET DE VARIABLE DESDE DX, 
; Y EL CARACTER A CONTAR EN AL
; DEVUELVE EN DL 1 SI NO HAY DE ESE CARACTER Y 0 SI QUEDAN
contarCaracterEsp proc
       push bx
       push ax

       mov bx, dx ; cargo el offset de la variable en [bx]
       xor dx, dx ; Limpio para usar dl
       xor ah,ah
recorro:
       cmp [bx], byte ptr 24h
       je ganador
       cmp [bx], al ; el guion
       je finCharEsp
       inc bx
jmp recorro 

ganador:
       mov dh, 0 ; Limpio dh por las dudas
       mov dl, 1 ;DL 1, SOS GANADOR
       jmp finCharEsp

finCharEsp:
       pop ax
       pop bx
 ret
contarCaracterEsp endp
;---------------------------------------------------------

imprimir proc  ;Recibe el offset en BX
       ;printeo

       push bp
       mov bp, sp
       push dx
       push ax

       mov ah,9
       mov dx, offset salto
       int 21h

       mov dx, ss:[bp+4]
       mov ah,9
       int 21h


       pop ax
       pop dx
       pop bp
       ret 2

imprimir endp

;---------------------------------------------------------
; RECIBE EL OFFSET DE LA VARIABLE A LIMPIAR EN BX Y
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
       jmp finLimpiar  ; En caso de que 'cl' no coincida con ninguna opción

VarAscii:
       mov cx, 3
limpiarNroAscii:
       mov byte ptr [bx], 30h
       inc bx
       loop limpiarNroAscii
       jmp finLimpiar

VarHex:
       mov cx, 2
limpiarNroHex:
       mov byte ptr [bx], 30h
       inc bx
       loop limpiarNroHex
       jmp finLimpiar

VarBin:
       mov cx, 8
limpiarNroBin:
       mov byte ptr [bx], 30h
       inc bx
       loop limpiarNroBin
       jmp finLimpiar

VarText:
limpiarTexto:
       cmp byte ptr [bx], 24h
       je finLimpiar
       mov byte ptr [bx], 24h
       inc bx
       jmp limpiarTexto

finLimpiar:
       pop bx 
       pop cx
       ret
limpiarVariables endp

;---------------------------------------------------------
ponerGuiones proc
       ;RECIBE EL OFFSET DE PALABRA DESDE DX
       ;RECIBE EL OFFSET DE VARIABLE DE GUIONES DESDE SI
       push bx

       mov bx, dx ; cargo el offset de la variable en [bx]

contarGui:
       cmp [bx], byte ptr 24h
       je finContarGui
       mov [si], byte ptr '-'
       inc si
       inc bx
jmp contarGui 
finContarGui:

       pop bx
 ret
ponerGuiones endp

;-----------------------------------------------------------

actualiza_guiones proc

      ;push bp
    ;mov bp, sp


    xor cx,cx

    recorre: ;en AL estará el caracter (letra) a buscar

        cmp [si],byte ptr 24h
        je finrecorre
        cmp [si],al
        je remplazo

        inc si ;aca el offset de guiones 
        inc bx ;aca el offset de palabra
    jmp recorre

    remplazo:

        mov [bx],al
        mov cx,1;FLAG como encontro la letra, con cx dsp avisamos en el main que acerto
        inc si
        inc bx
    jmp recorre


    finrecorre:

    ;cmp cx,1



    

    ;pop bp
    ret
actualiza_guiones endp
;-----------------------------------------------------------
mayus_letra proc ;en al viene la letra 

       cmp al,5ah
       jbe esMayusLOL

       ;si es minus, sigue 

       sub al,20h ; minuscula resta y se vuelve mayuscula

       esMayusLOL:

       ret

mayus_letra endp
;-----------------------------------------------------------
mayusculizar proc

       push si
       
       mov si,dx
 

contarLet:
       cmp [si], byte ptr 24h
       je termino
       cmp [si], byte ptr 5ah
       jbe IGNORAR
       cmp [si], byte ptr 7ah
       jbe PONGOMAYUS
       IGNORAR:
       inc si
jmp contarLet

PONGOMAYUS:
       sub [si],byte ptr 20h
       inc si 
jmp contarLet
             
termino:

       pop si
       ret

mayusculizar endp
;-----------------------------------------------------------
esperarTecla proc
    mov ah, 00h  ; Función de DOS para leer una tecla sin esperar
    int 16h      ; Llama a la interrupción de BIOS para leer la tecla
    ret
esperarTecla endp



end