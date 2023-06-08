.model small 

;    Operation in memory without using any jump or loop commands

.data

.code
       mov bx,@data
       mov ds,bx
       
       mov word ptr DS:[0x1000],0x21E1
       mov word ptr DS:[0x1000+2],0xEA9C
       mov word ptr DS:[0x1000+4],0xFF0E
       mov word ptr DS:[0x1000+6],0x3014
       
       mov word ptr DS:[0x1008],0xFEFC
       mov word ptr DS:[0x1008+2],0x6732
       mov word ptr DS:[0x1008+4],0xABBE
       mov word ptr DS:[0x1008+6],0x1254
       
       mov ax,word ptr DS:[0x1000]
       mov dx,word ptr DS:[0x1008]
       add ax,dx
       mov word ptr DS:[0x1010],ax
                                  
       mov ax,word ptr DS:[0x1000+2]
       mov dx,word ptr DS:[0x1008+2]
       add ax,dx
       mov word ptr DS:[0x1010+2],ax
       
       mov ax,word ptr DS:[0x1000+4]
       mov dx,word ptr DS:[0x1008+4]
       add ax,dx
       mov word ptr DS:[0x0707],ax    
       
       mov ax,word ptr DS:[0x1000+6]
       mov dx,word ptr DS:[0x1008+6]
       add ax,dx
       mov word ptr DS:[0x0707+2],ax                       
      
.exit