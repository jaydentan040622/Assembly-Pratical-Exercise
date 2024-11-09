.MODEL SMALL
.STACK 64
.DATA
 NUM DB 1,2,3,4,5
 MSG1 DB "SUM: $"
 MSG2 DB 13,10,"AVE: $"
 TTL DB 0
 TEN DB 10
 Q1 DB 0
 R1 DB 0
 FIV DB 5
 Q2 DB 0
 R2 DB 0

 AVG DB 0
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 
 ;-CALCULATION
 MOV AX,0
 
 MOV CX,5
 MOV SI,0
 SUM:
  ADD AL,NUM[SI]
  INC SI
  LOOP SUM

 MOV TTL,AL


 MOV AX,0
 MOV AL,TTL 
 DIV TEN
 MOV Q1,AL 
 MOV R1,AH

 MOV AX,0
 MOV AL,TTL 
 DIV FIV
 MOV Q2,AL 
 MOV R2,AH 
 
 ADD Q1,30H 
 ADD R1,30H 
 ADD Q2,30H
 ADD R2,30H 

 ;----------------------------
 ;-OUTPUT STRING:09H(MSG1)
 MOV AH,09H
 LEA DX,MSG1 
 INT 21H
 ;-OUTPUT BYTE:02H(Q1)
 MOV AH,02H
 MOV DL,Q1 
 INT 21H
 ;-OUTPUT BYTE:02H(R1)
 MOV AH,02H
 MOV DL,R1 
 INT 21H

 ;-----------------------------
 ;-OUTPUT STRING:09H(MSG2)
 MOV AH,09H
 LEA DX,MSG2
 INT 21H
 ;-OUTPUT BYTE:02H(Q2)
 MOV AH,02H
 MOV DL,Q2
 INT 21H
 ;-OUTPUT BYTE:02H('.')
 MOV AH,02H
 MOV DL, '.'
 INT 21H
 ;-OUTPUT BYTE:02H(R2)
 MOV AH,02H
 MOV DL,R2
 INT 21H

 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN
