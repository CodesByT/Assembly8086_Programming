.MODEL SMALL
.DATA
        STR DB '*',0
.CODE
    MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        XOR BX,BX
        MOV AH,0X0F
        MOV AL,[STR]
        MOV cx,19
        MOV si,0X000
        MOV DI,0 
        CALL DISPLAY
.EXIT
    MAIN ENDP
    
    DISPLAY PROC
         
OUTERLOOP:
       mov dx,20
       sub dx,cx
       MOV SI,DI
       
       
   INNERLOOP:             
          CMP DX,0
          JE OOUT
          ADD AH,0X09
          AND AH,0X0F
          ADD AH,0XF0
          MOV WORD PTR ES:[SI],AX
          INC SI
          INC SI
          DEC DX
          JMP INNERLOOP
       OOUT:
        ADD DI,0XA0
        ADD SI,0xA0
        LOOP OUTERLOOP
        
        RET
    DISPLAY ENDP    