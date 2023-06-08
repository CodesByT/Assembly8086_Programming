
; Write a program in assembly language that calculates the square of six by adding six to the 
; accumulator six times.

org 0x100

add ch,6h 
add ch,6h 
add ch,6h 
add ch,6h 
add ch,6h 
add ch,6h 
       
mov ax,0x4c00
int 21h