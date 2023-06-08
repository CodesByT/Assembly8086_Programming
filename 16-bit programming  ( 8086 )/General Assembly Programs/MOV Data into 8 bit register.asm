; MOV data into segment registers
.model small

org 0x0100
.data


.code
mov cl, 55H ; move 55H into register CL
mov dl,cl   ; copy CL to DL
mov ah,dl   ; copy DL to AH
mov al,ah   ; copy AH to AL
mov bh,cl   ; copy CL to BH
mov ch,bh   ; copy BH to CH 

.exit