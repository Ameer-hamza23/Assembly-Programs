BITS 64  ; specify 64 bit code
default rel  ; use RIP relative addressing

extern printf
global main


section .data
   fmt: db "%1d", 10, 0  ; format string for call to printf

section .text
add_and_print:
    ; function to add two numbers and print the result
    ; parameters: rdi = a, rsi = b
    mov rax, rdi   ; move first parameter to rax
    add rax, rsi   ; add second parameter to rax
    ; now rax has the result
    ret
    main:
    mov  rdi,50
    mov rsi,70
    call add_and_print   ; call the function
    mov rdi , fmt   ; first parameter to printf: format string
    mov rsi, rax   ; second parameter to printf: the result from add_and
    xor rax, rax   ; clear rax before calling printf
    call printf   ; call printf to print the result
    mov rax, 60   ; syscall: exit
