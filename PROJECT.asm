INCLUDE "emu8086.inc"
.MODEL SMALL
.STACK 100H
.DATA
   INPUT DB ?
.CODE
 MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,1
    INT 21H
    MOV INPUT,AL
    MOV BL,0
    L1:
    MOV AH,1
    INT 21H 
 
    ADD BL,AL
    CMP AL,45
    JNE L1   
    
    PRINTN
    
    CMP INPUT,BL
    JL  L2
    JG  L3
    
    L2:
    PRINT "ENOUGH MONEY"
    JMP EXIT
         
    L3:
    SUB BL,INPUT
    ADD BL,48
    MOV AH,2
    MOV DL,BL
    INT 21H
    PRINT "SHORT"
            
    EXIT:        
    MOV AH,4CH
    INT 21H
    MAIN ENDP
 END MAIN