.MODEL SMALL 
        
.DATA 
      ; Array is present in Ascending Order 
      arr dw 0x10,0x20,0x30,0x40,0x50,0x60,0x70,0x80,0x90,0x100  
      size dw 10
      num dw 0x20
      flag db 0    
.CODE      
      mov bx,@data
      mov ds,bx       
      mov cx,[size]
      shr cx,1            
      mov bx,[size]
      sub bx,2      ;We get the middle increment number in bx    
      mov ax,[num]    
      cmp ax,[arr+bx] 
      ja secondHalf   
      je found
   
firstHalf:      
      sub bx,2
      mov ax,[num]
      cmp ax,[arr+bx]
      je found
      loop firstHalf
      jmp notfound
secondHalf:      
      add bx,2
      mov ax,[num]
      cmp ax,[arr+bx]
      je found
      loop secondHalf
      jmp notfound     
found:
      mov [flag],1
notfound:           
.EXIT