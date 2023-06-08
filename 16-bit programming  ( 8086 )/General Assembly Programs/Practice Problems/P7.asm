.MODEL SMALL

.DATA     
      
.CODE 
;Clear the sign bit of AL while leaving the other bits unchanged.        
      MOV BX,@DATA
      MOV DS,BX
        
      MOV AL,10110010B
      MOV CH,00110010B
      AND AL,CH


.EXIT