.MODEL SMALL
.STACK 64
.DATA
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 ;--OUTPUT BYTE:02H(SMILEY=01H)
 MOV AH,02H
 MOV DL,01H
 INT 21H
 ;--OUTPUT BYTE:02H(COMMA=2CH/",")
 MOV AH,02H
 MOV DL,2CH
 INT 21H
 ;--OUTPUT BYTE:02H(LOVE=03H)
 MOV AH,02H
 MOV DL,03H
 INT 21H


 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN