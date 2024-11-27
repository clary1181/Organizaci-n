section .data         
    num1 db 12           ; Declaramos un número, en este caso 12
    num2 db 7           ; Otro número, en este caso 7
    result db 0         ; Espacio para el resultado (inicializado a 0)
    newline db 10       ; Salto de línea (ASCII 10)

section .bss            ; Sección de datos no inicializados (no lo usamos aquí)

section .text           ; Sección de código
    global _start       ; Punto de entrada para el programa

_start:                 ; Aquí comienza el programa

    ; Cargar los números en registros
    mov al, [num1]      ; Mueve el valor de num1 (6) al registro AL
    mov bl, [num2]      ; Mueve el valor de num2 (7) al registro BL

    ; Realizar la multiplicación
    mul bl              ; Multiplica AL por BL, el resultado se almacena en AX

    ; Guardar el resultado en la variable 'result'
    mov [result], al    ; Mueve el resultado (parte baja de AX) a la variable result

    ; Mostrar el resultado en pantalla
    ; Configurar para imprimir el resultado como texto
    mov eax, 4          ; Llamada al sistema para escribir (sys_write)
    mov ebx, 1          ; Descriptor de archivo 1 (salida estándar)
    mov ecx, result     ; Dirección del resultado
    mov edx, 1          ; Queremos escribir 1 byte
    int 0x80            ; Llamada al sistema (Linux)

    ; Imprimir un salto de línea después del resultado
    mov eax, 4          ; Llamada al sistema para escribir (sys_write)
    mov ebx, 1          ; Descriptor de archivo 1 (salida estándar)
    mov ecx, newline    ; Dirección del salto de línea
    mov edx, 1          ; Queremos escribir 1 byte
    int 0x80            ; Llamada al sistema (Linux)

    ; Salir del programa
    mov eax, 1          ; Llamada al sistema para salir (sys_exit)
    xor ebx, ebx        ; Código de salida 0 (sin errores)
    int 0x80            ; Llamada al sistema (Linux)
