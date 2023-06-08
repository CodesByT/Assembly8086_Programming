.MODEL SMALL
.DATA

.CODE
      MOV BX,@DATA
      MOV DS,BX
       
      MOV AX,0X11
      ROR AX,1
      
      MOV CX,0
      MOV DX,0
      ADC DX,CX
; Here we are checking if '0' then even,if '1' then odd      
      MOV CX,0
      
      CMP DX,CX
      JNE Even
      
NotEven:
      MOV AX,0X0DD
Even:
      MOV AX,0X1111      
.EXIT