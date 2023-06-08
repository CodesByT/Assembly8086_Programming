            
;   Write a program that stores the given two 64-bit numbers into the current data segment at offset: 
;   0x1000 and 0x1008, respectively. The program then calculates the sum of these numbers and 
;   stores it at the offset: 0x1010.
            

.model small
.data

  NUM1  DD 0X1F540398
  NUM2  DD 0xC0A1F02E 
  RES   DD 0X00   


.code 

MOV BX,@DATA 
MOV DS,BX
 

MOV AX,[NUM1]
MOV BX,[NUM2] 
MOV AX,BX     
ADD WORD PTR DS:[0x1000],AX 


MOV BX,[NUM1+2]  
MOV CX,[NUM2+2] 
ADC BX,CX
MOV WORD PTR DS:[0X1008],BX 


MOV WORD PTR DS:[0X1010],BX 
MOV WORD PTR DS:[0X1010+2],AX
 
  

.exit