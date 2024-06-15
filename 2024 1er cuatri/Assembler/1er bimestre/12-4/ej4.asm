.8086
.model small
.stack 100h
.data

	data db "12345",0dh,0ah,24h


.code
	main proc
	mov ax, @data
	mov ds, ax

	mov bx,4
	mov cx,5
print:
	mov ah, 2
	mov dl, data[bx]
	int 21h
	dec bx
loop print

	mov ax, 4c00h
	int 21h
	main endp
end