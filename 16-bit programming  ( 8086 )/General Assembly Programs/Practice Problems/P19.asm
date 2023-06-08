.MODEL SMALL



.DATA
      
       Arr1   dw 0X6AE5,0X86E4,0X3EA4,0XE3BE,0X3CDE,0XEE84,0XE23E,0XF4E3,0XB3CD,0X01EF
       Arr2   dw 0X3CDE,0XEE84,0XE23E,0XF4E3,0XB3CD,0X01EF,0X6AE5,0X86E4,0X3EA4,0XE3BE
       size   dw 10
       MinArr dw 10 DUP ? 
       MaxArr dw 10 DUP ?
       
.CODE
        mov dx,@data
        mov ds,dx
        mov cx,[size]
        mov bx,0
       
Start:  mov ax,[Arr1+bx]
        mov dx,[Arr2+bx]
        CMP ax,dx
        JG Greater
        
        mov [MinArr+bx],dx 
        mov [MaxArr+bx],0
        add bx,2
        Loop Start
        JMP GETOUT
        
Greater:        
        mov [MaxArr+bx],ax
        mov [MinArr+bx],0
        add bx,2
        Loop Start
        JMP GETOUT


GETOUT:
.EXIT