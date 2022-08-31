section .data
    pregunta db "Cual es tu nombre? "
    lenp equ $ - pregunta
    
    saludo db "Hola, "
    lens equ $ - saludo

section .bss
    nombre resb 16        ; Reservamos 16 bytes para el nombre 

section .text
    global _start

_start:

    ;Mostramos la pregunta
    mov rax, 1
    mov rdi, 1
    mov rsi, pregunta
    mov rdx, lenp
    syscall

;SYS_READ
    ;Leemos el nombre por el terminal
    mov rax, 0
    mov rdi, 0
    mov rsi, nombre
    mov rdx, 16
    syscall

    ;Saludamos con el nombre ingresado
    mov rax, 1
    mov rdi, 1
    mov rsi, saludo
    mov rdx, lens
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nombre
    mov rdx, 16
    syscall

;SYS_WRITE
    mov rax, 60
    mov rdi, 0
    syscall

