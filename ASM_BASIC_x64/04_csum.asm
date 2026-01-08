BITS 64

; default rel

global sum
; int sum(int x, int y);

sum:
    ; function to add two integers
    ; parameters: rdi = x, rsi = y
    mov rax, rdi   ; move first parameter to rax
    add rax, rsi   ; add second parameter to rax
    ;All c program expect return value in rax
    ret


    ;;nasm -flfat -o 04_csum.o 04_csum.asm
    ;;gcc -O0 -Wall 04_sum.c 04_csum.o -o 04_sum