
;   Taking input in an array using interrupts

.MODEL SMALL
.DATA
        ARR    DB 0,0,0,0
        COUNT  DW 4
        NUMBER DW ?
.CODE   
   MAIN PROC 
        MOV BX,@DATA
        MOV DS,BX
        XOR BX,BX
        MOV CX,[COUNT]
        
        CALL TAKINGINPUT
        CALL NUMBERSTORE    
.EXIT 
;----------------------------------------------        
 
    MAIN ENDP
    TAKINGINPUT PROC    
    PUSH BP
    MOV BP,SP
LABEL:        
        MOV AH,0X1
        INT 0X21
        MOV [ARR+BX],AL
        INC BX
        CMP AL,13
        JE OOUT
        LOOP LABEL
   OOUT:
        SUB [COUNT],CX
        MOV CX,[COUNT]
        MOV BX,10H
        XOR AX,AX
        XOR SI,SI
     POP BP
     MOV SP,BP
     SUB SP,2
     RET   
    TAKINGINPUT ENDP           
;----------------------------------------------    
    NUMBERSTORE PROC
    PUSH BP
    MOV BP,SP
LABEL2:
        MUL BX
        MOV DL,[ARR+SI]
        SUB DL,30H        
        ADD AX,DX
        INC SI
        LOOP LABEL2
        
    OOOUT:    
        MOV [NUMBER],AX
     POP BP
     MOV SP,BP
     SUB SP,2
     RET           
    NUMBERSTORE ENDP 