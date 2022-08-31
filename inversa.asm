section .data
    mensaje db "Hola mundo", 0  ;0 = fin de cadena

section .bss
    inverse resb 20             ;20 bites

section .text
    global _start

_start:
    mov rax, mensaje        ; pasamos la direccion del inicio del mensaje
    mov rbx, 0              ; contador

_countLoop: ; cuenta numero de letras del mensaje
            ; se puede hacer tambien en .data con equ $ - mensaje
    inc rax
    inc rbx
    mov cl, [rax]           ; cl = registro de 8 bits
    cmp cl, 0               ; valida si llego al final de la cadena
    jne _countLoop

    mov r8, rbx             ; rbx ya tiene la longitud , luego r8 = rbx
    mov r9, inverse         ; r9 = la direccion de inicio de inverse 
    mov rax, mensaje        ; rax = la direccion de inicio de mensaje
    add rax, r8             ; movemos rax hasta el final del mensaje = 0

_reverse:
    dec rax                 ; como esta en el fin de cadena, lo movemos a "o"
    mov r10, [rax]          ; r10 = "o"
    mov [r9], r10           ; "o" pasa a la posicion r9 
    inc r9                  ; avanzamos un espacio del inverse
    cmp rax, mensaje        ; como rax va de atras hacia adelante, 
                            ;verifica que no haya llegado al incio    
                            ; ahora rax = "d"
    jne _reverse

    mov [r9], byte 10       ; se le coloca el cambio de linea '\n'
    inc rbx                 ; incrmenta pues tiene el tamaño del mensaje + '\n'

    ;SYS_WRITE
    mov rax, 1
    mov rdi, 1
    mov rsi, inverse
    mov rdx, rbx
    syscall

    ;SYS_EXIT
    mov rax, 60
    mov rdi, 0
    syscall
