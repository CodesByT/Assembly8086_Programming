.MODEL SMALL  
.STACK 100H
.DATA
.CODE  
   MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        MOV AH,0X0F
        MOV AL,'*'
        
        CALL DISPLAY
        
.EXIT       
   MAIN ENDP
   DISPLAY PROC
    PUSH BP
    MOV BP,SP
        
        MOV WORD PTR ES:[0],AX
        MOV WORD PTR ES:[80],AX
        MOV WORD PTR ES:[158],AX 
        
        MOV WORD PTR ES:[1920],AX
        MOV WORD PTR ES:[2000],AX
        MOV WORD PTR ES:[2078],AX
        
        MOV WORD PTR ES:[3840],AX
        MOV WORD PTR ES:[3920],AX
        MOV WORD PTR ES:[3998],AX
        
    POP BP
    MOV SP,BP
    SUB SP,2
    RET
   DISPLAY ENDP 