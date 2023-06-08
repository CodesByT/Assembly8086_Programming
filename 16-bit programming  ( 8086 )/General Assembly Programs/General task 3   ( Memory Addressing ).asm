
;   Write a program that stores the following numbers into the current data segment at offset: 0x1000 
;   onwards. The program then calculates the sum of these numbers and stores it at the physical 
;   location: 0xCD1F3.
;   Numbers: 0x1F00, 0xA0B1, 0x1254, 0x34EF, 0x8700

ORG 100


ADD AX,[NUM1]

ADD AX,[NUM1+2]

ADD AX,[NUM1+4]

ADD AX,[NUM1+6]

ADD AX,[NUM1+8]

MOV CX,0XCD1F
MOV DS,CX

MOV BX,0X0003
MOV [BX],AX



                                              
INT 0X21

NUM1:DW 0X1F00 
     DW 0XA0B1
     DW 0X1254
     DW 0X34EF
     DW 0X8700