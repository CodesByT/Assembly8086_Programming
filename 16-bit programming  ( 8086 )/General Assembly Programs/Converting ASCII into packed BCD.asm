.model small
.data   
        A db '87638362746353637287'
        BCD db 0,0,0,0,0,0,0,0,0,0
.code
        mov bx,@data
        mov ds,bx
        
        mov bx,0
        mov si,0
        mov cx,10
l:                    
        mov al,[A+bx]  ; will store the ASCII value of one character 
        sub al,0x30
        ror al,4
        Add [BCD+si],al
        inc bx
        mov al,[A+bx]
        sub al,0x30
        Add [BCD+si],al
        inc bx
        inc si
        loop l
        
        .exit