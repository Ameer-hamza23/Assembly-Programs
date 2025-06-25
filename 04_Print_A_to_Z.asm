[org 100h]
section .data

section .text
start:

mov cx,26

mov dl,65
l1:
mov ah,2
int 21h

inc dl


loop l1


mov ah,4ch
int 21h
