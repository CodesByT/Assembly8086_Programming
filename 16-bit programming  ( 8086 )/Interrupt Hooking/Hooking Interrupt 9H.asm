.MODEL SMALL
ORG 0X100
.STACK 100H
.DATA   
        NUM1 DW 0X1111
        NUM2 DW 0X2222        
.CODE
MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0
        MOV ES,BX
        MOV SI,OFFSET NUM1
        MOV DI,OFFSET NUM2
        MOV WORD PTR ES:[0X24],ISR09
        MOV WORD PTR ES:[0X26],CS
        
        INT 9
        MOV AH,0X1
        INT 0X21
.EXIT        
    MAIN ENDP
 
    ISR09 PROC 
    
        JMP L
        MSG DB 'HOOKING WITH INT 9H IS DONE$'
        L:
        mov dx,offset msg
        mov ah,0X9
        int 0x21  
        
    IRET
    ISR09 ENDP