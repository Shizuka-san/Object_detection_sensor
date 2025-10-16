%include "asm_io.asm"
segment .data
	msg db "Enter a value : ", 0
	bit1 db "1", 0
	bit0 db "0", 0
segment .bss
segment .text
global main
main:

	mov eax, msg
	call print_string
	call read_int

	mov ecx, 32

	not_yet:

	shl eax, 1

	jc cary
	push eax
	mov eax, bit0
	call print_string
	pop eax
	jmp no_cary
	cary:
	push eax
	mov eax, bit1
	call print_string
	pop eax
	no_cary:

	loop not_yet

mov eax, 1
mov ebx, 0
int 0x80
