.MODEL SMALL

.DATA     
      
.CODE 
; Set the most significant and least significant bits of AL while preserving the other bits     
      MOV BX,@DATA
      MOV DS,BX
        
      MOV AL,01111110B
      MOV CH,10000001B
      OR AL,CH


.EXIT