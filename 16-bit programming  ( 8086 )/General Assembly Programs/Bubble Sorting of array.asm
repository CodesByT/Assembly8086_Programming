.MODEL SMALL.


.DATA
     
     arr dw 12h,89h,23h,96h,23h,75h,16h,22h,31h,10h     
     swap db 0
.CODE
     
        mov bx,@data
        mov ds,bx
START:
        mov bx,0
        mov byte ptr [swap],0
LOOP1:          
        mov ax,[arr+bx]
        cmp ax,[arr+bx+2]
        JBE NOSWAPPING
        
        mov dx,[arr+bx+2]
        mov [arr+bx+2],ax
        mov word ptr [arr+bx],dx
        
        mov byte ptr [swap],1

NOSWAPPING:
        add bx,2
        cmp bx,18       
        JNE LOOP1
        CMP byte ptr [swap],1
        JE  START
        
.EXIT