.syntax unified
.arm

.section .data

.section .text
.global _start

_start:
    b main

main:
    mov r2, #3          @ r2 = y
    mov r1, #1          @ r1 = x
    mov r0, #3          @ r0 = repeat
    bl calculate        @ аргументы функции помещены в регистры r0-r2
    
    mov r7, #1          @ syscall exit
    svc #0              @ выход с кодом из r0
        
calculate:
    push {r4, r5, r6, r7, lr} @ используемые в теле цикла регистры
                    
    mov r4, #10         @ max = 10 
    mov r5, #0          @ res = 0
    mov r3, #0          @ i = 0
    mov r6, #0          @ sum - доп регистр под результат сложения
    mov r7, #0          @ mul - доп регистр под результат умножения

.loop:
    @ Сначала увеличиваем счётчик
    add r3, r3, #1      
    
    @ Затем вычисления
    add r6, r1, r2    
    mul r7, r1, r2    
    add r5, r5, r6    
    add r5, r5, r7    
    
    cmp r6, r4
    blt .true
    b .false            

.true:
    mov r1, r6          @ x = sum
    b .check_loop

.false:
    mov r1, r4          @ x = max

.check_loop:
    cmp r3, r0          
    blt .loop           
    
.done:
    mov r0, r5       @ возвращаем значение res через регистр r0 
    pop {r4, r5, r6, r7, lr}
    bx lr     @ lr - link register - адрес следующей инструкции

