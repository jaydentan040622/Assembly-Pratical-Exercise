.MODEL SMALL
.STACK 64
.DATA
 PSW DB 8 DUP(0)
.CODE
MAIN PROC
 MOV AX,@DATA
 MOV DS,AX

 MOV SI,0
 MOV CX,8

 GETPSW:
  MOV AH,01H
  INT 21H
  MOV PSW[SI],AL
  INC SI
  LOOP GETPSW

 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN