.MODEL SMALL
.DATA
      
       Arr1   dw 0X6AE5h,0X86E4h,0X3EA4h,0XE3BEh,0X3CDEh,0XE23Eh,0XF4E3h,0XFFFFh,0XB3CDh,0X01EFh
       size   dw 10
       
.CODE
        mov dx,@data
        mov ds,dx
        mov cx,[size]
        mov bx,0         
        mov dx,0xFFFF
Start:        
        mov ax,[Arr1+bx]
        CMP ax,dx 
        JE NumberFound
        
        add bx,2
        mov ax,0x0000
        Loop Start 
        JMP NumberNotFound
                     
NumberNotFound:
        mov ax,8888h
        JMP GETOUT  
        
NumberFound:
        mov ax,0x0001        
GETOUT:
.EXIT