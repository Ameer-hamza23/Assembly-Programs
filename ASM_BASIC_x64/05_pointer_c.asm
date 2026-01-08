[BITS 64]

global asm_change_value


section .text

asm_change_value:
    ; function to change the value at the given pointer
    ; parameter: rdi = pointer to integer
    ; dword is 4 bytes quadword is 8 bytes we are using dword as int is 4 bytes
    mov dword [rdi], 42   ; change the value at the address in rdi to 42
    ret