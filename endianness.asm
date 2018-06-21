section .data

newline_char: db 10
demo1: db '0123456789abcdef'
demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88


section .text
global _start

print_newline:
	mov rax, 1 				; identificador da syscall 'write'
	mov rdi, 1 				; descritor do arquivo stdout
	mov rsi, newline_char 	; local de onde os dados sao obtidos
	mov rdx, 1 				; a quantiade de bytes a ser escrita
	syscall
	ret

print_hex:
	mov rax, rdi

	mov rdi, 1
	mov rdx, 1
	mov rcx, 64 

iterate:
	push rax 				; Salva o valor inicial de rax
	sub rcx, 4
	sar rax, cl 			; desloca para 60, 56, 52, ... , 4, 0
							; o registrador cl e a menor parte de rcx'

	and rax, 0xf 			; limpa todos os bits, exceto os quatro menos significativos
	lea rsi, [demo1 + rax] 	; obtem o codigo de caractere de um digito hexadecimal

	mov rax, 1

	push rcx
	syscall

	pop rcx
	pop rax
	
	test rcx, rcx 			; rcx = 0 quanto todos os digitos forem mostrados
	jnz iterate

	ret

_start:
	mov rdi, [demo1]
	call print_hex
	call print_newline

	mov rdi, [demo2]
	call print_hex
	call print_newline

	mov rax, 60
	xor rdi, rdi
	syscall



; nasm -felf64 endianness.asm -o endianness.o
; ld -o endianness endianness.o 




