; ADD command in 8 bit registers
.model small

org 0x0100
.data


.code

mov al, 0x25 ; move 25 Hex into register AL
mov bl, 0x34   
add al,bl    ;AL=AL+BL 
mov dh,0x75  
mov cl,0x63   
add dh,cl 

.exit