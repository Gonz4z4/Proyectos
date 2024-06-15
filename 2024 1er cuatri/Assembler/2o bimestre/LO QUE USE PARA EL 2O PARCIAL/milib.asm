.8086
.model small
.stack 100h
.data
	auxiliares db 100, 10, 1 ;utilizados para r2a-a2r
	textoInv db "el caracter ingresado es invalido" , 0dh, 0ah, 24h
.code

;Libreria de Fernandez Tadeo
;Libreria creada por Fernandez Tadeo
;Trabajo de creacion, recopilacion y correcciones por Fernandez Tadeo
;Analisis por Fernandez Tadeo
;Comentarios por Fernandez Tadeo
;Lagrimas por Fernandez Tadeo


;Funciones disponibles:
public carga
public imprimir
public r2a
public a2r
public contarCaracteres
public contarCaracter
public contarNumeros
public limpiarVariables
public cambioChar
public cifrar
public cargaNumeros
public buscarYContar
public buscarPosicion

;Funciones prestadas y no comentadas por mí:
public dec2Bin
public dec2Hex
public binAscii2Dec
public hex2Dec


;========================================================================================================================
carga proc
;FUNCION (por registros):
;el usuario ingresa caracteres a una variable (texto)
;REQUISITOS:
;caracter para dejar de cargar en al
;offset (direccion) de la variable en dx (usar lea)

;guardamos los valores de los registros que utilizaremos
	push bx
	push dx
	push ax

;movemos la direccion a bx
	mov bx, dx 
;movemos el caracter para finalizar a dl (ya que al se pisara por la interrupcion)
	mov dl, al
;limpiamos dh para no tener bolonqui (ya que solo usaremos dl)
	xor dh, dh

;empieza la carga
	caja:
		mov ah, 1 ;interrupcion para pedir un caracter
		int 21h
		cmp al, dl ;comparamos el ingresado con el que termina
		je finCaja ;de ser iguales, termina
		mov [bx], al ;de no serlo, lo ingresamos al caracter actual de la variable
		inc bx ;incrementamos el indice de la variable
		jmp caja ;repetimos

	finCaja:
;cargamos los registros con los valores que tenian previos a la funcion
		pop ax
		pop dx
		pop bx

ret ;retornamos (osea, sp a ip)
carga endp ;terminamos
;========================================================================================================================

;========================================================================================================================
imprimir proc
;FUNCION (por stack):
;imprime una variable (texto)
;REQUISITOS:
;offset (direccion) de la variable en bx (lea)
;pushear bx (el offset) antes del call


;trabajo del base pointer 
	push bp
	mov bp, sp
;guardamos los valores de los registros que utilizaremos
	push dx
	push ax

;usando el base pointer movemos el offset del stack segment a dx para la interrupcion
	mov dx, ss:[bp+4]

;imprimimos el texto (bx)
	mov ah, 9
	int 21h

;cargamos los valores guardados a los registros utilizados
	pop ax
	pop dx

;limpiamos ss y finalizamos
pop bp
ret 2
imprimir endp
;========================================================================================================================

;========================================================================================================================
r2a proc
;FUNCION (registros):
;convierte un numero decimal en un numero en caracteres ascii (en una variable previamanete creada)
;REQUISITOS:
;direccion del numero ascii "000" en bx (lea)
;el numero que vamos a dividir/convertir debe ser pasado por dl

;guardamos los valores de los registros que utilizaremos
	push ax
	push dx
	push cx
	push si
	push bx

;limpiamos ax y si 
	mov si, 0
	mov ax, 0

;movemos el numero regular a al para la division 
	mov al, dl

