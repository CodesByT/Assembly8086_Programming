
;   ~[AB]+~[AC]+~A~B~C

.MODEL SMALL
.DATA     
      A    DW 0X2
      B    DW 0X3
      C    DW 0X4
      VAR1 DW ?
      VAR2 DW ?
.CODE     
      MOV BX,@DATA
      MOV DS,BX       
;   ~[AB]      
      MOV AX,[A]
      MOV BX,[B]
      MUL BX
      NOT AX
      MOV [VAR1],AX      
;   ~[AC]  
      MOV AX,[A]
      MOV CX,[C]
      MUL CX
      NOT AX
      MOV [VAR2],AX      
;   ~[AB]+~[AC]      
      MOV AX,[VAR1]
      ADD AX,[VAR2]
      MOV [VAR1],AX      
;   ~A~B~C
      MOV AX,[A]
      NOT AX 
      MOV BX,[B]
      NOT BX      
      MOV CX,[C]
      NOT CX     
      MUL BX
      MUL CX
              
;   ~[AB]+~[AC]+~A~B~C      
      ADD AX,[VAR1]        
                                 
.EXIT