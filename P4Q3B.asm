.MODEL SMALL
.STACK 64
.DATA
 MSG1 DB "QUANTITY (UNIT): $"
 MSG2 DB 13,10,"UNIT PRICE (RM): $"
 MSG3 DB 0DH,0AH,"TOTAL AMOUNT IS RM$"
 QTY DB 0
 PRI DB 0
 TTL DB 0
 TEN DB 10
 Q DB 0
 R DB 0
 IMSG DB 13,10,"INVALID INPUT! ENTER DIGIT ONLY $"
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

 ;--MOVE USER INPUT(AL) TO QTY
 MOV QTY,AL

 GETPRICE:
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

 CMP PRI,'0'
 JB ERROR 
 CMP PRI,'9'
 JBE CALC 
 JA ERROR

 ERROR:
  MOV AH,09H
  LEA DX, IMSG
  INT 21H
  JMP GETPRICE

 CALC:
    ;------------------------------
 ;--CALCULATION
 ;--1)CLEAR AX
 MOV AX,0
 ;--2)CONVERT HEX TO DEC:QTY,PRI
 SUB QTY,30H
 SUB PRI,30H
 ;--3)MOVE MULTIPLICAND(QTY) TO AL
 MOV AL,QTY
 ;--4) MULTIPLY BY MULTIPLIER(PRI)
 MUL PRI 
 ;--5)MOVE RESULT(AL) TO TTL
 MOV TTL,AL
 ;--6)CLEAR AX
 MOV AX,0
 ;--7)MOVE DIVIDEND(TTL) TO AL
 MOV AL,TTL
 ;--8)DIVIDED BY DIVISOR(TEN)
 DIV TEN
 ;--9)MOVE QUOTIENT(AL) TO Q , MOVE REMAINDER (AH) TO R
 MOV Q,AL
 MOV R,AH
 ;--10)CONVERT DEC TO HEX: Q,R
 ADD Q,30H
 ADD R,30H

 

 ;------------------------------
 ;--OUTPUT STRING:09H(MSG3)
 MOV AH,09H
 LEA DX,MSG3
 INT 21H

  ;--OUTPUT BYTE:02H(Q)
 MOV AH,02H
 MOV DL,Q
 INT 21H

 ;--OUTPUT BYTE:02H(R)
 MOV AH,02H
 MOV DL,R
 INT 21H


 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN
 
