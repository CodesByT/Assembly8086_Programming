.MODEL SMALL  


.DATA     
       ARR  DW 7 DUP <45H>
       SIZE DW 7
       SUM  DW ? 
.CODE         
       MOV BX,@DATA
       MOV DS,BX
       
       SUB 20H,[ARR]
       SUB 6H,[ARR+14]
       
       MOV AX,[ARR]
       ADD AX,[ARR+14]
       MOV [SUM],AX
        
LABEL:  
                                 
.EXIT