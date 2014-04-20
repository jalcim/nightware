%define BASE 0x100
%define NSECT 1			;nombre de secteur a lire

[BITS 16]
[ORG 0x0]

_start:
	jmp start
	%include "aff.s"

string:	db "boot_night 0.0.0", 13, 10, 0

start:	
	mov ax, 0x07c0
	mov ds, ax
	mov es, ax
	mov ax, 0x8000
	mov ss, ax
	mov sp, 0xf000

	mov [bootdrv], dl

launcher:
	mov si, string
	call aff

	xor ax, ax
	int 0x13		;initialisation d'unite (numero ?(DL))

	push es
	mov ax, BASE
	mov es, ax

	mov ah, 2
	mov al, NSECT
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, [bootdrv]
	mov bx, 0
	int 0x13		;lecture d'unite
	pop es

	jmp dword BASE:0

bootdrv: db 0

	times 510-($-$$) db 144
	dw 0xAA55