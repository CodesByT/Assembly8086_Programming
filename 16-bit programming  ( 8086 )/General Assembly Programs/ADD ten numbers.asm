;  INDIRECT ADDRESSING
;  a program to add ten numbers
  
.model small 

org 0x0100 

.data 

num1 dw 10, 20, 30, 40, 50, 10, 20, 30, 40, 50 
  
total dw 0

.code 

 mov bx,(num1); point bx to first number 
 mov cx, 10 ; load count of numbers in cx 
 mov ax, 0 ; initialize sum to zero 
l1: add ax, [bx] ; add number to ax 
 add bx, 2 ; advance bx to next number 
 sub cx, 1 ; numbers to be added reduced 
 jnz l1 ; if numbers remain add next 
 mov [total], ax ; write back sum in memory 
  


.exit