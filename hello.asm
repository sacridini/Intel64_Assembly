global _start

section .data
message: db 'Hello, World!', 10

section .text
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 14
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
	
; nasm -felf64 hello.asm -o hello.o
; ld -o hello hello.o
