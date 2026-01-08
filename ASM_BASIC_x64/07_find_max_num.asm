[BITS 64]

default rel

extern printf
extern scanf
global main
global exit

section .bss
    buffer1 dd 0

section .rodata
    msg1: db "Enter a Number :",0
    fmt_in: db "%d",0
    fmt_out: db "The Maximum Number is: %d",10,0

section .text

    main:
        sub rsp, 8

        mov rdx, 10


        lea rdi, [rel msg1]
        xor rax, rax
        call printf

        lea rdi, [rel fmt_in]
        lea rsi, [rel buffer1]
        xor rax, rax
        call scanf

        mov eax, [buffer1]
        cmp eax, edx
        jg .is_greater
        mov eax, edx
        jmp .print_result
.is_greater:
.print_result:
        lea rdi, [rel fmt_out]
        mov esi, eax
        xor rax, rax
        call printf

.exit:
        add rsp,8
        mov rax, 60
        xor rdi, rdi
        syscall