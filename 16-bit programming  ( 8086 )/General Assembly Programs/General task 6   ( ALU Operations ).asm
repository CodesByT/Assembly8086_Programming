.model small    

  ; Perform any ALU operation that sets CF and OF at the same time.
  
.data   

.code    
       
       MOV AX,0XEEEE
       MOV BX,0XEEEE
       ADD AX,BX
       
.exit