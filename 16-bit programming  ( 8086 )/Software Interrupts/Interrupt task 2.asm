
;   Write a code that prints a number stored in a 16-bit variable on screen in a hexadecimal radix.

.MODEL SMALL
ORG 0X100
.DATA
        VAR DW 0XABCD
        ARR DB 4 DUP (?)
.CODE           
        MOV BX,@DATA
        MOV DS,BX
        
        MOV SI,0
        MOV AX,[VAR]
        MOV BX,1000H
        MOV DI,10H
        MOV CX,4
LABEL:  
        DIV BX
        CMP AX,9H
        JAE L1
        ADD AX,30H        
        JMP L2
    L1: 
        ADD AX,37H
    L2:
        MOV [ARR+SI],AL        
        INC SI
        XCHG DX,AX
        MUL DI
        LOOP LABEL
        
        MOV AH,0X2
        MOV SI,0
        MOV CX,4 
LABEL2:        
        MOV DL,[ARR+SI]
        INT 0X21
        INC SI
        LOOP LABEL2
                
        
.EXIT