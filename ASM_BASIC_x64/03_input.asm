[BITS 64]

default rel
global main
extern printf
extern scanf

section .bss   ;; this is defined uninitialized data for global
    buffer: resb 20   ; reserve 20 bytes for input buffer

section .rodata  ;; this is read only data
    prompt: db "Enter a number: ", 0
    fmt_in: db "%d", 0   ; format string for scanf
    fmt_out: db "You entered: %d", 10, 0   ; format string for printf

section .text
    main:
        ; print prompt
        sub rsp, 8   ; align stack to 16 bytes
        lea rdi, [rel prompt]   ; address of prompt
        xor rax, rax   ; clear rax before calling printf or we can use mov rax,0 but xor is faster
        call printf

        ; read integer input
        lea rdi, [rel fmt_in]   ; address of format string
        lea rsi, [rel buffer]   ; address of buffer to store input
        xor rax, rax   ; clear rax before calling scanf
        call scanf

        ; print the entered number
        lea rdi, [rel fmt_out]   ; address of output format string
        mov rsi, [rel buffer]   ; load the entered number from buffer
        xor rax, rax   ; clear rax before calling printf
        call printf

        ; exit program
        add rsp, 8   ; restore stack
        mov rax, 60   ; syscall: exit
        xor rdi, rdi   ; status 0
        syscall