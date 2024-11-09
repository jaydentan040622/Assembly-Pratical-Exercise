.MODEL SMALL
.STACK 64
.DATA
    MSG1 DB "Enter a word: $"
    MSG2 DB 13,10, "The second character: $"
    MSG3 DB 13,10,"Total no. of character entered: $"
    ARRAY LABEL BYTE 
    MAX DB 10 
    ACT DB ? 
    ARRAYDATA DB 10 DUP ("$")
    MSG4 DB 13,10,"WELCOME, $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;-OUTPUT STRING :09H(MSG1) 
    MOV AH,09H 
    LEA DX,MSG1 
    INT 21H 

    ;-INPUT STRING:0AH (ARRAY) 
    MOV AH,0AH 
    LEA DX,ARRAY 
    INT 21H 

    ;---------------------------
    ;-OUTPUT STRING:09H(MSG2)
    MOV AH,09H 
    LEA DX,MSG2 
    INT 21H
    ;-OUTPUT BYTE:02H(ARRAYDATA[1])
    MOV AH,02H 
    MOV DL,ARRAYDATA[1]
    INT 21H

    ;--------------------------------
    ;-OUTPUT STRING:09H(MSG3)
    MOV AH,09H 
    LEA DX,MSG3 
    INT 21H

    ;-CONVERT DEC TO HEX:ACT 
    ADD ACT,30H

    ;-OUTPUT BYTE:02H(ACT)
    MOV AH,02H 
    MOV DL,ACT 
    INT 21H 

    MOV AH,09H 
    LEA DX,MSG4 
    INT 21H 

    MOV AH,09H 
    LEA DX,ARRAYDATA 
    INT 21H





 MOV AH,4CH
 INT 21H
MAIN ENDP
 END MAIN