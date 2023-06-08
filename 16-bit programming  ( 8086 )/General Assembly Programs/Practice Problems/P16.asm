.MODEL SMALL
.DATA
      ARR DW 0X10,0X20,0X30,0X40
      SIZE DW 4
.CODE
      MOV BX,@DATA
      MOV DS,BX
      
      DEC SIZE
      MOV AX,[SIZE]
      MOV BX,2
      MUL BX
      MOV BX,AX  
      
      MOV AX,[ARR]
      MOV DX,[ARR+BX]
      MOV [ARR+BX],AX
      MOV [ARR],DX

.EXIT