








.model small
.data
        arr db 0x1,0x2,0x3,0x4
.code
        mov bl,[arr+2]
        
        mov [arr+1],[arr+2]
        mov [arr+2],al
        
.exit        
