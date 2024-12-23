section .data

section .bss

section .text
global euclidean_distance

; double euclidean_distance(const double* point1, const double* point2, size_t dimension)
euclidean_distance:
    ; RDI = point1, RSI = point2, RDX = dimension
    push rbp
    mov rbp, rsp
    sub rsp, 16             ; Espacio para una variable temporal

    xor rax, rax            ; Acumulador para la suma de cuadrados (en xmm0)
    pxor xmm0, xmm0         ; Limpia el registro xmm0

    xor rcx, rcx            ; Índice inicial (rcx = 0)

.distance_loop:
    cmp rcx, rdx            ; Si rcx == dimension, terminamos
    jge .end_loop

    ; Carga los valores de point1 y point2
    movsd xmm1, qword [rdi + rcx * 8]
    movsd xmm2, qword [rsi + rcx * 8]

    ; Calcula la diferencia al cuadrado: (point1 - point2)^2
    subsd xmm1, xmm2
    mulsd xmm1, xmm1
    addsd xmm0, xmm1        ; Acumula el resultado en xmm0

    inc rcx                 ; Incrementa el índice
    jmp .distance_loop

.end_loop:
    sqrtsd xmm0, xmm0       ; Calcula la raíz cuadrada
    movsd qword [rsp], xmm0 ; Almacena el resultado en la pila
    fld qword [rsp]         ; Carga el resultado en la pila flotante

    add rsp, 16             ; Limpia la pila
    pop rbp
    ret