;contador para loop (3 por la cantidad)
	mov cx, 3
	proceso:
		mov dl, auxiliares[si] ;movemos a dl el divisor que utilizaremos 
		div dl ;dividimos al / dl
		add [bx],al ;añadimos el resultado (sin resto) a [bx] (direccion del numero en formato ascii (defecto: "000")
		xchg al, ah  ;INTERCAMBIA VALORES (ponemos el resto, osea, el siguiente numero a dividir, en al)
		xor ah, ah  ; limpiamos ah 
		inc bx  ;siguiente decimal
		inc si ;siguiente divisor
	loop proceso
	
;cargamos los valores guardados a los registros utilizados
	pop bx
	pop si
	pop cx
	pop dx
	pop ax

;retorna y termina la funcion
ret
r2a endp
;========================================================================================================================

;========================================================================================================================
a2r proc 
;FUNCION (registros):
;toma un numero en ascii ej: "124" y retorna un numero decimal en dl
;REQUISITOS:
;direccion (offset) del numero en ascii en bx (lea)
;importante!! te da el resultado en dl, nosotros tenemos luego que moverlo a su etiqueta


;guardamos los valores de los registros que utilizaremos, menos dx ya que el resultado se devuelve en dl
	push cx
	push ax
	push si

	;limpiamos dx y ax
	mov dx,0
	mov ax, 0
	
	mov cx, 3
	proces:
		mov al, [bx] ;pasamos la posicion del digito actual a al
		sub al, 30h ;restamos 30h para convertirlo en un digito
		mov dl, auxiliares[si] ;pasamos el auxiliar para multiplicar a dl (100 al principio)
		mul dl	;multiplicamos (siempre al * dl)
		add dh, al ;añadimos el resultado a dh (lo utilizamos momentaneamente ya que no podemos acceder a al numero regular)
		xor ax, ax ;limpio ax
		inc bx ; siguiente numero (menos significativo)
		inc si ; siguente multiplicador (menos significativo)
	loop proces

	;muevo dh (numero final) a dl (valor de retorno) 
	mov dl, dh
	mov dh, 0 ;limpio dh

;cargamos los valores guardados a los registros utilizados, menos dl porque ahi se guarda
	pop si
	pop ax
	pop cx
;retorna el valor modificado (dl) y termina la funcion
ret
a2r endp
;========================================================================================================================

;========================================================================================================================
contarCaracteres proc
;FUNCION (registros):
;recibe un texto (en modo offset) y devuelve el largo (cantidad de caracteres) en dl
;REQUISITOS:
;direccion de la variable (texto) desde dx (lea)
	
;guardamos los valores de los registros que utilizaremos, menos dx ya que el resultado se devuelve en dl
	push bx	

;cargo la direccion (offset) de la variable (texto) en bx 
	mov bx, dx
;limpio dx para guardar el resultado en dl
	xor dx, dx

	contar:
		cmp [bx], byte ptr 24h ;comparo el caracter actual con 24h (hay que indicar que el bx es de un caracter y no un word (8 bits no 16))
		je finContar ;de ser 24h indica que termino el texto
		inc dl ;incremento dl para indicar que se contó un caracter
		inc bx ;siguiente caracter
		jmp contar ;repetimos

	finContar:
	;listo

;cargamos los valores guardados a los registros utilizados, menos dl porque ahi se guarda
		pop bx

ret
contarCaracteres endp
;========================================================================================================================

;========================================================================================================================
contarCaracter proc
;FUNCION (registros):
;recibe la direccion de una variable por dx y un caracter para contar en al, devuelve la cantidad de veces que aparece por dl
;REQUISITOS:
;direccion de una variable (texto) por bx (lea)
;caracter para buscar y contar en al


;guardamos los valores de los registros que utilizaremos
	push bx
	push ax

;muevo la direccion (offset) de la variable (texto) a bx, ya que usaremos dx
	mov bx, dx
;limpiamos dx ya que lo utilizaremos para contar y será el retorno 
	xor dx, dx
	xor ah, ah ;limpiamos ah por si las dudas

	recorrer:
		cmp [bx], byte ptr 24h ;comparo el caracter con 24h (hay que especificar que no es word)
		je finRecorrer ;de ser 24h, termina el texto y salimos
		cmp [bx], al ;compara el caracter actual con el caracter que buscamos contar
		je cont ;de serlo, vamos a contar
		inc bx ;de no serlo, siguiente caracter
		jmp recorrer ;repetimos

	cont:
		inc dl ;aumentamos el contador de ese caracter
		inc bx ;siguiente caracter
		jmp recorrer ;volvemos a recorrer

	finRecorrer:
	;listo 

;cargamos los valores guardados a los registros utilizados
	pop ax
	pop bx

ret
contarCaracter endp
;========================================================================================================================

;========================================================================================================================
contarNumeros proc
;FUNCION (registro):
;recibe la direccion de una variable y devuelve la cantidad de numeros que contiene
;REQUISITOS:
;direccion de una variable por dx (lea)

;guardamos los valores de los registros que utilizaremos
	push bx

;movemos la direccion de la variable a bx
	mov bx, dx
;limpiamos dx ya que usaremos dl para contar
	xor dx, dx

	contarNum:
		cmp [bx], byte ptr 24h ;comparo el caracter con 24h (hay que especificar que no es word)
		je finContar ;terminamos
		cmp [bx], byte ptr 30h ;comparo el caracter con 30h '0' (hay que especificar que no es word)
		jae casiNum ;si es igual o mayor, siguiente etapa
		inc bx ;sino, siguiente caracter
		jmp contarNum ;repite

	casiNum:
		cmp [bx], byte ptr 39h ;comparo el caracter con 39h '9' (hay que especificar que no es word)
		jbe esNum ;de serlo, vamos a que es numero (porque esta entre 30h y 39h)
		inc bx ;sino, siguiente caracter
		jmp contarNum ;volvemos a contar

	esNum:
		inc dl ;incrementamos el contador de numeros (hasta 9)
		inc bx ;siguiente caracter
		jmp contarNum ;volvemos a contar

	finCont:
	;listo

;cargamos los valores guardados a los registros utilizados, menos dl porque retorna
	pop bx

ret
contarNumeros endp
;========================================================================================================================

;========================================================================================================================
limpiarVariables proc
;FUNCION:
;recibe la direccion de una variable de algún tipo y la limpia
;REQUISITOS:
;direccion (offset) de la viariable por bx (lea)
;el numero de opcion dependiendo de la variable en cl


;guardamos los valores de los registros que utilizaremos
	push cx
	push bx

;comparamos los valores de cl para saber el tipo de dato
	cmp cl, 1
	je varAscii
	cmp cl, 2
	je varHex
	cmp cl, 3
	je varBin
	cmp cl, 4
	je varText

;de ser ascii, debe repetirse 3 veces 
	varAscii:
		mov cx, 3
	limpiarAscii:
		mov [bx], byte ptr 30h ;ingresamos un "0" en el caracter actual
		inc bx ;siguiente caracter
	loop limpiarAscii ;repetimos cx veces
	jmp finLimpiar ;terminamos

;de ser hexa, debe repetirse 2 veces
	varHex:
		mov cx, 2
	limpiarHex:
       mov [bx], byte ptr 30h ;ingresamos un "0" en el caracter actual
       inc bx ;siguiente caracter
 	loop limpiarHex ;repetimos
	jmp finLimpiar ;terminamos

;de ser binario, debe repetirse 8 veces
	varBin:
       mov cx, 8
 	limpiarBin:
       mov [bx], byte ptr 30h ;ingresamos un "0" en el caracter actual
       inc bx ;siguiente caracter
 	loop limpiarBin ;repetimos
	jmp finLimpiar ;terminamos

	;al no tener un largo definido, no hay loop
	varText:
	limpiarTexto:
       cmp [bx], byte ptr 24h ;comparamos el caracter actual con "$" para saber que esta terminado
       jmp finLimpiar ;terminamos
       mov [bx], byte ptr 24h ;movemos "$" al caracter actual
       inc bx ;siguiente caracter
       jmp limpiarTexto ;repetimos

	finLimpiar:
    ;listo

;cargamos los valores guardados a los registros utilizados
    pop bx 
    pop cx
      
ret
limpiarVariables endp
;========================================================================================================================

;========================================================================================================================
cambioChar proc
;FUNCION:
;recibe un texto y un texto recipiente para modificar el texto anterior, por el cual se buscara un caracter dentro del texto y se cambiara por otro
;REQUERIMIENTOS:
;direccion de un texto para analizar por dx (lea)
;direccion del texto recipiente para modificar por si (lea)
;caracter para buscar dentro del texto por ah
;caracter para reemplazar en el nuevo texto por al

;guardamos los valores de los registros que utilizaremos
    push bx
    push si
    push dx
    push ax

;reseteamos los valores de bx y di por las dudas
    mov bx,0
    mov di,0

;movemos la direccion del texto de dx a bx
    mov bx, dx

    procs:
       cmp [bx],byte ptr 24h ;comparo el caracter actual con 24h
       je fin ;de ser iguales, el texto se termino
       cmp [bx], ah ;sino, comparo el caracter actual con el que quiero buscar
       je cambio ;de ser iguales, vamos a cambiarlo
       mov dl,[bx] ;de no serlo, vamos a mover el caracter a dl (para no hacer memoria - memoria)
       mov [si],dl ; y guardo ese caracter en el texto modificado
       inc bx ;siguiente caracter texto
       inc si ;siguiente caracter texto modificado
       jmp procs ;repetimos

    cambio:
       mov [si], al ;ingresamos el caracter por el cual queremos reemplazar a ese espacio
       inc bx ;siguiente caracter texto
       inc si ;siguiente caracter texto modificado
       jmp procs ;volvemos a analizar

	fin:
    ;listo

;cargamos los valores guardados a los registros utilizados
    pop ax
    pop dx
    pop si
    pop bx

ret
cambioChar endp
;========================================================================================================================

;========================================================================================================================
 cifrar proc
 ;FUNCION:
 ;recibe un texto y un numero para sumar y devuelve un texto con las letras cambiadas
 ;REQUISITOS:
 ;direccion de un texto para analizar por bx (lea)
 ;direccion de un texto para reemplazarlo por dx (lea)
 ;numero para sumarle a las letras por al

;guardamos los valores de los registros que utilizaremos
	push bx
    push si 
    push dx

 
    mov si, dx
    xor dx,dx

    recorr:
    	cmp [bx], byte ptr 24h ;comparamos el caracter actual con 24h
        je casiFinRecorr ;si es igual, terminamos
        cmp [bx], byte ptr 41h ;comparamos el caracter actual con A
        jae casi1 ;si es mayor o igual, siguiente fase
        jmp noFue ;de no serlo, nos vamos tristes

    noFue:
    	mov dl, [bx] ;movemos el caracter actual a dl (no memoria-memoria)
    	mov [si], dl ;insertamos el caracter en el texto modificado
    	inc bx ;siguiente caracter texto
    	inc si ;siguiente caracter texto modificado
    	jmp recorr ;volvemos a recorrer

    casi1:
        cmp [bx], byte ptr 7ah ;comparamos el caracter con z
        jbe casi2 ;si es menor o igual, siguiente fase
        jmp noFue ;de no serlo, nos vamos tristes

    casiFinRecorr:
    jmp finRecorr

    casi2:
        cmp [bx], byte ptr 5ah ;comparamos el caracter con Z
        jbe cifrado ;de ser menor o igual, a cambiar
        cmp [bx], byte ptr 61h ;comparamos el caracter con a
        jae cifrado ;de ser mayor o igual, a cambiar
		jmp noFue ;de no serlo, nos vamos tristes

    cifrado:
    	mov dl, [bx] ;movemos el caracter a dl 
    	add dl, al ;sumamos a dl para cambiar el caracter
    	mov [si], dl ;insertamos el nuevo caracter en el texto modificado
    	inc bx ;siguiente caracter
    	inc si ;siguiente caracter texto modificado
    	jmp recorr ;volvemos a recorrer

    finRecorr:
    ;listo

;cargamos los valores guardados a los registros utilizados
    pop dx
    pop si
    pop bx

ret
cifrar endp
;========================================================================================================================

;=======================================================================================================================
cargaNumeros proc 
;FUNCION:
;recibe una variable tipo "000" a la cual se le ingresaran caracteres numericos
;REQUISITOS:
;direccion de la variable "000" pasado por bx (lea)

;guardamos los valores de los registros que utilizaremos
	push dx
	push bx
	push ax

	cargaNum:
		mov ah,8 ;pedimos un caracter (sin mostrar)
		int 21h
		cmp al,0dh ;comparo con retorno de carro (enter)
		je FinCargaNum ;de ser iguales, terminamos
		cmp al, 30h ;de no serlo, comparamos con '0'
		jae seraNum ;si es mayor o igual, siguiente proceso
		jmp inv ;si no lo es, error
	
	seraNum:
		cmp al, 39h ;comparo con '9'
		jbe esN ;de ser menor, es numero
		jmp inv ;de no serlo, error

	esN:
		mov [bx], al ;movemos el caracter al recipiente bx
		inc bx ;siguiente caracter
		jmp cargaNum ;repetimos proceso

	inv:
	;cargamos y disparamos un mensaje de error
		mov ah, 9
		mov dx, offset textoInv
		int 21h
		jmp cargaNum ;volvemos a cargar

	FinCargaNum:
	;listo

;cargamos los valores guardados a los registros utilizados
	pop ax
	pop bx
	pop dx

ret 
cargaNumeros endp
;=========================================================================================================================

;=========================================================================================================================
buscarYContar proc
;FUNCION:
;recorre un texto y cuenta la cantidad de caracteres, devueltos por ch, y la cantidad de un caracter especifico, devuelta por cl
;REQUISITOS:
;direccion de una variable (texto) por bx (lea)
;caracter para contar por dl 


;guardamos los valores de los registros que utilizaremos
    push bx
    push dx

;reseteamos los contadores
    mov cx, 0 
    mov dh,0 ;y este por las dudas

    dale:
	    cmp [bx], byte ptr 24h ;comparo el caracter actual con 24h
	    je finalBusqueda ;de ser igual, se trmina
	    cmp [bx], byte ptr dl ;comparo el caracter actual con el que busco
	    je cuento ;de ser iguales, vamos a contar
	    inc bx; de no serlo, siguiente caracter
	    inc ch; +1 caracter en la cuenta
	    jmp dale ;repito

    cuento:
	    inc bx ;siguiente caracter
	    inc ch ;+1 caracter en la cuenta
	    inc cl ;+1 caracter especifico
	    jmp dale ;repito

    finalBusqueda:
    ;listo 

;cargamos los valores guardados a los registros utilizados (menos cx ya que usamos cl y ch para contar)
    pop dx
	pop bx

ret
buscarYContar endp
;=========================================================================================================================

;=========================================================================================================================
buscarPosicion proc 
;FUNCION:
;revisa un texto hasta encontrar un caracter especifico, devuelve su indice por al
;REQUISITOS:
;direccion del texto pasada por bx (lea)
;caracter para buscar por dl

;guardamos los valores de los registros que utilizaremos
	push bx
 	push dx

;limpiamos por las dudas
	mov ax,0
	mov dh,0

	cicloBusqueda:
		cmp [bx], byte ptr 24h ;comparamos el caracter actual con 24h
		je finall ;de ser iguales, terminamos

		cmp [bx], dl ;sino, comparamos el caracter actual con el que buscamos
		je finall ;de ser iguales, terminamos

		inc bx ;de no serlo, siguiente caracter
		inc al ;+1 al indice
		jmp cicloBusqueda ;repetimos

	finall:
	;Listo

;cargamos los valores guardados a los registros utilizados
	pop dx
	pop bx

ret 
buscarPosicion endp
;=========================================================================================================================

;=========================================================================================================================
dec2Bin proc
		; Convierte un número decimal en su representación binaria
		; Entrada: 
		;   AL = valor decimal (8 bits)
		;   DI = puntero al buffer para la cadena binaria tipo *binaryString db 9 dup ('$')*
		; Salida:
		;   El buffer apuntado por DI contiene la representación binaria como una cadena terminada en '$'
	push ax
	push cx
	push dx

	mov cx, 8; Contador de bits (8 bits para un número de 8 bits)
	    ;lea di, binaryString + 7 ; Apuntar al final de la cadena
	add di,7
	ConvierteBit8:
	    dec di
	    mov dl, al
	    and dl, 1   ; Obtener el bit menos significativo
	    add dl, '0' ; Convertir bit a carácter ("0" o "1")
	    mov [di], dl
	    shr al, 1   ; Desplazar a la derecha para obtener el siguiente bit
	loop ConvierteBit8

	    ; Añadir el terminador de cadena '$'
	mov byte ptr [di + 8], '$'

	pop dx
	pop cx
	pop ax
ret
dec2Bin endp
;=========================================================================================================================

;=========================================================================================================================
	convertir_a_caracter_hex proc
		; Procedimiento auxiliar para convertir un número (0-15) en su carácter hexadecimal ASCII
		; Entradas:
		;   - AL contiene el número (0-15)
		; Salidas:
		;   - AL contiene el carácter ASCII correspondiente

	    ; si el valor es menor a 10
	    cmp al, 9
	    jbe es_numero

	    ; Si es mayor a 9, sumamos 7 adicional a 0x30 para convertirlo en 'A'-'F'
	    add al, 7

	es_numero:
	    ; el número en su carácter ASCII
	    add al, '0'
	    ret
	convertir_a_caracter_hex endp
;=========================================================================================================================

;=========================================================================================================================
dec2Hex proc
		; Procedimiento para convertir un decimal a hexadecimal y almacenarlo en una cadena
		; Entradas: 
		; 	AL --contiene el número decimal (0-255), tipo *hexadecimal db 2 dup (0),24h*
		; Salidas:
		;   BX --apunta a la cadena de dos caracteres con el valor hexadecimal en ASCII
	push ax
	push bx
	push cx
	push dx

	    ; Almacenamos el número original en DL
	mov dl, al

	    ; Preparamos la cadena de salida
	    ;lea bx, hexadecimal
	    ;mov byte ptr [bx], 0
	    ;mov byte ptr [bx+1], 0

	    ; Calculamos el primer dígito hexadecimal (más significativo)
	mov al, dl
	shr al, 4               ; Desplazamos 4 bits a la derecha para obtener los 4 bits más significativos
	call convertir_a_caracter_hex

	    ; Almacenamos el primer carácter en la cadena
	mov [bx], al

	    ; Calculamos el segundo dígito hexadecimal (menos significativo)
	mov al, dl
	and al, 0Fh             ; Limpiamos los 4 bits más significativos para obtener solo los 4 bits menos significativos
	call convertir_a_caracter_hex

	    ; Almacenamos el segundo carácter en la cadena
	mov [bx+1], al

	pop dx
	pop cx
	pop bx
	pop ax
	ret
dec2Hex endp
;=========================================================================================================================

;=========================================================================================================================
binAscii2Dec proc
        ; Entrada:
        ;   BX apunta a la cadena binaria en formato ASCII tipo binario db "10101011",24h
        ; Salida:
        ;   al contiene el valor decimal convertido, decimal puro (el operable) no decimal imprimible
    push cx
    push bx

    xor ax, ax          ; Limpiar AX para almacenar el resultado
    xor cx, cx          ; Limpiar CX para contador

	    ; Recorrer la cadena binaria
	convertir_loop:
	    mov cl, [bx]        ; Cargar el carácter binario actual en CL
	    cmp cl, '0'         ; Comparar si es "0"
	    jne es_uno          ; Si no es '0', continuar
	    shl ax, 1           ; Multiplicar por 2 (desplazar a la izquierda)
	    jmp siguiente       ; Saltar al final del bucle

	es_uno:
	    shl ax, 1           ; Multiplicar por 2 (desplazar a la izquierda)
	    or ax, 1            ; Establecer el bit menos significativo a 1

	siguiente:
	    inc bx              ; Avanzar al siguiente carácter
	    cmp byte ptr [bx],24h; Verificar si llegamos al final de la cadena
	    jne convertir_loop  ; Si no, continuar convirtiendo

    pop bx
    pop cx

ret                 ; Retornar con el valor decimal en AX 8al en realidad9
binAscii2Dec endp
;=========================================================================================================================

;=========================================================================================================================
 hex2Dec proc
    	; Entrada:
        ;   si apunta a la cadena hexadecimal en formato ASCII tipo hexadecimalAcci db '2F'
        ; Salida:
        ;   bl contiene el valor decimal convertido, decimal puro (el operable) no decimal imprimible

    push ax
    push cx
    push si
	xor cx, cx            ; Inicializar contador a cero
	xor bx, bx            ; Inicializar acumulador a cero

	convert_loop:
	mov al, [si]          ; Cargar el byte de la cadena en AL
	cmp al, 0             ; Verificar si es el final de la cadena
	je done               ; Si es el final, salir del bucle

	; Convertir ASCII a valor hexadecimal
	cmp al, '0'
	jl done               ; Salir si el caracter no es un dígito ASCII
	sub al, '0'           ; Convertir ASCII a valor decimal
	cmp al, 9
	jle digit
	sub al, 7

	digit:
	shl bx, 4             ; Hacer espacio para el próximo dígito hexadecimal
	add bx, ax            ; Agregar el nuevo dígito hexadecimal

	; Mover al siguiente carácter de la cadena
	inc si                ; Incrementar el puntero de la cadena
	jmp convert_loop      ; Volver a convertir el siguiente dígito

	done:
	    ; Retornar con el valor decimal en BX

	pop si
	pop cx
	pop ax
ret
hex2Dec endp
;=========================================================================================================================

end