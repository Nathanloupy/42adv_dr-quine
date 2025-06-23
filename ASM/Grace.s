extern dprintf
extern fflush
; cmt1
section .data
	file_str db "Grace_kid.s",0
	format_str db "extern dprintf%1$cextern fflush%1$c%4$c cmt1%1$csection .data%1$c%2$cfile_str db %3$cGrace_kid.s%3$c,0%1$c%2$cformat_str db %3$c%5$s%3$c,0%1$c%2$cnl db 10%1$c%2$ctab db 9%1$c%2$cquote db 34%1$c%2$csc db 59%1$csection .text%1$c%2$cglobal _start%1$cexit_func:%1$c%2$cmov rax, 60%1$c%2$csyscall%1$c_start:%1$c%2$cand rsp, -16%1$c%2$c%4$c cmt2%1$c%2$cmov rax, 2%1$c%2$cmov rdi, file_str%1$c%2$cmov rsi, 577%1$c%2$cmov rdx, 420%1$c%2$csyscall%1$c%2$ccmp rax, -1%1$c%2$cje error_exit%1$c%2$cmov r10, rax%1$c%2$cmov rdi, r10%1$c%2$cmov rsi, format_str%1$c%2$cmovzx rdx, byte [nl]%1$c%2$cmovzx rcx, byte [tab]%1$c%2$cmovzx r8, byte [quote]%1$c%2$cmovzx r9, byte [sc]%1$c%2$csub rsp, 8%1$c%2$cpush format_str%1$c%2$cmov rax, 0%1$c%2$ccall dprintf%1$c%2$cadd rsp, 16%1$c%2$cmov rdi, 0%1$c%2$cxor rax, rax%1$c%2$ccall fflush%1$c%2$cmov rax, 3%1$c%2$cmov rdi, r10%1$c%2$csyscall%1$c%2$cmov rdi, 0%1$c%2$ccall exit_func%1$cerror_exit:%1$c%2$cmov rdi, 1%1$c%2$ccall exit_func%1$c",0
	nl db 10
	tab db 9
	quote db 34
	sc db 59
section .text
	global _start
exit_func:
	mov rax, 60
	syscall
_start:
	and rsp, -16
	; cmt2
	mov rax, 2
	mov rdi, file_str
	mov rsi, 577
	mov rdx, 420
	syscall
	cmp rax, -1
	je error_exit
	mov r10, rax
	mov rdi, r10
	mov rsi, format_str
	movzx rdx, byte [nl]
	movzx rcx, byte [tab]
	movzx r8, byte [quote]
	movzx r9, byte [sc]
	sub rsp, 8
	push format_str
	mov rax, 0
	call dprintf
	add rsp, 16
	mov rdi, 0
	xor rax, rax
	call fflush
	mov rax, 3
	mov rdi, r10
	syscall
	mov rdi, 0
	call exit_func
error_exit:
	mov rdi, 1
	call exit_func
