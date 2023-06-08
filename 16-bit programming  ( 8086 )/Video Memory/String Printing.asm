.MODEL SMALL  
.STACK 100H
.DATA     
        STRING DB 'COMPUTER ORGANIZATION AND ASSEMBLY LANGUAGE',0
.CODE  
   MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        MOV AH,0X0F
        XOR BX,BX
        
        CALL STRLENGTH
        MOV CX,BX
        XOR DI,DI
        XOR BX,BX
        CALL STRPRINT
.EXIT       
   MAIN ENDP
;-------------------------------------
   STRLENGTH PROC
    PUSH BP
    MOV BP,SP
L:  
    CMP [STRING+BX],0
    JE OUTT
    INC BX
    JMP L
  
  OUTT:       
    POP BP
    MOV SP,BP
    SUB SP,2
    RET
   STRLENGTH ENDP
;-------------------------------------   
   STRPRINT PROC
    PUSH BP
    MOV BP,SP
LL:  
    MOV AL,[STRING+BX]      
    INC BX
    MOV ES:[DI],AX
    ADD DI,2
    LOOP LL
        
    POP BP
    MOV SP,BP
    SUB SP,2
    RET
   STRPRINT ENDP 