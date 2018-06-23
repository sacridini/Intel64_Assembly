global _start

section .data
msg: db 'Eduardo Ribeiro Lacerda', 0x0a
tam: equ $-msg		; calcula o tamanho da string

section .text
_start:
	; Função do sistema para escrever algo na tela
	; ssize_t write(int fd, const void *buf, size_t count)
	mov rax, 4		; write
	mov rbx, 1		; fd
	mov rcx, msg	; *buf
	mov rdx, tam	; count 
	int 0x80

	; void _exit(int status)
	mov rax, 1		; _exit
	mov rbx, 0 		; status
	int 0x80

;	mov rax, 60
;	xor rdi, rdi
;	syscall