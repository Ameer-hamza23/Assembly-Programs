[BITS 16]
[ORG 0x100]

section .data
name db "Rao Ameer Hamza$", 0

section .text
start:
    mov dx, name
    mov ah, 9
    int 21h

    mov ax, 4C00h
    int 21h
