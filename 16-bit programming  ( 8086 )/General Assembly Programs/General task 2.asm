
;   Write a program to solve the following equation.
;   DX = AX + BH – CL + DX

org 0x100

mov ax,0100h
mov bh,55h
mov cl,0Ah
mov dx,0001h   

add ax,dx 

mov ch,00h
mov bl,bh
mov bh,00h


sub bx,cx

add ax,bx
       
       
;mov ax,0x4c00
int 21h
