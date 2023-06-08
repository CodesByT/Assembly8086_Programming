; MOV data into segment registers
.model small

org 0x0100
.data


.code
mov cx, 0x468F ; move 468F Hex into register CX
mov ax,cx   ; copy CX to AX
mov dx,ax   ; copy AX to DX
mov bx,dx   ; copy DX to BX
mov di,bx   ; copy BX to DI
mov si,di   ; copy DI to SI
mov ds,si   ; copy SI to DS
mov bp,di   ; copy DI to BP 

.exit