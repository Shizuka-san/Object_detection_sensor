%include "asm_io.asm"
segment .data
	msg db "Enter a value : ", 0
	x dd 0
segment .bss
segment .text
global main
main:

	mov eax, msg
	call print_string
	call read_int
	mov ebx, eax

	mov eax, msg
        call print_string
        call read_int

	cmp eax, ebx
	jge good
	xchg eax, ebx
	good:

	sub ebx, 1

	not_yet:
	mov ecx, eax

	prim:

	xor edx, edx
	push eax
	div ecx
	pop eax

	cmp edx, 0
	jne noo
	push eax
	mov eax, [x]
	add eax, 1
	mov [x], eax
	pop eax
	noo:
	loop prim

	push eax
	mov eax, [x]
	cmp eax, 2
	jne no_prim
	pop eax
	call print_int
	call print_nl
	push eax
	no_prim:
	mov eax, 0
	mov [x], eax
	pop eax

	sub eax, 1
	cmp eax, ebx
	jne not_yet

mov eax, 1
mov ebx, 0
int 0x80
