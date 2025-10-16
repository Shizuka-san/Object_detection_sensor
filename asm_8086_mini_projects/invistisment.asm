%include "asm_io.asm"
segment .data
	msg db "Enter the value : ", 0
	comb db "Enter the years : ", 0
	s dd 0
	y dd 0
segment .bss
segment .text
global main
main:

	mov eax, comb
	call print_string
	call read_int
	mov ecx, eax

	mov eax, msg
	call print_string
	call read_int
	mov ebx, 12
	mul ebx
	mov [y], eax
	div ebx
	xor ebx, ebx

not_yet:
	mov ebx, 6
	mul ebx
	mov ebx, 100
	xor edx, edx
	div ebx
	add [s], eax
	push eax
	mov eax, [s]
	add eax, [y]
	mov [s], eax
	pop eax
	mov eax, [s]
loop not_yet

	mov eax, [s]
	call print_int

mov eax, 1
mov ebx, 0
int 0x80
