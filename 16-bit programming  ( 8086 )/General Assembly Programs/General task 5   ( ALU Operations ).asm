        
;   Write a program to implement the following equation. 
;   X = ~0xFF12 ^ {0xABFF & (0x2113 | 0x2340)}
             
             
.model small 

.data   

.code    
       
        MOV AX,0XFF12
        MOV BX,0XABFF
        MOV CX,0X2113
        MOV DX,0X2340
        
        OR  CX,DX
        AND BX,CX
        NOT AX
        XOR BX,AX 
  
.exit