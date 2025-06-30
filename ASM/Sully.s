extern exit
extern fopen
extern fprintf
extern fclose
extern snprintf
extern system
extern strcmp

section .data
    i: dq 5

    format_str: db "extern exit%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern snprintf%1$cextern system%1$cextern strcmp%1$c%1$csection .data%1$c    i: dq %4$d%1$c%1$c    format_str: db %2$c%3$s%2$c, 0%1$c%1$c    file_w: db %2$cw%2$c, 0%1$c    fname: db %2$cSully_X.s%2$c, 0%1$c    objname: db %2$cSully_X.o%2$c, 0%1$c    exename: db %2$cSully_X%2$c, 0%1$c    sully_s_template: db %2$cSully_%%d.s%2$c, 0%1$c    our_filename: db __FILE__, 0%1$c%1$c    compile_cmd_template: db %2$cnasm -f elf64 -g %%1$s -o %%2$s && ld -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2 -g %%2$s -o %%3$s%2$c, 0%1$c    run_cmd_template: db %2$c./%%s%2$c, 0%1$c%1$c    compile_cmd: times 256 db 0%1$c    run_cmd: times 128 db 0%1$c    sully_s_buffer: times 128 db 0%1$c%1$c    nl: db 10%1$c    quote: db 34%1$c%1$csection .text%1$c    global _start%1$c%1$c_start:%1$c    enter 0, 0%1$c    and rsp, -16%1$c    mov rbx, [i]%1$c%1$c    cmp rbx, 0%1$c    jl exit_error%1$c    cmp rbx, 9%1$c    jg exit_error%1$c%1$c    mov rdi, sully_s_buffer%1$c    mov rsi, 128%1$c    mov rdx, sully_s_template%1$c    mov rcx, rbx%1$c    xor rax, rax%1$c    call snprintf%1$c%1$c    mov rdi, our_filename%1$c    mov rsi, sully_s_buffer%1$c    call strcmp%1$c    test rax, rax%1$c    jnz .no_match%1$c    dec rbx%1$c.no_match:%1$c    mov rax, rbx%1$c    add rax, '0'%1$c    mov byte [fname+6], al%1$c    mov byte [objname+6], al%1$c    mov byte [exename+6], al%1$c%1$c    mov rdi, fname%1$c    mov rsi, file_w%1$c    call fopen%1$c    test rax, rax%1$c    jz exit_error%1$c    mov r12, rax%1$c%1$c    mov rdi, r12%1$c    mov rsi, format_str%1$c    movzx rdx, byte [nl]%1$c    movzx rcx, byte [quote]%1$c    mov r8, format_str%1$c    mov r9, rbx%1$c    xor rax, rax%1$c    call fprintf%1$c%1$c    mov rdi, r12%1$c    call fclose%1$c%1$c    mov rdi, compile_cmd%1$c    mov rsi, 256%1$c    mov rdx, compile_cmd_template%1$c    mov rcx, fname%1$c    mov r8, objname%1$c    mov r9, exename%1$c    xor rax, rax%1$c    call snprintf%1$c%1$c    mov rdi, compile_cmd%1$c    call system%1$c%1$c    cmp rbx, 0%1$c    jl exit_normal%1$c%1$c    mov rdi, run_cmd%1$c    mov rsi, 128%1$c    mov rdx, run_cmd_template%1$c    mov rcx, exename%1$c    xor rax, rax%1$c    call snprintf%1$c%1$c    mov rdi, run_cmd%1$c    call system%1$c%1$cexit_normal:%1$c    mov rdi, 0%1$c    call exit%1$c%1$cexit_error:%1$c    mov rdi, 1%1$c    call exit%1$c", 0

    file_w: db "w", 0
    fname: db "Sully_X.s", 0
    objname: db "Sully_X.o", 0
    exename: db "Sully_X", 0
    sully_s_template: db "Sully_%d.s", 0
    our_filename: db __FILE__, 0

    compile_cmd_template: db "nasm -f elf64 -g %1$s -o %2$s && ld -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2 -g %2$s -o %3$s", 0
    run_cmd_template: db "./%s", 0

    compile_cmd: times 256 db 0
    run_cmd: times 128 db 0
    sully_s_buffer: times 128 db 0

    nl: db 10
    quote: db 34

section .text
    global _start

_start:
    enter 0, 0
    and rsp, -16
    mov rbx, [i]

    cmp rbx, 0
    jl exit_error
    cmp rbx, 9
    jg exit_error

    mov rdi, sully_s_buffer
    mov rsi, 128
    mov rdx, sully_s_template
    mov rcx, rbx
    xor rax, rax
    call snprintf

    mov rdi, our_filename
    mov rsi, sully_s_buffer
    call strcmp
    test rax, rax
    jnz .no_match
    dec rbx
.no_match:
    mov rax, rbx
    add rax, '0'
    mov byte [fname+6], al
    mov byte [objname+6], al
    mov byte [exename+6], al

    mov rdi, fname
    mov rsi, file_w
    call fopen
    test rax, rax
    jz exit_error
    mov r12, rax

    mov rdi, r12
    mov rsi, format_str
    movzx rdx, byte [nl]
    movzx rcx, byte [quote]
    mov r8, format_str
    mov r9, rbx
    xor rax, rax
    call fprintf

    mov rdi, r12
    call fclose

    mov rdi, compile_cmd
    mov rsi, 256
    mov rdx, compile_cmd_template
    mov rcx, fname
    mov r8, objname
    mov r9, exename
    xor rax, rax
    call snprintf

    mov rdi, compile_cmd
    call system

    cmp rbx, 0
    jl exit_normal

    mov rdi, run_cmd
    mov rsi, 128
    mov rdx, run_cmd_template
    mov rcx, exename
    xor rax, rax
    call snprintf

    mov rdi, run_cmd
    call system

exit_normal:
    mov rdi, 0
    call exit

exit_error:
    mov rdi, 1
    call exit
