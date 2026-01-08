[org 100h]         ; DOS COM program starts at offset 0x100

section .data
prompt1     db "Enter first digit (0-9): $"
prompt2     db "Enter second digit (0-9): $"
result_msg  db "Result = $"
newline     db 13, 10, "$"

section .text
start:

    ; Display prompt1
    mov dx, prompt1
    mov ah, 9
    int 21h

    ; Read first character
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to integer
    mov bl, al        ; Store in BL

    ; Newline
    mov dx, newline
    mov ah, 9
    int 21h

    ; Display prompt2
    mov dx, prompt2
    mov ah, 9
    int 21h

    ; Read second character
    mov ah, 1
    int 21h
    sub al, '0'       ; Convert ASCII to integer
    mov bh, al        ; Store in BH

    ; Multiply bl * bh → result in AX
    mov al, bl
    mul bh            ; AL * BH → result in AX (since 8-bit * 8-bit = 16-bit result in AX)

    ; Save result in AX
    mov bx, ax        ; Result is in BX

    ; Print newline and message
    mov dx, newline
    mov ah, 9
    int 21h

    mov dx, result_msg
    mov ah, 9
    int 21h

    ; Now BX contains result (0–81 for 0–9 * 0–9)
    ; Convert to decimal and print each digit

    ; Divide BX by 10 to get tens and units
    mov ax, bx
    xor dx, dx
    mov cx, 10
    div cx            ; AX / 10 → AL = quotient, AH = remainder

    ; AL = tens digit, AH = units digit
    add al, '0'       ; convert to ASCII
    mov dl, al
    mov ah, 2
    int 21h           ; print tens

    mov al, ah        ; remainder (units)
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h           ; print units

    ; Exit
    mov ah, 4Ch
    int 21h
