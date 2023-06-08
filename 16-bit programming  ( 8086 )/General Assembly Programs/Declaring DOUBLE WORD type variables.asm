; declaring DOUBLE WORD type variables
.model small 

org 0x0100
.data

num5 dd 0x12345678


.code

mov bx,[num5] ;load lower 2 bytes of num5 in bx register.
mov cx,[num5+2] ;load higher 2 bytes of num5 in cx register.


.exit