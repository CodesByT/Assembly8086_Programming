
;   Write a program that inputs two 16-bit hexadecimal numbers from the user and displays their sum 
;   on the screen

.MODEL SMALL
ORG 0X100
.STACK 100H
.DATA
        STR1 DB 'Enter First Number Please :)'
        STR2 DB 'Enter Second Number Please :)'
        STR3 DB 'Sum of these numbers is  :P'
        VAR1 DW ?
        VAR2 DW ?
        SUM  DW ?
        ARR DB 4 DUP (?)
.CODE
     MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        XOR BX,BX   
        
        MOV BX,OFFSET STR1
        PUSH BX                ;Instruction printing
        MOV BX,27
        PUSH BX
        CALL INSTRUCTIONS
        MOV BX,OFFSET ARR
        PUSH BX
        MOV BX,OFFSET VAR1      ;First Number Input
        PUSH BX
        CALL INPUT
        
        MOV BX,OFFSET STR2
        PUSH BX                ;Instruction printing
        MOV BX,28
        PUSH BX
        CALL INSTRUCTIONS
        MOV BX,OFFSET ARR
        PUSH BX
        MOV BX,OFFSET VAR2      ;Second Number Input
        PUSH BX
        CALL INPUT
        
        MOV DX,[VAR1]
        ADD DX,[VAR2]
        MOV [SUM],DX
        
        MOV BX,OFFSET STR3
        PUSH BX                ;Instruction printing
        MOV BX,26
        PUSH BX
        CALL INSTRUCTIONS
        MOV BX,OFFSET ARR
        PUSH BX
        MOV BX,OFFSET SUM       ; Duisplaying Sum
        PUSH BX
        CALL OUTPUT
         
.EXIT
     MAIN ENDP
;---------------------------------
     INSTRUCTIONS PROC
        PUSH BP
        MOV BP,SP
        
        MOV SI,[BP+6]
        MOV CX,[BP+4]
        MOV AH,0X0F
        XOR BX,BX
LA:     
        MOV AL,[SI]
        MOV WORD PTR ES:[BX],AX     
        ADD BX,2              
        INC SI
        LOOP LA
        
        MOV CX,[BP+4]
        MOV AH,0X0F
        XOR BX,BX
LA2:     
        MOV AL,' '
        MOV WORD PTR ES:[BX],AX     
        ADD BX,2              
        INC SI
        LOOP LA2
        
        MOV SP,BP
        POP BP
        RET
     INSTRUCTIONS ENDP   
;---------------------------------
     INPUT PROC
        PUSH BP
        MOV BP,SP
        MOV SI,[BP+4] ; VAR OFFSET
        MOV DI,[BP+6] ; ARR       
        MOV CX,4
        MOV AH,0X1
LABEL:  
        INT 0X21
        MOV [DI],AL
        INC DI
        LOOP LABEL
        
        MOV CX,4
        MOV DI,[BP+6]
        MOV BX,10H
        XOR AX,AX
LABEL2:
        MUL BX
        CMP [DI],39H
        JNBE L1
        SUB [DI],30H
        JMP L2
    L1:
        SUB [DI],40H
        ADD [DI],9H
    L2:        
        MOV DL,[DI]
        ADD AX,DX
        INC DI
        LOOP LABEL2
        MOV [SI],AX
        
        MOV SP,BP
        POP BP
        RET
     INPUT ENDP
;---------------------------------     
     OUTPUT PROC
        PUSH BP
        MOV BP,SP
        
        MOV SI,[BP+4]
        MOV AX,[SI]    ;Loading Number  into AX
        MOV SI, [BP+6] ;Loading Array's Address into SI
        MOV BX,1000H
        MOV DI,10H
        MOV CX,4
        XOR DX,DX
LABEL3:  
        DIV BX
        CMP AX,9H
        JAE L3
        ADD AX,30H        
        JMP L4
    L3: 
        ADD AX,37H
    L4:
        MOV [SI],AL        
        INC SI
        XCHG DX,AX
        MUL DI
        LOOP LABEL3
        
        MOV AH,0X2
        MOV SI,[BP+6]
        MOV CX,4 
LABEL4:        
        MOV DL,[SI]
        INT 0X21
        INC SI
        LOOP LABEL4
        
        MOV SP,BP
        POP BP
        RET
     OUTPUT ENDP
     
     