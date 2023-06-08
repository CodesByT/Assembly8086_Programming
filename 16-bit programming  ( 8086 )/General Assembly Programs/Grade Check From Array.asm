.MODEL SMALL 
        
.DATA
      arr dw 0x100,0x45,0x68,0x80,0x20    
      size dw 5
      act dw 0
      bct dw 0
      fct dw 0    
.CODE 
      
      mov bx,@data
      mov ds,bx
      xor bx,bx 
      mov cx,[size]
label:      
      mov ax,[arr+bx]
      cmp ax,0x50
      jbe belowfifty
      
      cmp ax,0x75
      jbe belowseventyfive
      
      cmp ax,0x100
      jbe belowhundred
      
belowfifty:
      add [fct],1
      add bx,2     
      loop label 
      jmp getout
belowseventyfive:
      add [bct],1
      add bx,2
      loop label
      
      jmp getout
belowhundred:
      add [act],1
      add bx,2
      loop label
      jmp getout
 
getout:
.EXIT