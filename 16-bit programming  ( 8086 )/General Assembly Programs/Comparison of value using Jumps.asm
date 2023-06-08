.MODEL SMALL


.DATA
     num1    dd 0x11111111
     num2    dd 0x11111111
     greater dd ?

.CODE
     mov bx,@data
     mov ds,bx
     
     
     mov ax,[num1]
     mov bx,[num1+2]     
     mov cx,[num2]
     mov dx,[num2+2]
     
     CMP bx,dx 
     
; IF FIRST NUMBER IS GREATER THEN JUMP    
     JG L1
; IF SECOND NUMBER IS GREATER     
     mov ax,[num2]
     mov [greater],ax 
     mov ax,[num2+2]
     mov [greater+2],ax  
     
; IF HIGHER BITS ARE EQUAL THEN WE CHECK LOWER BITS FOR GREATER NUMBER     
     mov ax,[num1]
     mov bx,[num1+2]     
     mov cx,[num2]
     mov dx,[num2+2]
     
     CMP bx,dx  
; IF HIGHER BITS ARE EQUAL AND LOWER BITS OF FIRST NUMBER IS GREATER         
     JE L2  
; IF HIGHER BITS ARE EQUAL AND LOWER BITS OF SECOND NUMBER IS GREATER 
     mov ax,[num2]
     mov [greater],ax 
     mov ax,[num2+2]
     mov [greater+2],ax 
     
L1:
;   [ Result on the bases of higher bits ]   
     mov ax,[num1]
     mov [greater],ax 
     mov ax,[num1+2]
     mov [greater+2],ax     
     JMP exit     
L2:  
;   [ Result When higher bits are equal and lower are different ]
     mov ax,[num1]
     mov [greater],ax 
     mov ax,[num1+2]
     mov [greater+2],ax     
     JMP exit     
     
exit:     
.EXIT