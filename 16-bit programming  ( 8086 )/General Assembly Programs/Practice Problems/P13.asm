.MODEL SMALL  


.DATA     
       W    DW 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h, 100h
       SIZE DW 10 
.CODE     
       
        MOV BX,@DATA
        MOV DS,BX
       
        MOV CX,[SIZE]
        MOV BX,0H
        MOV AX,0H
        
LABEL:  
        ADD AX,[W+BX]
        INC BX
        INC BX
        LOOP LABEL      
         

                                 
.EXIT