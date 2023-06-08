.MODEL SMALL
.DATA 
    STATE DB 0X0
.CODE
    MAIN PROC
        MOV BX,@DATA
        MOV DS,BX
        MOV BX,0XB800
        MOV ES,BX
        CALL FUNC
.EXIT   
    MAIN ENDP
    
    FUNC PROC
    PUSH BP
    MOV BP,SP
    MOV SI,780H
    MOV DI,81EH     
OUTERLOOP: 
    STATECHECK:
        CMP STATE,0X1  
        JE OUTWARD
    INWARD:
        MOV WORD PTR ES:[SI],0X0730 
        ADD SI,2
        MOV WORD PTR ES:[SI],0X0736 
        MOV WORD PTR ES:[SI-4],0X0720
         
        MOV WORD PTR ES:[DI],0X0734
        SUB DI,2
        MOV WORD PTR ES:[DI],0X0738  
        MOV WORD PTR ES:[DI+4],0X0720
        CMP DI,7D0H
        JE TRUE1 
        JMP INWARD
        TRUE1:   
            MOV [STATE],1    
            JMP STATECHECK
    OUTWARD:
        SUB SI,2    
        MOV WORD PTR ES:[SI],0X0736 
        SUB SI,2
        MOV WORD PTR ES:[SI],0X0730
        MOV WORD PTR ES:[SI+4],0X0720  
        MOV WORD PTR ES:[SI+6],0X0720    
        ADD DI,2
        MOV WORD PTR ES:[DI],0X0738
        ADD DI,2
        MOV WORD PTR ES:[DI],0X0734 
        MOV WORD PTR ES:[DI-6],0X0720          
        MOV WORD PTR ES:[DI-4],0X0720
        
        CMP DI,81CH
        JE TRUE2
        JMP OUTWARD
        TRUE2:
            MOV [STATE],0 
            MOV SI,780H
            MOV DI,81EH 
            JMP STATECHECK

      
      JMP OUTERLOOP            

    
    MOV SP,BP
    POP BP
    RET
    FUNC ENDP
	