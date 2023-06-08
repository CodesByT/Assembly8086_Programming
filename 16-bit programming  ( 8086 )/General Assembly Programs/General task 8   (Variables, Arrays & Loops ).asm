.model small
           
;   Write a program that declares and initializes two word-type arrays:A and B, each of which has 20 
;   elements. The program then adds the corresponding elements of these two arrays and stores the 
;   result in the third array: C           
           
.data
        A dw 12h,45h,94h,77h,76h,41h,54h,584h,1h,78h,96h,32h,5h,91h,566h,84h,36h,44h,33h,38h       
        
        B dw 12h,45h,78h,96h,32h,5h,91h,54h,584h,1h,566h,94h,77h,44h,33h,84h,36h,38h,76h,41h  
        
        C dw 20 dup 0
.code
        mov bx,@data
        mov ds,bx
        
        mov bx,0
        mov cx,20
        mov ax,0
        mov dx,0
        
label:  add ax,[A+bx]
        add dx,[B+bx]
        inc bx
        inc bx
        add ax,dx
        add [C+bx],ax
        
        loop label
        
        
        
                
.exit