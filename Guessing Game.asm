.MODEL SMALL
.STACK 100H
.DATA
    
    RAND DB 0
    CHAR DB 0
    CLUE DB 10
    COUNT1 DB 0H
    YES    DB 0H
    NO     DB 0H
    COUNT2 DB 0D
    COUNT3 DB 0D
    LEFT   DB 0H
    
    
    TITLE0 DB ' ====================  THE GUESSING GAME  ====================$'
    GREET0 DB ' WELCOME TO THE "GUESSING GAME", ENHANCE YOUR GUESSING SKILLS!$'
    RULES0 DB ' GAME RULES: $'
    RULES1 DB '              1. A RANDOM NUMBER WILL BE GENERATED$'
    RULES2 DB '              2. YOU WILL BE GIVEN ONLY 10 GUESSES$'
    RULES3 DB '              3. HINTS AFTER EACH WRONG GUESS$'
    RULES4 DB '              4. "HIGHER/LOWER THAN GUESS" AS HINT$'
    RULES5 DB '              5. PRESS "ENTER" AT THE START TO EXIT$'
    RULES6 DB '              6. MORE CLUES LESS SCORE !! SEEMS HARD !!$'
    
    START0 DB ' START? (y/n) $'
    RAND0 DB ' // A RANDOM NUMBER HAS BEEN GENERATED //$'
    QUIT0 DB ' YOU HAVE SUCCESSFULLY EXITED THE GAME.$'
    GAME0 DB ' ENTER YOUR GUESS (0 - 99): $'
    EXIT0 DB ' EXIT? (y/n) $'
    RESET0 DB ' THE GAME HAS RESTARTED$'
    
    HINT0 DB ' OH NO! YOUR GUESS IS WRONG.$' 
    HINT1 DB ' THE NUMBER IS HIGHER THAN YOUR GUESS.$'
    HINT2 DB ' THE NUMBER IS LOWER THAN YOUR GUESS.$'
    HINT3 DB " ALSO, YOUR GUESS IS GETTING WARMER.$"
    HINT4 DB " ALSO, YOUR GUESS IS GETTING COOLER.$"
    
    GUESS0 DB ' CONGRATULATIONS! "$'
    GUESS1 DB '" IS THE CORRECT GUESS.$'
    
    ERROR0 DB ' YOUR INPUT "$'
    ERROR1 DB '" IS INVALID. DIGITS ONLY.$'
    
    CLUE0 DB '     // YOU HAVE $'
    CLUE1 DB ' CLUES LEFT //$'
    CLUE2 DB ' NO GUESSES LEFT FOR YOU$'  
    CLUE3 DB ' -------------CLUES------------------ $'
    
    OVER1 DB '       ***** CONGRATULATIONS *****     $'
    OVER2 DB '              YOUR SCORE : $'
    OVER3 DB '       *** THE  GAME  IS  OVER ***   $'

                                  
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ; YOUR CODE STARTS HERE
    
    TITLE:   
    MOV AH, 9       ;S(GAME TITLE)
    LEA DX, TITLE0
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(WELCOME MSSG)
    LEA DX, GREET0
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GAME RULES)       
    LEA DX, RULES0
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 9       ;S(1ST RULE)       
    LEA DX, RULES1
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(2ND RULE)       
    LEA DX, RULES2
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(3RD RULE)       
    LEA DX, RULES3
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(4TH RULE)       
    LEA DX, RULES4
    INT 21H 
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(5TH RULE)       
    LEA DX, RULES5
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(6TH RULE)       
    LEA DX, RULES6
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H  
    
    
    
    START:
    MOV AH, 2                     
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(START PROMPT)       
    LEA DX, START0
    INT 21H
    
    
    MOV AH, 1       ;F(START/EXIT)
    INT 21H
    
    CMP AL, 'n'
    JE QUIT
    
    CMP AL, 'y'
    JE RANDGEN
    
    JMP START
    
    
    
    RANDGEN:
    MOV AH, 2CH     ;F(RANDOM GENERATE)
    INT 21H
    MOV RAND, DL 


    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(RANDOM GEN MSSG)
    LEA DX, RAND0
    INT 21H
    
    
    
    GAME:
    CMP COUNT2,10D
    JL GAMEON
    
    
    GAMEON:
    INC COUNT2
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(INPUT PROMPT)
    LEA DX, GAME0
    INT 21H
    
    
    
    1ST_DIGIT:
    MOV AH, 1       ;F(1ST DIGIT INPUT)
    INT 21H
    MOV BH, AL
    MOV CHAR, AL
    
    CMP BH, 0DH   ;F(EXIT CHECKER)    
    JE EXIT
    
    CMP BH, '0'   ;F(ERROR CHECKER 1)
    JL ERROR
    
    CMP BH, '9'   ;F(ERROR CHECKER 2)
    JG ERROR
    
    
    
    2ND_DIGIT:
    MOV AH, 1       ;F(2ND DIGIT INPUT)
    INT 21H
    MOV BL, AL
    MOV CHAR, AL
    
    CMP BL, 0DH     ;F(SINGLE DIGIT CHECKER) 
    JE SINGLES
    
    CMP BL, '0'     ;F(ERROR CHECKER 1)     
    JL ERROR
    
    CMP BL, '9'     ;F(ERROR CHECKER 1)
    JG ERROR
    
    
    
    DOUBLES:
    MOV AX, 0       ;F(CLEARING INPUTS)
           
    SUB BH, 30H     ;F(INPUT TO DEC)
    SUB BL, 30H
    
    MOV AL, BH      ;F(DEC TO HEX)
    MOV CL, 10
    MUL CL
    ADD AL, BL
    
    MOV BL, AL
    JMP CHECKER1
    
    
    
    SINGLES:
    MOV AX, 0       ;F(CLEARING INPUTS)              
    
    SUB BH, 30H     ;F(INPUT TO DEC)
    MOV AL, BH
    
    MOV BL, AL
    JMP CHECKER1
    
    
    
    CHECKER1:
    
    CMP RAND, BL    ;F(CHECKING GUESS)
    JE GUESS
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GUESS WRONG)
    LEA DX, HINT0
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    LEA DX,CLUE3
    MOV AH,9
    INT 21H 
    
    
    MOV COUNT3,10D
    MOV DL, COUNT3
    SUB DL, COUNT2
    ADD DL, 30H
    MOV LEFT, DL   
   
    
    CMP LEFT,30H
    JE  GAMEOVER
    JL  GOGAMING
     
    GOGAMING:
    INC COUNT1
    CMP RAND, BL
    JG HIGHER
    JL LOWER
    
    
    CHECKER2:
    MOV CL, RAND
    ADD CL, 5
    
    MOV CH, RAND
    SUB CH, 5 
    
    CMP BL, CL
    JG COOLER
   
    CMP BL, CH
    JL COOLER 
    
    JMP WARMER     

    
    HIGHER:
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GUESS IS HIGHER)
    LEA DX, HINT1
    INT 21H
    
    
    JMP CHECKER2
    
    
    
    LOWER:
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GUESS IS LOWER)
    LEA DX, HINT2
    INT 21H
    
    JMP CHECKER2
    
    
    
    WARMER:
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, HINT3
    MOV AH, 9
    INT 21H
    
    
    JMP CLUES
    
    
    
    COOLER:
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    LEA DX, HINT4
    MOV AH, 9
    INT 21H
    
    
    JMP CLUES
    
    
    
    GUESS:
      
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GUESS CORRECT 1SH HALF)
    LEA DX, GUESS0
    INT 21H
    
    MOV AX, 0       ;F(RANDOM TO DECIMAL)
    MOV AL, RAND
    MOV CL, 10
    DIV CL
    MOV CX, AX
    
    CMP CL, 0       ;F(CHECKING IF SINGLE DIGIT)
    JE ONES
    
    TENS:
    MOV AH, 2       ;S(DIGIT OF TENS)
    MOV DL, CL
    ADD DL, 30H
    INT 21H
    
    ONES:
    MOV AH, 2       ;S(DIGIT OF ONES)
    MOV DL, CH
    ADD DL, 30H
    INT 21H
    
    MOV AH, 9       ;S(GUESS CORRECT LAST HALF)
    LEA DX, GUESS1
    INT 21H
    
    
    JMP GAMEOVER
    
    
    
    CLUES:
    
    DEC CLUE        ;F(CLUE COUNTER)
    CMP CLUE, 0
    JE NO_CLUES
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(CLUES REMAINING 1ST HALF)
    LEA DX, CLUE0
    INT 21H
    
    MOV AH, 2       ;F(CLUES LEFT)
    MOV DL, CLUE
    ADD DL, 30H
    INT 21H
    
    MOV AH, 9       ;S(CLUES REMAINING LAST HALF)
    LEA DX, CLUE1
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    JMP GAME
    
    
    
    NO_CLUES:
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(NO CLUES LEFT)
    LEA DX, CLUE2
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    JMP EXIT

    
    ERROR:
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(INVALID MSSG 1ST HALF)
    LEA DX, ERROR0
    INT 21H
    
    MOV AH, 2       ;F(SHOWING INVALID CHAR)
    MOV DL, CHAR
    INT 21H
    
    MOV AH, 9       ;S(INVALID MSSG 2ND HALF)
    LEA DX, ERROR1
    INT 21H
    
    JMP CLUES
        
    
    EXIT:
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(EXIT PROMPT)
    LEA DX, EXIT0
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, 'y'
    JE QUIT
    
    
    CMP AL, 'n'     ;F(START/EXIT)
    JE RESTART  
    
    JMP EXIT
    
    
    RESTART:
    MOV RAND, 0     ;F(RESETTING VALUES)
    MOV CHAR, 0
    MOV CLUE, 10
    MOV COUNT2, 0D
    MOV COUNT3, 0D
    MOV LEFT,   0H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       ;F(EXTRA SPACING)       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(GAME RESTART)
    LEA DX, RESET0
    INT 21H
    
    JMP RANDGEN 
    
    
    
    QUIT:
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       ;S(EXTRA SPACING)       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9       ;S(EXITING GAME)
    LEA DX, QUIT0
    INT 21H
    
    JMP END
    
    GAMEOVER:
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX,OVER1
    MOV AH,9
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX,OVER2
    MOV AH,9
    INT 21H
    
    
    MOV DL,LEFT
    MOV AH,2
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 2       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, OVER3
    MOV AH,9
    INT 21H 
    
    MOV AH, 2              
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 2       ;S(EXTRA SPACING)       
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    JMP EXIT 
    
   
    

    ; YOUR CODE ENDS HERE
    END:
    MOV AX, 4C00H
    INT 21H 
    
MAIN ENDP
END MAIN 