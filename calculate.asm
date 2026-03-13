b main

main:
    mov r2, #3      ; r2=y
    mov r1, #1      ; r1=x
    mov r0, #3      ; r0=repeat
    bl calculate    ; аргументы функции помещены в регистры r0-r2
        
calculate:
    push {r4, r5, r6, r7}   ; используемые в теле цикла регистры
                    
    mov r4, #10     ; max=10 
    mov r5, #0      ; res=0
    mov r3, #0      ; i=0
    mov r6, #0      ; sum - доп регистр под результат сложения
    mov r7, #0      ; mul - доп регистр под результат умножения
.loop:
    add r6, r1, r2
    mul r7, r1, r2
    add r5, r5, r6
    add r5, r5, r7
    cmp r6, r4
    blt .true
    bge .false
    add r3, r3, 1
    cmp r3, r0
    blt .loop
    bge .done
.true:
    mov r1, r6
.false:
    mov r1, r4
.done:
    mov r0, r5   ; возвращаем значение res через регистр r0 
    pop {r4, r5, r6, r7}
    bx lr       ; lr - link register - адрес следующей инструкции
