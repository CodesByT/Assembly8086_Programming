.model small   
org 0x100
.data  
        arr db ''
.code  
        mov bx,@data
        mov ds,bx
        mov bx,0
        mov es,bx
        mov word ptr es:[40h],isr
        mov word ptr es:[40h+2h],cs

        int 0x10
        
.exit
        isr proc
        mov ax,65
        mov cx,200   
        mov bx,0xb800      
        mov si,0
        mov es,bx
        mov bx,0x10
    label: 
        mov di,ax
        ror al,4
        div bx
        mov ah,dl
        add ah,30h
        mov dl,00h
        mov byte ptr es:[si],0x07
        inc si
        mov byte ptr es:[si],ah
        inc si
        mov ax,di
        div bx  
        add ah,30h
        mov dl,00h
        mov byte ptr es:[si],0x07
        inc si
        mov byte ptr es:[si],ah
        inc si 
        mov ax,di
        mov byte ptr es:[si],0x07
        inc si
        mov byte ptr es:[si],al
        inc si
        inc al
        loop label
        iret
        isr endp