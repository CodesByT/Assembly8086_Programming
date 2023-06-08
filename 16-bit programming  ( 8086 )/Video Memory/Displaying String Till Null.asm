.MODEL SMALL
.DATA
        STR DB '  Hello World This is me TAYYAB Your DAD   ',0
.CODE
    MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        XOR BX,BX
        MOV AH,0X74
        mov si,0
        CALL DISPLAY
.EXIT
    MAIN ENDP
                                                                                                                                                             
    DISPLAY PROC
  L:    
        CMP [STR+BX],0
        JE OOUT
        MOV AL,[STR+BX]
        MOV WORD PTR ES:[SI],AX
        ADD SI,2
        INC BX        
        JMP L
       
  OOUT: 
        RET
    DISPLAY ENDP    