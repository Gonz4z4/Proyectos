.8086
.model small
.stack 100h
.data
   var db 255 dup(24h),0dh,0ah,24h
   voc db "AEIOUaeiou",24h
   cons db "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz",24h

.code

   main proc

   mov ax, @data
   mov ds, ax 

   mov bx, 0
      ;caja carga
   carga:
      mov ah,1
      int 21h
      cmp al, 0dh
      je finCarga
      mov var[bx],al 

      inc bx
   jmp carga
finCarga:

   mov si, 0
   mov bx, 0
   mov cx, 0

proceso:
   cmp var[bx],24h
   je termine

   ;PROCESO COMPARA VOCALES
      xor si,si
   prox:
      cmp voc[si],24h
      je finComparacion
      mov dl,voc[si]
      cmp var[bx],dl
      je cuentaVocal
      inc si
   jmp prox

cuentaVocal:
    inc ch
finComparacion:
   inc bx
   jmp proceso

termine:
   mov bx,0
proceso2:
   cmp var[bx],24h
   je termine2

   ;PROCESO COMPARA VOCALES
      xor si,si
   prox2:
      cmp cons[si],24h
      je finComparacion2
      mov dl,cons[si]
      cmp var[bx],dl
      je cuentaCons
      inc si
   jmp prox2
termine2:
   jmp fin

cuentaCons:
    inc cl

finComparacion2:
   inc bx
   jmp proceso2


fin:
   mov ah, 2
   mov dl, ch ;VOCALES
   add dl, 30h
   int 21h

   mov ah, 2
   mov dl, cl ;CONSONANTES
   add dl, 30h
   int 21h


   mov ax, 4c00h
   int 21h

   main endp
end