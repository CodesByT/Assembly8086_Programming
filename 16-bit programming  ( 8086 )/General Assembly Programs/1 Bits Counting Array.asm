.MODEL SMALL
                    
.DATA    
       Arr dw 0x6758,0x8237,0xAAAA,0x9872,0x2EFF
       counter dw 5 DUP ? 

.CODE
       mov bx,@data
       mov ds,bx
       mov bx,0

NxtNum:
       
       mov ax,[Arr+bx]
       mov cx,16  
       
Start: SHl ax,1
       
       JC OneFound    
       
       Loop Start
       Loop Getout
       
OneFound:
       Add [counter],1        
       Loop Start
Getout:       
.EXIT