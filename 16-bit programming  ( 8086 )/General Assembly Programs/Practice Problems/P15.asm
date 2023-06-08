.MODEL SMALL  


.DATA     
       ARR DW 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h, 100h,10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h, 100h,10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h, 100h

.CODE         
       MOV BX,@DATA
       MOV DS,BX
                  
       MOV AX,9
       MOV BX,2
       MUL BX
       MOV BX,AX
                   
       MOV CX,[ARR+BX]
       
       MOV AX,24
       MOV BX,2
       MUL BX
       MOV BX,AX
       
       XCHG [ARR+bx],CX 
        
LABEL:  
                                 
.EXIT