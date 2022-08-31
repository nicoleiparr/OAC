section .data   
    binstr db "10101010"    ; numero binario a convertir
    res db 0                ; resultado

section .text   
    global _start

_start:
    mov r15, binstr         ; guardamos la posición de memoria
    mov r14, 128            ; como son 8 bits, empezamos de 128
    mov r13, 2              ; divisor de las potencias de 2
    mov r12, 0              ; acumulador del resultado

mulbuc:
    mov al, [r15]           ; al = " 1 " (como string)
    sub al, '0'             ; restmaos para que seqa número y no string
    mul r14                 ; rax = rax
    add r12, rax            ; acumulamos en r12

sigpa:
    xor rdx, rdx            ; limpiamos rdx para el residuo
    mov rax, r14            ; gurdamos en rax para dividir
    div r13                 ; dividimos entre la potencia de 2 rax = rax/r13
    mov r14, rax            ; devolvemos al divisor
    inc r15                 ; avanzamos de posicion para ir al sigueiente numero string
    cmp r14, 0               ; verfica si termino la cadena
    jne mulbuc

respuesta:
	mov	[res],	r12b        ; pasamos la respuesta almacenada al valor de la variable res
	; r12b -> parte low de 8 bits del registro r12

mostrar_respuesta:
    mov rax, 1
    mov rdi, 1
    mov rsi, res
    mov rdx, 128
    syscall

fin:    
    mov	rax, 60
	mov rdi, 0
	syscall
