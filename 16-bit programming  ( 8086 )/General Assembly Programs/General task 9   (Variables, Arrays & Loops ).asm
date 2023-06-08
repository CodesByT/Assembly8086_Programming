
;       ADDING THE VALUES OF THE DOUBLE ARRAY 

.model small


.data
        array1 dd 0x45896541,0x85478541,0x96523584,0x42519137
                
        array2 dd 0x13245632,0x89641357,0x95235411,0x58452145 
        
        array3 dd 4 dup 0                                       
        
.code
        mov cx,4
        mov bx,@data
        mov ds,bx
        
        MOV BX,0
        MOV ax,0
        mov dx,0
        
label:  mov ax,[array1+bx]
        mov dx,[array2+bx]
        add ax,dx
        mov [array3+bx],ax
        inc bx
        inc bx 
        
        mov ax,[array1+bx]
        mov dx,[array2+bx]
        adc ax,dx
        mov [array3+bx],ax
        inc bx
        inc bx
        
        loop label          
        
.exit