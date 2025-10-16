%include "asm_io.asm"
segment .data
	msg db "Enter a value : ", 0
	yes db "It is a plandrom number !!", 0
	noo db "It is not a plandrom number !!", 0
	x dd 0
	y dd 0
	z dd 0
segment .bss
segment .text
global main
main:

	mov eax, msg
	call print_string
	call read_int
	mov [z], eax
	mov ecx, 0
	mov ebx, 10

	not_yet:
	xor edx, edx
	div ebx
	push edx
	add ecx, 1
	cmp eax, 0
	jne not_yet

	xor edx, edx

	mov ebx, ecx

	pop eax
	add [y], eax

        mov eax, [x]
        add eax, 1
        mov [x], eax
        xor eax, eax

	a_refair:
	pop eax
	mov ecx, [x]
	push ebx
	mov ebx, 10
	repeat:
	mul ebx
	loop repeat
	pop ebx
	add [y], eax

	push eax
	mov eax, [x]
	add eax, 1
	mov [x], eax
	pop eax

	cmp ebx, [x]
	jne a_refair

	mov eax, [y]
	mov ebx, [z]
	call print_int
	call print_nl
	cmp eax, ebx
	jne not_pland
	mov eax, yes
	call print_string
	jmp end
	not_pland:
	mov eax, noo
	call print_string
	end:





mov eax, 1
mov ebx, 0
int 0x80
