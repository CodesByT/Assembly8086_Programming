.MODEL SMALL 
;Write a code to check whether that number stored in AX is odd. If AX is odd then shift DL 4 
;bits to the left.

.DATA 
    A DW 0X76A1
    B DB 0XAA
    ANS DB 0
    
.CODE
    MOV BX,@DATA
    MOV DS,BX
    CALL FUNCTION
.EXIT    
   
FUNCTION PROC
   
   MOV AX,[A]
   SHR AX,1
   JC ODD
   MOV [ANS],0
   RET
ODD:
   MOV BL,[B]
   SHL BX,4
   MOV [ANS],1   
             
RET             
FUNCTION ENDP            