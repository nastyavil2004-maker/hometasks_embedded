# hometasks_embedded

Задание 1. 
Написать функцию calculate.s на языке ассемблера ARM-32 (для этого добавила 
.syntax unified
.arm
строки в первоначальную версию кода).  

Запускала программу через эмулятор QEMU. Предварительно установила WSL (Ubuntu), где и работала. Сначала загрузила сам эмулятор (sudo apt install binutils-arm-linux-gnueabihf), затем произвела сборку - ассемблирование и линковку (arm-linux-gnueabihf-as -o calculate.o calculate.s и arm-linux-gnueabihf-ld -o calculate calculate.o, соответственно). Запустила программу в QEMU (qemu-arm-static ./calculate) и проверила код возврата (echo $?) - программа завершилась с возвратом значения регистра r0, где и хранится результат выполнения программы. По заданным мною входным параметрам (r2 = y = 3, r1 = x = 1, r0 = repeat = 3) результат должен быть равен 57, что я и получила.
<img width="804" height="219" alt="image" src="https://github.com/user-attachments/assets/c168050b-08b7-4e33-a270-42018654913a" />

