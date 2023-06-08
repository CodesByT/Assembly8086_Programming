.MODEL SMALL


.DATA
     arr db 42h,75h,10h,86h,20h,12h,10h,73h,64h,10h,29h,90h,35h,44h,50h,36h,10h,24h,12h,10h
     occurence db 0
.CODE
     
     mov dx,@data
     mov ds,dx
               
               
     mov dx,10h     
     mov cx,20
     mov bx,0 

TOP:     
     mov al,[arr+bx]
     inc bx
     CMP al,dl
     
     JE  EQUAL
     CMP cx,0
     JE exit
     LOOP TOP
     
EQUAL:
     add [occurence],1
     INC bx
     CMP cx,0
     JE exit
     LOOP TOP   

exit:
.EXIT