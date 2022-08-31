; Se empleara la etiqueta message y se reservaran elementos de 8 bits
; Cada letra de la cadena se corresponde con un elemento de 8 bits

; El numero 10 se corresponde con el caracter \n
; El numero 0 se emplea como fin de cadena

section .data
    message db "Hola mundo", 10, 0

section .text
    global _start

_start:

    mov rax, message        ; rax = direccion del inicio del mensaje 
    mov rbx, 0              ; contador de letras

_countLoop:
    inc rax
    inc rbx
    mov cl, [rax]           ; pasa el valor que contiene rax
    cmp cl, 0               ; compara si es FIN DE CADENA = 0
    jne _countLoop

;SYS_WRITE

    mov rax, 1
    mov rdi, 1
    mov rsi, message        ; direccion inicio de cadena
    mov rdx, rbx            ; longitud del mensaje
    syscall

;SYS_EXIT
    mov rax, 60
    mov rdi, 0
    syscall
    
