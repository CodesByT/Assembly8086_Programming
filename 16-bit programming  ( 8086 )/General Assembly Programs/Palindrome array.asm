.MODEL SMALL
                    
.DATA
       Arr dw 89h,60h,22h,22h,60h,89h
       size dw 6
       size1 dw 6
       status dw ?

.CODE
       mov bx,@data
       mov ds,bx
          
       mov cx,[size]
       mov si, cx
          
       SHR cx,1
       
       SHR si, 1
       sub si, 2
       mov bx,0
                     
Label: 
       mov ax,[Arr+si]       
       CMP ax,[Arr+bx]
       JNE Notpalindrome
       add bx, 2
       sub si, 2       
       Loop Label 
       
       mov [status],1      
       jmp Getout              
Notpalindrome:
       mov [status],0      
       
Getout:
       
.EXIT