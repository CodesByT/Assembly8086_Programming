.MODEL SMALL
; READ 10 CHARACTERS FROM KEYBOARD
.DATA
        NUMBERS DB 0
        OTHERS  DB 0
.CODE
        MOV BX,@DATA
        MOV DS,BX
        XOR AX,AX
        XOR BX,BX
        MOV CX,10
LABEL:  
        MOV AH,0X1
        INT 0X21
        CMP AL,29H
        JNA OTH
        CMP AL,40H
        JNB OTH
        INC [NUMBERS]
        LOOP LABEL
        JMP OOUT
        OTH:
        INC [OTHERS]
        LOOP LABEL
  OOUT:
        
.EXIT