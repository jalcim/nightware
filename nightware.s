[BITS 16]
[ORG 0x0]

_start:
	jmp start
	%include "aff.s"
string:	db "nightware 0.0.0", 13, 10, 10, 0
	
start:
	mov ax, 0x100
	mov ds, ax
	mov es, ax

	mov ax, 0x8000
	mov ss, ax
	mov sp, 0xf000

	mov si, string
	call aff
end:	jmp end