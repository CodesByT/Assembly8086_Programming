;  a program to ADD three numbers directly in memory  
.model small 

org 0x0100 

.data 

num1  dw 5,10,15,0

.code

mov ax, [num1] ; load first number in ax 
mov [num1+6], ax ; store first number in result 
mov ax, [num1+2] ; load second number in ax 
add [num1+6], ax ; add second number to result 
mov ax, [num1+4] ; load third number in ax 
add [num1+6], ax ; add third number to result 



.exit