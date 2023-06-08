.MODEL SMALL

.DATA     
      
.CODE
      MOV BX,0X4158
      MOV DS,BX
      
      MOV WORD PTR DS:[0x27A1],0X195C

      
.EXIT