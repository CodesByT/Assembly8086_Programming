;  a program to add three numbers 
;accessed using a single variable array ver-2 
.model small 

org 0x0100 

.data 

num1  dw 5,10,15,0

.code

mov ax, [num1] ; load first number in ax 
mov bx, [num1+2] ; load second number in bx 
add ax, bx ; accumulate sum in ax 
mov bx, [num1+4] ; load third number in bx 
add ax, bx ; accumulate sum in ax 
mov [num1+6], ax ; store sum at num1+6 



.exit