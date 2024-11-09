.MODEL SMALL
.STACK 64
.DATA
    MENU DB "Enter the option number (1,2,3 or 4) for operation"
         DB 13,10,"1. AND"
         DB 13,10,"2. OR"
         DB 13,10,"3. XOR"
         DB 13,10,"4. NOT"
         DB 13,10,"----------------------"
         DB 13,10,"Operation selection: $"
    SEL DB 0
    XMSG DB 13,10,"Enter value for x: $"
    X DB 0
    YMSG DB 13,10,"Enter value for y: $"
    Y DB 0 
    MSGA DB 13,10,"X AND Y = $"
    MSGO DB 13,10,"X OR Y = $"
    MSGX DB 13,10,"X XOR Y = $"
    MSGN DB 13,10,"NOT X = $"
    ANS DB 0
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,09H 
    LEA DX,MENU 
    INT 21H 

    MOV AH,01H 
    INT 21H 
    MOV SEL,AL 

    CMP SEL,'1'
    JE GETXY 
    CMP SEL,'2' 
    JE GETXY 
    CMP SEL,33H 
    JE GETXY 
    JNE GETX 

GETXY:
    MOV AH,09H 
    LEA DX,XMSG 
    INT 21H 

    MOV AH,01H 
    INT 21H 
    MOV X,AL

    MOV AH,09H 
    LEA DX,YMSG 
    INT 21H 

    MOV AH,01H 
    INT 21H 
    MOV Y,AL

    JMP DOOP

GETX:
    MOV AH,09H 
    LEA DX,XMSG 
    INT 21H 

    MOV AH,01H 
    INT 21H 
    MOV X,AL

    JMP DOOP 

DOOP:
    CMP SEL,'1'
    JE DOAND 
    CMP SEL,'2'
    JE DOOR 
    CMP SEL,'3'
    JE DOXOR 
    JNE DONOT 

DOAND:
    MOV AL,X 
    AND AL,Y 
    MOV ANS,AL 

    MOV AH,09H 
    LEA DX, MSGA 
    INT 21H 
    MOV AH,02H 
    MOV DL,ANS 
    INT 21H
    JMP EXIT

DOOR:
    MOV AL,X 
    OR AL,Y 
    MOV ANS,AL 

    MOV AH,09H 
    LEA DX, MSGO
    INT 21H 
    MOV AH,02H 
    MOV DL,ANS 
    INT 21H
    JMP EXIT

DOXOR:
    MOV AL,X 
    XOR AL,Y 
    MOV ANS,AL 

    MOV AH,09H 
    LEA DX, MSGX 
    INT 21H 
    MOV AH,02H 
    MOV DL,ANS 
    INT 21H
    JMP EXIT

DONOT:
    MOV AL,X 
    NOT AL
    MOV ANS,AL 

    MOV AH,09H 
    LEA DX, MSGN
    INT 21H 
    MOV AH,02H 
    MOV DL,ANS 
    INT 21H
    JMP EXIT

        

EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
 END MAIN