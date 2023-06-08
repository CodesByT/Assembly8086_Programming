.MODEL SMALL
; READ 10 CHARACTERS FROM KEYBOARD TILL USER INPUT ENTER
.DATA
        ARR DB 10 DUP (0)
        COUNT DW 10
.CODE
        MOV BX,@DATA
        MOV DS,BX
        XOR AX,AX
        XOR BX,BX
        MOV CX,10
LABEL:  
        MOV AH,0X1
        INT 0X21
        CMP AL,13
        JE OOUT
        MOV [ARR+BX],AL
        INC BX
        LOOP LABEL    
        
       OOUT: 
        SUB [COUNT],CX
.EXIT