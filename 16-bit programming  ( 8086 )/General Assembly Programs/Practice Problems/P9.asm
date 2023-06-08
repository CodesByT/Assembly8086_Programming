.MODEL SMALL

.DATA     
      
.CODE 
;   Complement the bits in AX.     
      MOV BX,@DATA
      MOV DS,BX
        
      MOV DX,0110010101001011B  
      MOV AX,1110010101001011B
      OR  DX,AX


.EXIT