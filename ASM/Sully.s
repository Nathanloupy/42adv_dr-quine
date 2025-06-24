extern dprintf
extern fflush
section .data
	filename db "Sully_X.s",0
	format_str db "extern dprintf%1$cextern fflush%1$csection .data%1$c%2$cfilename db %3$cSully_X.s%3$c,0%1$c%2$cformat_str db %3$c%4$s%3$c,0%1$c%2$cinitial_value dd %5$d%1$c%2$cnl db 10%1$c%2$ctab db 9%1$c%2$cquote db 34%1$csection .text%1$c%2$cglobal _start%1$c_start:%1$c%2$cand rsp, -16%1$c%2$cmov r12d, dword [initial_value]%1$c_loop:%1$c%2$ccmp r12, 0%1$c%2$cjl _exit%1$c%2$ccmp r12, 9%1$c%2$cjg _error_exit%1$c%2$cmov byte [filename+6], r12b%1$c%2$cadd byte [filename+6], '0'%1$c%2$cmov rax, 2%1$c%2$cmov rdi, filename%1$c%2$cmov rsi, 577%1$c%2$cmov rdx, 420%1$c%2$csyscall%1$c%2$ccmp rax, 0%1$c%2$cjl _error_exit%1$c%2$cmov rbx, rax%1$c%2$cmov rdi, rbx%1$c%2$cmov rsi, format_str%1$c%2$cmovzx rdx, byte [nl]%1$c%2$cmovzx rcx, byte [tab]%1$c%2$cmovzx r8, byte [quote]%1$c%2$cmov r9, format_str%1$c%2$csub rsp, 8%1$c%2$cpush r12%1$c%2$cmov rax, 0%1$c%2$ccall dprintf%1$c%2$cadd rsp, 16%1$c%2$cmov rdi, 0%1$c%2$cxor rax, rax%1$c%2$ccall fflush%1$c%2$cmov rax, 3%1$c%2$cmov rdi, rbx%1$c%2$csyscall%1$c%2$cdec r12%1$c%2$cjmp _loop%1$c_exit:%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 0%1$c%2$csyscall%1$c_error_exit:%1$c%2$cmov rax, 60%1$c%2$cmov rdi, 1%1$c%2$csyscall%1$c",0
	initial_value dd 5
	nl db 10
	tab db 9
	quote db 34
section .text
	global _start
_start:
	and rsp, -16
	mov r12d, dword [initial_value]
_loop:
	cmp r12, 0
	jl _exit
	cmp r12, 9
	jg _error_exit
	mov byte [filename+6], r12b
	add byte [filename+6], '0'
	mov rax, 2
	mov rdi, filename
	mov rsi, 577
	mov rdx, 420
	syscall
	cmp rax, 0
	jl _error_exit
	mov rbx, rax
	mov rdi, rbx
	mov rsi, format_str
	movzx rdx, byte [nl]
	movzx rcx, byte [tab]
	movzx r8, byte [quote]
	mov r9, format_str
	sub rsp, 8
	push r12
	mov rax, 0
	call dprintf
	add rsp, 16
	mov rdi, 0
	xor rax, rax
	call fflush
	mov rax, 3
	mov rdi, rbx
	syscall
	dec r12
	jmp _loop
_exit:
	mov rax, 60
	mov rdi, 0
	syscall
_error_exit:
	mov rax, 60
	mov rdi, 1
	syscall
