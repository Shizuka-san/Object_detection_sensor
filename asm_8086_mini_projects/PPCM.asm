%include "asm_io.asm"
segment .data
        msg db "Enter a value : ", 0
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
	push eax
	push ebx

        cmp eax, ebx
        jle swap
        xchg eax, ebx
        swap:

        not_yet:
        xor edx, edx
        div ebx
        mov eax, ebx
        mov ebx, edx
        cmp ebx, 0
        jne not_yet

	mov ecx, eax
	pop ebx
	pop eax
	mul ebx
	div ecx

        call print_int

mov eax, 1
mov ebx, 0
int 0x80
