extern sprintf
extern dprintf
extern strcmp
extern system
section .data
	format_str db "extern sprintf%1$cextern dprintf%1$cextern strcmp%1$cextern system%1$csection .data%1$c%2$cformat_str db %3$c%4$s%3$c,0%1$c%2$cformat_compile db %3$cnasm -f elf64 -g %%1$s.s -o %%1$s.o%3$c, 0%1$c%2$cformat_link db %3$cld -o %%1$s %%1$s.o%3$c, 0%1$c%2$ctest_ls db %3$cls -l%3$c, 0%1$c%2$cvalue dd %5$d%1$c%2$cfname db %3$cSully_X.s%3$c,0%1$c%2$cthis_file db __FILE__,0%1$c%2$cformat_fname db %3$cSully_%%d.s%3$c,0%1$c%2$cexename db %3$cSully_X%3$c,0%1$c%2$ccompile_cmd times 200 db 0%1$c%2$crun_cmd times 200 db 0%1$c%2$ccurrent_file times 200 db 0%1$c%2$cnl db 10%1$c%2$ctab db 9%1$c%2$cquote db 34%1$csection .text%1$c%2$cglobal _start%1$c_start:%1$c%2$cmovzx r12, byte [value]%1$c%2$ccmp r12, 0%1$c%2$cjl _error_exit%1$c%2$ccall _check_for_decrement%1$c%2$cmov [fname+6], r12b%1$c%2$cadd [fname+6], dword '0'%1$c%2$cmov [exename+6], r12b%1$c%2$cadd [exename+6], dword '0'%1$c%2$ccall _create_file%1$c%2$ccall _write_to_file%1$c%2$ccall _close_file%1$c%2$ccall _compile_file%1$c%2$ccall _clean_exit%1$c_compile_file:%1$c%2$cmov rdi, compile_cmd%1$c%2$cmov rsi, format_compile%1$c%2$cmov rdx, exename%1$c%2$cxor rax, rax%1$c%2$csub rsp, 8%1$c%2$ccall sprintf%1$c%2$cadd rsp, 8%1$c%2$cmov rdi, test_ls%1$c%2$ccall system%1$c%2$ccmp rax, 0%1$c%2$cjne _error_exit%1$c%2$cret%1$c_close_file:%1$c%2$cmov rax, 3%1$c%2$cmov rdi, rbx%1$c%2$csyscall%1$c%2$cret%1$c_write_to_file:%1$c%2$cmov rdi, rbx%1$c%2$cmov rsi, format_str%1$c%2$cmovzx rdx, byte [nl]%1$c%2$cmovzx rcx, byte [tab]%1$c%2$cmovzx r8, byte [quote]%1$c%2$cmov r9, format_str%1$c%2$csub rsp, 16%1$c%2$cpush r12%1$c%2$cxor rax, rax%1$c%2$ccall dprintf%1$c%2$cadd rsp, 24%1$c%2$ccall _hello%1$c%2$cret%1$c_hello:%1$c%2$cret%1$c_create_file:%1$c%2$cmov rax, 2%1$c%2$cmov rdi, fname%1$c%2$cmov rsi, 577%1$c%2$cmov rdx, 420%1$c%2$csyscall%1$c%2$ccmp rax, 0%1$c%2$cjl _error_exit%1$c%2$cmov rbx, rax%1$c%2$cret%1$c_check_for_decrement:%1$c%2$cmov rdi, current_file%1$c%2$cmov rsi, format_fname%1$c%2$cmovzx rdx, byte [value]%1$c%2$csub rsp, 8%1$c%2$ccall sprintf%1$c%2$cadd rsp, 8%1$c%2$cmov rdi, current_file%1$c%2$cmov rsi, this_file%1$c%2$ccall strcmp%1$c%2$ccmp rax, 0%1$c%2$cje _decrement_and_continue%1$c%2$cret%1$c_decrement_and_continue:%1$c%2$cdec r12%1$c%2$cret%1$c_clean_exit:%1$c%2$cmov rdi, 0%1$c%2$ccall _exit%1$c_error_exit:%1$c%2$cmov rdi, 1%1$c%2$ccall _exit%1$c_exit:%1$c%2$cmov rax, 60%1$c%2$csyscall%1$c",0
	format_compile db "nasm -f elf64 -g %1$s.s -o %1$s.o", 0
	format_link db "ld -o %1$s %1$s.o", 0
	test_ls db "ls -l", 0
	value dd 5
	fname db "Sully_X.s",0
	this_file db __FILE__,0
	format_fname db "Sully_%d.s",0
	exename db "Sully_X",0
	compile_cmd times 200 db 0
	run_cmd times 200 db 0
	current_file times 200 db 0
	nl db 10
	tab db 9
	quote db 34
section .text
	global _start
_start:
	movzx r12, byte [value]
	cmp r12, 0
	jl _error_exit
	jmp _check_for_decrement
	mov [fname+6], r12b
	add [fname+6], dword '0'
	mov [exename+6], r12b
	add [exename+6], dword '0'
	jmp _create_file

_check_for_decrement:
	mov rdi, current_file
	mov rsi, format_fname
	movzx rdx, byte [value]
	sub rsp, 16
	call sprintf
	add rsp, 16
	jmp _hello
	mov rdi, current_file
	mov rsi, this_file
	jmp _hello
	call strcmp
	cmp rax, 0
	je _decrement_and_continue
	ret
_decrement_and_continue:
	dec r12
	ret
_clean_exit:
	mov rdi, 0
	call _exit
_error_exit:
	mov rdi, 1
	call _exit
_exit:
	mov rax, 60
	syscall
_hello:
	ret

_create_file:
	mov rax, 2
	mov rdi, fname
	mov rsi, 577
	mov rdx, 420
	syscall
	cmp rax, 0
	jl _error_exit
	mov rbx, rax
	jmp _write_to_file
_write_to_file:
	mov rdi, rbx
	mov rsi, format_str
	movzx rdx, byte [nl]
	movzx rcx, byte [tab]
	movzx r8, byte [quote]
	mov r9, format_str
	sub rsp, 8
	push r12
	xor rax, rax
	call dprintf
	add rsp, 16
	jmp _close_file
_close_file:
	mov rax, 3
	mov rdi, rbx
	syscall
	jmp _compile_file
_compile_file:
	mov rdi, compile_cmd
	mov rsi, format_compile
	mov rdx, exename
	xor rax, rax
	sub rsp, 16
	call sprintf
	mov rdi, test_ls
	call system
	add rsp, 16
	cmp rax, 0
	jne _error_exit