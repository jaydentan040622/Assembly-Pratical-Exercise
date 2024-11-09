.MODEL small
.STACK 64
.DATA

DIGIT1 DB 0
DIGIT2 DB 0
DIGIT DB 0
TEN DB 10 

Q1 DB 0
Q2 DB 0

RESULT1 DB 0         ; To store the result
RESULT2 DB 0         ; To store the result   

.CODE
MAIN PROC
    MOV AX, @DATA   ; Initialize DS
    MOV DS, AX

    MOV AH,01H ; INPUT "5"
    INT 21H   

    MOV DIGIT1,AL ; DIGIT1 = 35H = "5"

    MOV AH,01H ;INPUT 2
    INT 21H

    MOV DIGIT2,AL ;DIGIT2 = 32H = "2"

    SUB DIGIT1,30H ;DIGIT1 - 30H = 5H/2D 
    SUB DIGIT2,30H ;DIGIT2 -30H = 2H/2D


    MOV AL,DIGIT1 ; AL = 5H/5D
    MUL TEN  ;AX = 0050 00 =ah 50=al

    MOV DIGIT,AL ; NOW DIGIT = 50
    
    MOV AX,0 ;CLEAR AX

    MOV AL,DIGIT
    DIV TEN ;62 DIV TEN = QUOTIENT = 6 REMAINDER = 2 


    MOV Q1,AL
    MOV Q2,AH
    
    ADD Q1,30H
    ADD Q2,30H

    MOV AL,Q1
    MOV AL,Q2
    
    MOV RESULT1,Q1
    MOV RESULT2,Q2
    
    MOV AL,02H
    MOV DL,RESULT1
    INT 21H

    MOV AL,02H
    MOV DL,RESULT2
    INT 21H

        MOV AH,4CH
        INT 21H
MAIN ENDP
 END MAIN