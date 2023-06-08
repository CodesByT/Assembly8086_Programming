.MODEL SMALL

.DATA     
      
.CODE 
;   Complement the bits in AX.     
      MOV BX,@DATA
      MOV DS,BX
        
      MOV AX,0110010101001011B
      NOT AX


.EXIT