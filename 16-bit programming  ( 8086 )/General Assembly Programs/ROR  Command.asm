.MODEL SMALL

.DATA

.CODE
      mov bx,@data
      mov ds,bx
      
      mov ax,0x1429
      ;0001 0100 0010 1001
      ;1000 1010 0001 0100
      ;0100 0101 0000 1010
      ;0010 0010 1000 0101
      ;1001 0001 0100 0010
      ;0100 1000 1010 0001 
      mov cx,16

label:      
      ROR ax,1
      loop label

.EXIT