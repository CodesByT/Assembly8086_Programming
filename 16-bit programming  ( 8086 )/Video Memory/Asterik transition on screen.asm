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
        MOV CX,80
OUTERLOOP:
        DEC CX
        MOV SI,CX
        XOR BX,BX
  INNERLOOP:
        DEC SI       
        MOV WORD PTR ES:[BX],AX
        ADD BX,2
        MOV WORD PTR ES:[BX-2],0X0000
        ADD AH,CL
        MOV WORD PTR ES:[BX],AX 
        CMP SI,0
        JNE INNERLOOP
        
        JMP OUTERLOOP
    
    
GETOUT:
    RET
   TRASNSITION ENDP
