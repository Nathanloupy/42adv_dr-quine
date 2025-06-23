extern printf
extern fflush
section .data
	format_str db "extern printf%1$cextern fflush%1$csection .data%1$c%2$cformat_str db %3$c%4$s%3$c,0%1$c%2$cnl db 10%1$c%2$ctab db 9%1$c%2$cquote db 34%1$csection .text%1$c%2$cglobal _start%1$c_start:%1$c%2$cand rsp, -16%1$c%2$cmov rdi, format_str%1$c%2$cmovzx rsi, byte [nl]%1$c%2$cmovzx rdx, byte [tab]%1$c%2$cmovzx rcx, byte [quote]%1$c%2$cmov r8, format_str%1$c%2$cxor rax, rax%1$c%2$ccall printf%1$c%2$cmov rdi, 0%1$c%2$cxor rax, rax%1$c%2$ccall fflush%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 0%1$c%2$csyscall%1$c",0
	nl db 10
	tab db 9
	quote db 34
section .text
	global _start
_start:
	and rsp, -16
	mov rdi, format_str
	movzx rsi, byte [nl]
	movzx rdx, byte [tab]
	movzx rcx, byte [quote]
	mov r8, format_str
	xor rax, rax
	call printf
	mov rdi, 0
	xor rax, rax
	call fflush
	mov rax, 60
	mov rdi, 0
	syscall
