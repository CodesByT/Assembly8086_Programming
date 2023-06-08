.MODEL SMALL
;  Write a procedure to check whether that number stored in AX is negative. If AX is negative 
;  then rotate BL 2 bits to the right.          
.DATA
   A DW 0XAB90
   B DB 0XAA
   ANS DB 0
.CODE
MAIN PROC
   MOV BX,@DATA
   MOV DS,BX
   MOV BX,0000  
   CALL FUNCTION
.EXIT 
MAIN ENDP           
FUNCTION PROC
   
   MOV AX,[A]
   ADD AX,0X0000
   JS SIGNEDNUMBER
   MOV [ANS],0
   RET                      
SIGNEDNUMBER:      
   MOV BL,[B]
   SHR BL,2
   MOV [ANS],1
   
RET    
FUNCTION ENDP  
