.MODEL SMALL
.DATA
.CODE
    MAIN PROC  
        MOV BX,@DATA
        MOV DS,BX
        XOR BX,BX
        MOV ES,BX 
        
        
        MOV WORD PTR ES:[194H],ISR65
        MOV WORD PTR ES:[196H],CS  
        
        MOV AH,0X1 
        INT 0X65 
        
        MOV DX,AX
        MOV AH,0X2 
        INT 0X65 
        
        MOV AH,0X3 
        INT 0X65 
        
              
.EXIT   
    MAIN ENDP
    ISR65 PROC  
        
        CMP AH,0X1
        JE Service01
        CMP AH,0X2
        JE Service02 
        CMP AH,0X3
        JE Service03
        JMP GETOUT
;----------------------------------------        
Service01:
        JMP START
        ARR DB 0,0,0,0
START:   
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
        MOV DI,0
        XOR AX,AX 
LABEL2: 
        MUL BX
        CMP [ARR+DI],39H 
        JNBE NOTBELOW39
        CMP [ARR+DI],29H
        JNA NOTNUMBER 
        SUB [ARR+DI],30H
        JMP PROCESS
    NOTBELOW39: 
        CMP [ARR+DI],46H 
        JNBE NOTNUMBER  
        SUB [ARR+DI],40H
        ADD [ARR+DI],9H
         
    PROCESS:
        MOV DL,[ARR+DI]
        ADD AX,DX
             
    NOTNUMBER:    
        INC DI 
        LOOP LABEL2 
        
        JMP GETOUT
;----------------------------------------
Service02:
        JMP SSTART
        ARRAY DB 4 DUP 0,0,0,0
SSTART: 
        MOV AX,DX  
        XOR DX,DX
        MOV SI,0
        MOV BX,1000H
        MOV DI,10H
        MOV CX,4
LLABEL:  
        DIV BX
        CMP AX,9H
        JAE LL1
        ADD AX,30H        
        JMP LL2
    LL1: 
        ADD AX,37H
    LL2:
        MOV [ARRAY+SI],AL        
        INC SI
        XCHG DX,AX
        MUL DI
        LOOP LLABEL
        
        MOV AH,0X2
        MOV SI,0
        MOV CX,4 
LLABEL2:        
        MOV DL,[ARRAY+SI]
        INT 0X21     
        INC SI
        LOOP LLABEL2
        JMP GETOUT 
;----------------------------------------
Service03:     
        MOV AH,0X1
        INT 0X65
        MOV DX,AX
        
        MOV AH,0X1
        INT 0X65
        ADD DX,AX
        
        MOV AH,0X2
        INT 0X65
        
         

GETOUT:                
    IRET    
    ISR65 ENDP