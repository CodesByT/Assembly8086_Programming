.MODEL SMALL  
.STACK 100H
.DATA     
        ROW     DB 13
        COLUMN  DB 40
.CODE  
   MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX

        XOR BX,BX
        MOV AL,[ROW]          ; COLUMN    ADDRESS     
        MOV BL,[COLUMN]       ; ROW       ADDRESS   
        CALL OFFSETCALCULATION
        CALL DISPLAYING
.EXIT       
   MAIN ENDP
;-------------------------------------
   OFFSETCALCULATION PROC
    PUSH BP
    MOV BP,SP
    
       MOV DL,80
       MUL DL
       MOV DL,2
       MUL DX
       MOV DI,AX
       
       XOR AH,AH
       MOV AL,BL
       MOV BL,2
       MUL BX
       
       ADD AX,DI
       MOV BX,AX
           
    POP BP
    MOV SP,BP
    SUB SP,2
    RET
   OFFSETCALCULATION ENDP
;-------------------------------------   
   DISPLAYING PROC
    PUSH BP
    MOV BP,SP
       
       MOV AH,0X0F
       MOV ES:[BX],'*'
    
    POP BP
    MOV SP,BP
    SUB SP,2
    RET
   DISPLAYING ENDP 