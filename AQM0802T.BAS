REM ==============================
REM AQM0802 test program

USECLASS AQM0802

A=$3E : REM I2C address
Q=NEW(AQM0802,A)

CALL Q.CLCD()
CALL Q.WSTR(1,1,"HELLO")
CALL Q.WSTR(2,3,"World")
DELAYMS 500

FOR I=0 TO 10
  CALL Q.WSTR(2,I,DEC$(I))
  DELAYMS 500
NEXT

WHILE INKEY()=0:WEND

CALL Q.CLCD()
END

