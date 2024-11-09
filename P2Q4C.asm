.MODEL SMALL
.STACK 64
.DATA
 MSG1 DB "QUANTITY 1(UNIT): $"
 MSG2 DB 13,10,"UNIT PRICE (RM): $"
 MSG3 DB 0DH,0AH,"TOTAL AMOUNT IS RM$"
 QTY DB 0
 QTY1 DB 0
 QTY2 DB 0
 PRI DB 0
 TTL DB 0
 TEN DB 10
 Q1 DB 0
 R1 DB 0
 Q2 DB 0
 R2 DB 0
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX
 
 ;--OUTPUT STRING:09H(MSG1)
 MOV AH,09H
 LEA DX,MSG1
 INT 21H

 ;--INPUT BYTE:01H
 MOV AH,01H
 INT 21H

 ;--MOVE USER INPUT(AL) TO QTY1
 MOV QTY1,AL

  ;--INPUT BYTE:01H
 MOV AH,01H
 INT 21H

 ;--MOVE USER INPUT(AL) TO QTY2
 MOV QTY2,AL

 ;------------------------------
 ;--OUTPUT STRING:09H(MSG2)
 MOV AH,09H
 LEA DX,MSG2
 INT 21H

 ;--INPUT BYTE:01H
 MOV AH,01H
 INT 21H

 ;--MOVE USER INPUT(AL) TO PRI
 MOV PRI,AL

 ;------------------------------
 ;--CALCULATION
 ;--1)CLEAR AX
 MOV AX,0 ;AX=0

 ;--2)CONVERT HEX TO DEC:QTY1,QTY2,PRI
 SUB QTY1,30H ;QTY=1
 SUB QTY2,30H ;QTY=2
 SUB PRI,30H ;PRI= 7

 ;--3)MOVE MULTIPLICAND(QTY1) TO AL
 MOV AL,QTY1 ;AL=1

 ;--4)MULTIPLIED WITH MULTIPLIER(TEN)
 MUL TEN ;AX=AL*TEN=1*10 = 0010

 ;--5)ADD RESULT(AL) WITH QTY2
 ADD AL,QTY2 ;AL=AL+QTY2=10+5 = 15

;--6)MOVE RESULT(AL) TO QTY
 MOV QTY,AL ;QTY=15

;--7)CLEAR AX
 MOV AX,0 ;AX=0

;--8)MULTIPLICAND(QTY) TO AL
 MOV AL,QTY ;AL=15

;--9)MULTIPLIED WITH MULTIPLIER(PRI)
 MUL PRI ;AX=AL*PRI=15*7=105

;--10)MOVE RESULT (AL) TTL
 MOV TTL,AL ;TTL=105

;--11)CLEAR AX
 MOV AX,0 ;AX=0

;--12)MOVE DIVIDEND(TTL) TO AL
 MOV AL,TTL ;AL=105

;--13)DIVIDED BY DIVISOR
 DIV TEN ;AX=AL/TEN=105/10=(R)5,(Q)10

;--14)MOVE QUOTIENT (AL) TO Q1, MOVE REMAINDER (AH) TO R1
 MOV Q1,AL ;Q1=10
 MOV R1,AH ;R1=05

;--15)CLEAR AX
 MOV AX,0 ;AX=0

;--16)MOVE DIVIDEND(Q1)TO AL
 MOV AL,Q1 ;AL=10

;--17)DIVIDED BY DIVISOR(TEN)
 DIV TEN  ;AX=AL/TEN=10/10=(R)0,(Q)1

;--18)MOVE QUOTIENT(AL) TO Q2, MOVE REMAINDER(AH) TO R2
 MOV Q2,AL ;Q2=1
 MOV R2,AH ;R2=0

;--19)CONVERT DEC TO HEX:Q2,R2,R1
 ADD Q2,30H ;Q2=21H=ASCII 1
 ADD R2,30H ;R2=30H=ASCII 0
 ADD R1,30H ;R1=35H=ASCII 5



 ;------------------------------
 ;--OUTPUT STRING:09H(MSG3)
 MOV AH,09H
 LEA DX,MSG3
 INT 21H

 ;--OUTPUT BYTE:02H(Q2)
 MOV AH,02H
 MOV DL,Q2
 INT 21H

 ;--OUTPUT BYTE:02H(R2)
 MOV AH,02H
 MOV DL,R2
 INT 21H

 ;--OUTPUT BYTE:02H(R1)
 MOV AH,02H
 MOV DL,R1
 INT 21H

 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN