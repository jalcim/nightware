aff:
	push ax
	push bx
re:	
	lodsb
	cmp al, 0
	jz .fin
	mov ah, 0eh
	mov bx, 0x07
	int 10h
	jmp re
.fin:
	pop ax
	pop bx
	ret