; declaring WORD type variables
.model small 

org 0x0100
.data

num1 dw 65
num2 dw 10
num3 dw 15
num4 dw 0


.code

mov ax, [num1] ; load first number in ax
mov bx, [num2] ; load second number in bx
add ax, bx ; accumulate sum in ax
mov bx, [num3] ; load third number in bx
add ax, bx ; accumulate sum in ax
mov [num4], ax ; store sum in num4


.exit