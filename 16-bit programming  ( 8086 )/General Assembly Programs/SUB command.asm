; program of SUB command
.model small 

org 0x0100
.data


.code

mov ax, 0x1F ; load first number in ax
mov bx, 0x05 ; load second number in bx
sub ax, bx ; accumulate sum in ax
mov bx, 0x10 ; load third number in bx
sub ax, bx ; accumulate sum in ax


.exit