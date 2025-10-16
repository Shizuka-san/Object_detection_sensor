%include "asm_io.asm"
segment .data
	msg db "Enter a value : ", 0
	s dd 0
segment .bss
segment .text
global main
main:

	mov eax, msg
	call print_string
	call read_int
	mov ecx, eax
	dec ecx
	mov eax, 1
	mov ebx, 2

	not_yet:
	inc eax
	push eax
	div ebx
	pop eax
	cmp edx, 0
	jne not_even
	add [s], eax
	dec ecx
	not_even:
	cmp ecx, 0
	jne not_yet

	mov eax, [s]
	call print_int


mov eax, 1
mov ebx, 0
int 0x80
