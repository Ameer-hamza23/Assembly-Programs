BITS 64

default rel

section .data
    msg: db "hello World" , 0x0A   ;   message + newline
    msglen: equ $ - msg

section .text

global _start

_start:
    ; write(1, msg , len)

    mov rax, 1   ; linux sys call  ;; to veriy  cat /usr/include/x86_64-linux-gnu/asm/unistd_64.h all calls
    mov rdi, 1   ; file descriptor 1 = stdout
    mov rsi, msg ; print the message
    mov rdx, msglen   ; message length
    syscall

    ; exit the kernal
    mov rax, 60  ; sys exit
    xor rdi, rdi   ; status 0
    syscall
    