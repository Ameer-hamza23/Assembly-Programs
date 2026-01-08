[BITS 64]

default rel

extern printf
extern scanf
extern exit
global main

section .bss
    buffer1: dd 0
    buffer2: dd 0
    buffer3: dd 0

section .rodata
    msg1: db "          Welcome to Calculator", 10 , 0
    msg2: db "Enter first Number : ",  0
    msg3: db "Enter second Number : ", 0
    fmt_in: db "%d" , 0
    fmt_out: db "%d", 10, 0
    fmt_char_in: db "%c" , 0
    fmt_char_out: db "%c" , 0

section .text

    main:
        sub rsp, 8

        lea rdi, [rel msg1]
        xor rax, rax
        call printf

        lea rdi, [rel msg2]
        xor rax, rax
        call printf

        lea rdi, [rel fmt_in]
        lea rsi, [buffer1]
        xor rax, rax
        call scanf
        
        lea rdi, [rel msg2]
        xor rax, rax
        call printf

        lea rdi, [rel fmt_in]
        lea rsi, [buffer2]
        xor rax, rax
        call scanf

        lea rdi, [rel fmt_out]
        mov esi, [buffer1]
        xor rax, rax
        call printf

        lea rdi, [rel fmt_out]
        mov esi, [buffer2]
        xor rax, rax
        call printf

        lea rdi, [rel msg3]
        xor rax, rax
        call printf

        lea rdi, [rel fmt_char_in]
        lea rsi, [buffer3]
        xor rax, rax
        call scanf

        
        add rsp,8
        mov rax, 60
        xor rdi, rdi
        syscall
    