.MODEL SMALL
.DATA
        CHAR DB 'A'
        SPACE DB ' '
.CODE      
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        MOV BX,1
        MOV AH,0X02
        MOV CX,0X07D0
        
L:      
        MOV BYTE PTR ES:[BX],AH     
        INC BX
        MOV Al,[CHAR]
        MOV BYTE PTR ES:[BX],AL
        INC BX
        MOV BYTE PTR ES:[BX],AH     
        INC BX
        MOV Al,[space]
        MOV BYTE PTR ES:[BX],AL
        INC BX
        LOOP L
.EXIT       