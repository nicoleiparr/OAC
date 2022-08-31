; Para ensamblar ejecutar:
; nasm -f elf64 helloworld.asm -o helloworld.o
; Para enlazar ejecutar:
; ld helloworld.o -o helloworld
; Para correr el ejecutable:
; ./helloworld

; SEGMENTO DE DATOS

section .data
    message db "Hello world", 10 ; el numero 10 corresponde al caracter \n
    len equ $ - message            ; resta de direcciones (actual - inicio de cadena)


; SEGMENTO DE TEXTO
section .text
    global _start


_start:

;LLAMADA AL SISTEMA

; rax => ID                : 1 == sys_write
; rdi => primer parametro  : output
; rsi => segundo argumento : direccion del mensaje
; rdx => tercer argumento  : longitud del mensaje
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, len
    syscall

exit: 

;LLAMADA AL SISTEMA

; rax => ID                : 60 == sys_exit
; rdi => primer parametro  : 0 <= sin errores
    mov rax, 60
    mov rdi, 0
    syscall
    