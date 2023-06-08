.MODEL SMALL  
.STACK 100H
.DATA     

.CODE  
   MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        MOV AL,0X0F
        MOV AH,'*'
        XOR BX,BX
               
        CALL TRASNSITION
.EXIT       
   MAIN ENDP
;-------------------------------------
   TRASNSITION PROC
    MOV SI,24
    
OUTERLOOP:    
    MOV CX,79
    MOV WORD PTR ES:[BX],AX 
LABEL:
    ADD BX,2
    MOV WORD PTS ES:[BX-2],0X0000 
    MOV WORD PTR ES:[BX],AX
    LOOP LABEL
    ADD BX,2
    CMP SI,0
    JE GETOUT
    DEC SI
    JMP OUTERLOOP
    
GETOUT:
    RET
   TRASNSITION ENDP
