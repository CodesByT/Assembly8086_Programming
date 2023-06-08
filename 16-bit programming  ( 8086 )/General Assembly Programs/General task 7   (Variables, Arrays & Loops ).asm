.model small 

;    Write a program that declares and initializes the array of 10 elements,
;    then calculates the sum of 
;    them using a loop and places the result into the "SUM" variable.

.data  
     
     array dw 45h,12h,24h,78h,56h,89h,92h,42h,15h,10h,

.code          
         mov bx,@data
         mov ds,bx
         mov bx,0
         mov ax,0000h
         mov cx,10
     
pakora:  add ax,[array+bx]
         inc bx
         inc bx
         
         loop pakora
         
         

.exit