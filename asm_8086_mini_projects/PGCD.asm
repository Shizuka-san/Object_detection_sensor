%include "asm_io.asm"
segment .data
	msg db "Enter a value : ", 0
	msg2 db "The pgcd is : ", 0
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

jge next
	mov edx, eax
	mov eax, ebx
	mov ebx, edx
	xor edx, edx
next:

A:
	cmp ebx, 0
jz pgcd
	div ebx

	mov eax, ebx
	mov ebx, edx
	xor edx, edx
jmp A
pgcd:
	call print_int


mov eax, 1
mov ebx, 0
int 0x80
