.MODEL SMALL

.DATA     
      
.CODE
      MOV BX,@DATA
      MOV DS,BX
      
      MOV WORD PTR DS:[0XF123],0X5555
      MOV WORD PTR DS:[0XA234],0X6666
      MOV AX,WORD PTR DS:[0XF123]
      MOV BX,WORD PTR DS:[0XA234]
      
      XCHG AX,BX
      
.EXIT