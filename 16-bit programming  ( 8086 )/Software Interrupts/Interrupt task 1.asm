
;   Write a code that inputs a 16-bit integer number in hexadecimal radix from the keyboard and stores 
;   it in a variable.

.MODEL SMALL
ORG 0X100
.DATA
        ARR DB 4 DUP (?)
        VAR DW ?
.CODE           
        MOV BX,@DATA
        MOV DS,BX
        
        XOR BX,BX
        MOV CX,4  
        MOV AH,0X1
LABEL:  
        INT 0X21
        MOV [ARR+BX],AL
        INC BX
        LOOP LABEL
        
        MOV CX,4
        MOV BX,10H
        MOV SI,0
        XOR AX,AX
        
LABEL2:
        MUL BX
        CMP [ARR+SI],39H
        JNBE L1
        SUB [ARR+SI],30H
        JMP L2
    L1:
        SUB [ARR+SI],40H
        ADD [ARR+SI],9H
    L2:        
        MOV DL,[ARR+SI]
        ADD AX,DX
        INC SI
        LOOP LABEL2
        
        MOV [VAR],AX
                
.EXIT