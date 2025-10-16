%include "asm_io.asm"
segment .data
	ask db "Enter an intiger : ", 0
	fac db "The factoriel is : ", 0
segment .bss
segment .text
global main
main:

	mov eax, ask
	call print_string
	call read_int

	cmp eax, 1
je next
	cmp eax, 0
je next

	mov ecx, eax
	sub ecx, 1
A:

	mul ecx

loop A
jmp B
next:
	mov eax, fac
	call print_string
	mov eax, 1
	call print_int
jmp C
B:
	mov ebx, eax
	mov eax, fac
        call print_string
        mov eax, ebx
        call print_int
C:

mov eax, 1
mov ebx, 0
int 0x80
