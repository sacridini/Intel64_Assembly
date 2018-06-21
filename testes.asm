section .data
correct: dq -1
section .text

global _start
_start:
	; jmp _start  - loop infinito
	mov rax, [0x400000-1] ; ilegal

	mov rax, 60
	xor rdi, rdi
	syscall