; nasm -felf64 add.asm -o add.o; ld -o add add.o

global _start

section .text
soma:		; int soma(int x, int y) { return x+y; }
	mov rax, [esp+4]
	mov rbx, [esp+8]
	add rax, rbx ; rax = rax + rbx
	ret

_start:
	push 3
	push 4
	call soma