; a program to ADD three numbers using registers
.model small

org 0x0100
.data


.code

mov ax, 5 ; load first number in ax
mov bx, 10 ; load second number in bx
add ax, bx ; accumulate sum in ax
mov bx, 15 ; load third number in bx
add ax, bx ; accumulate sum in ax

.exit