%include "asm_io.asm"
segment .data
	msg db "Enter n >= 2 : ", 0
segment .bss
segment .text
global main
main:

	mov eax, msg
	call print_string
	call read_int
	mov ecx, eax
	sub ecx, 2

	mov eax, 0
	call print_int
	call print_nl
	mov ebx, 0
	mov eax, 1
	call print_int
        call print_nl

	fibonacci:
	mov edx, eax
	add eax, ebx
	call print_int
	call print_nl
	mov ebx, edx
	loop fibonacci

mov eax, 1
mov ebx, 0
int 0x80
