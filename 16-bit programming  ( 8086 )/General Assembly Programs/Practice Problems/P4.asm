.MODEL SMALL

.DATA     
      
.CODE
      MOV BX,@DATA
      MOV DS,BX
     
      MOV WORD PTR DS:[0x1A1E],0X5555
      MOV CX, WORD PTR DS:[0x1A1E]
      ADD CX,1400

      
.EXIT