.MODEL SMALL
.STACK 64
.DATA
 CHAR1 DB "X"
 CHAR2 DB "Y"
 ORIGINAL DB "Original value: $"
 MSG1 DB "CHAR1: $"
 MSG2 DB "CHAR2: $"
 EXCHANGE DB "After exchange: $"
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 
 ;--OUTPUT STRING:09H(ORIGINAL)
 MOV AH,09H 
 LEA DX,ORIGINAL
 INT 21H

 ;--NEWLINE
 MOV AH,02H 
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 ;--OUTPUT STRING:09H(MSG1)
 MOV AH,09H 
 LEA DX,MSG1
 INT 21H

 ;--OUTPUT BYTE:02H(CHAR1)
 MOV AH,02H 
 MOV DL,CHAR1
 INT 21H

 ;--NEWLINE
 MOV AH,02H 
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 ;--OUTPUT STRING:09H(MSG2)
 MOV AH,09H 
 LEA DX,MSG2
 INT 21H

 ;--OUTPUT BYTE:02H(CHAR2)
 MOV AH,02H 
 MOV DL,CHAR2
 INT 21H

  ;--NEWLINE
 MOV AH,02H 
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H
 ;---------------------------


 MOV AL,CHAR1
 XCHG AL,CHAR2
 MOV CHAR1,AL

 ;--OUTPUT STRING:09H(EXCHANGE)
 MOV AH,09H 
 LEA DX,EXCHANGE
 INT 21H

 ;--NEWLINE
 MOV AH,02H 
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 ;--OUTPUT STRING:09H(MSG1)
 MOV AH,09H 
 LEA DX,MSG1
 INT 21H

 ;--OUTPUT BYTE:02H(CHAR1)
 MOV AH,02H 
 MOV DL,CHAR1
 INT 21H

 ;--NEWLINE
 MOV AH,02H 
 MOV DL,0DH
 INT 21H
 MOV DL,0AH
 INT 21H

 ;--OUTPUT STRING:09H(MSG2)
 MOV AH,09H 
 LEA DX,MSG2
 INT 21H

 ;--OUTPUT BYTE:02H(CHAR2)
 MOV AH,02H 
 MOV DL,CHAR2
 INT 21H

 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN