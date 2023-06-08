.MODEL SMALL
 
 ; shifthing the array elements in a subroutine

    
.STACK 0X100      
.DATA
   ARR DW 0X7358,0X6C43,0X1DF1,0XA858,0X5E9B
   SIZE DW 5
.CODE
MAIN PROC
   MOV BX,@DATA
   MOV DS,BX  
   CALL FUNCTION
.EXIT 
MAIN ENDP           
FUNCTION PROC
MOV BP,SP   
   MOV AX,[ARR]
   SHL AX,2
   MOV [ARR],AX   
   MOV AX,[ARR+6]
   SHL AX,2
   MOV [ARR+6],AX   
   MOV CX,[SIZE]
   MOV BX,0   
LABEL:
   MOV AX,[ARR+BX] 
   PUSH AX
   ADD BX,2
   LOOP LABEL      
MOV SP,BP
RET    
FUNCTION ENDP  
