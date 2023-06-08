.MODEL SMALL

.DATA     
       A DW 0X1234
       B DW 0X4321
       C DW 0X5678
       D DW 0X9876 
.CODE
     MOV BX,@DATA
     MOV DS,BX
      
; A = B - A  
     MOV AX,[A]
     MOV BX,[B]
     SUB AX,BX
     MOV [A],AX
; A = C - (A + 1)    
     MOV AX,[A]
     INC AX
     MOV CX,[C]
     SUB AX,CX
     MOV [A],AX

; C = A + B  
     MOV AX,[A]
     MOV BX,[B]
     ADD AX,BX
     ADD [C],AX
     
; B = 3 – B + 7
     ADD [B],7
     ADD AX,3
     SUB AX,[B]
     MOV [B],AX

; A = B – A – 1 
     MOV AX,[A]
     SUB [B],AX
     SUB [B],1
     MOV AX,[B]
     MOV [A],AX

; A ? B and B ? C 
     MOV  AX,[A]
     XCHG AX,[B]
     
     MOV  AX,[B]
     XCHG [C],AX    

; A = A + B + CF
     MOV AX,[B]
     ADC [A],AX

; C = C – A – CF
     MOV AX,[A]
     SUB [C],AX
     
.EXIT