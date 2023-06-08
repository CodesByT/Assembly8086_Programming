.MODEL SMALL



.DATA
        arr1 dd 11114566h , 6A8B67E6h ,0x2A9B47F4h
        arr2 dd 11116544h , 64356AE6h ,0xF43D658Ch
        size dw 3
        count dw 0
        arr3 dd 3 DUP ?
.CODE
        MOV bX,@DATA
        MOV DS,bX
        mov cx,[size]
        mov bx,0              
        
START:  
        add bx,2
        mov ax,[arr1+bx]
        mov dx,[arr2+bx]
        CMP ax,dx
        JG LowBitsCheck
        
        CMP ax,dx
        JE SecondCondition
        
        mov [count],bx
        sub [count],2
        mov si,[count]
        mov dx,[arr2+si]
        mov [arr3+si],dx
        add [count],2
        add si,2
        mov dx,[arr2+si]
        mov [arr3+si],dx        
        add bx,2
        Loop START
        JMP GETOUT
LowBitsCheck:
        mov [count],bx
        sub [count],2
        mov si,[count]
        mov dx,[arr1+si]
        mov [arr3+si],dx
        add [count],2
        add si,2
        mov dx,[arr1+si]
        mov [arr3+si],dx        
        add bx,2
        Loop START
        JMP GETOUT
SecondCondition:        
        SUB bx,2
        mov ax,[arr1+bx]
        mov dx,[arr2+bx]
        CMP ax,dx
        JG  HigherBitsCheck  
        
        mov si,[count]
        mov dx,[arr2+si]
        mov [arr3+si],dx
        add [count],2
        add si,2
        mov dx,[arr2+si]
        mov [arr3+si],dx
        add bx,4
        Loop Start 
        JMP GETOUT
                  
HigherBitsCheck:
        mov si,[count]
        mov dx,[arr1+si]
        mov [arr3+si],dx
        add [count],2
        add si,2
        mov dx,[arr1+si]
        mov [arr3+si],dx
        add bx,4
        Loop Start
        JMP GETOUT
GETOUT:
.EXIT