.MODEL SMALL
.DATA   
.CODE   
   MAIN PROC    
       MOV BX,@DATA
       MOV DS,BX
       MOV BX,0XB800
       MOV ES,BX
       CALL PROCEDURE  
.EXIT       
   MAIN ENDP
   PROCEDURE PROC
   PUSH BP
   MOV BP,SP
   PUSH CX
   PUSH BX
   PUSH DI
   PUSH AX
        MOV AH,0x0F  
        XOR BX,BX
        MOV CX,10    
        XOR DI,DI
OUTERLOOP:
        MOV SI,0
        MOV AL,' '
        MOV BX,DI
   INNERLOOP1:
        MOV WORD PTR ES:[BX],AX
        ADD BX,2
        INC SI
        CMP SI,CX
        JNE INNERLOOP1
        DEC SI
   INNERLOOP2:
        MOV AL,'*'
        MOV WORD PTR ES:[BX],AX
        ADD BX,2
        MOV AL,' '
        MOV WORD PTR ES:[BX],AX
        ADD BX,2
        INC SI
        CMP SI,10
        JNE INNERLOOP2
        
        ADD DI,160
        LOOP OUTERLOOP
   
   POP AX
   POP DI
   POP BX
   POP CX
   POP BP
   MOV SP,BP
   SUB SP,2
   RET
    PROCEDURE ENDP   