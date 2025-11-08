REM ===============================
REM AQM0802 class
REM Ver 2025.11.08

FIELD ADDR
REM ==========================
REM CONSTACTOR
REM ARGS(1) : I2C ADDRESS
REM
METHOD INIT
  ADDR=ARGS(1)
  I2C 100
  DELAYMS 40
  GOSUB CMD,$38:GOSUB CMD,$39
  GOSUB CMD,$14:GOSUB CMD,$70
  GOSUB CMD,$56:GOSUB CMD,$6C
  DELAYMS 200
  GOSUB CMD,$38:GOSUB CMD,$0C
  GOSUB CMD,$01
  DELAYMS 2
RETURN

REM -------------------------
REM Send command to AQM0802
LABEL CMD
  VAR C
  C=ARGS(1) : REM command
  I2CWRITE ADDR,$0,C
  DELAYMS 2
RETURN

REM ------------------------
REM Write string to LCD
METHOD WSTR
  VAR I,S,R,C
  R=ARGS(1)
  C=ARGS(2)-1
  S$=ARGS$(3)
  
  GOSUB CMD,$80+(R-1)*$40+C
  FOR I=0 TO LEN(S$)-1
    I2CWRITE ADDR, $40, ASC(S$(I,1))
  NEXT
RETURN

REM ----------------------
REM Clear LCD
METHOD CLCD
  GOSUB CMD,$01
RETURN
