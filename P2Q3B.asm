.MODEL SMALL
.STACK 64
.DATA
 CHAR DB ?
 PROMPT DB "ENTER AN LOWERCASE LETTER: $"
 RESULT DB 13,10,"THE UPPERCASE LETTER IS: $"
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 
 ;--OUTPUT STRING:09H(PROMPT)
 MOV AH,09H 
 LEA DX,PROMPT 
 INT 21H

 ;--INPUT BYTE:01H
 MOV AH,01H 
 INT 21H 

 ;--MOVE INPUT (AL) TO CHAR
 MOV CHAR,AL
 

 ;--CONVERT UCASE TO LCASE
 SUB CHAR,20H
 

 ;--OUTPUT STRING:09H(RESULT)
 MOV AH,09H 
 LEA DX,RESULT
 INT 21H

 ;--OUTPUT STRING:02H(CHAR)
 MOV AH,02H 
 MOV DL,CHAR 
 INT 21H

 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN