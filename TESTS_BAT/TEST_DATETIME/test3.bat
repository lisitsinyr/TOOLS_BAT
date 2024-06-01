::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: generates a custom formatted timestamp string using date and time.
:: run this batch file for an instant demo.
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@ECHO OFF
SETLOCAL & MODE CON:COLS=80 LINES=15 & COLOR 0A

:: --- CHANGE THE COMPUTER DATE FORMAT TEMPORARILY TO MY PREFERENCE "yyyy_MM_dd",
REG COPY "HKCU\Control Panel\International" "HKCU\Control Panel\International-Temp" /f 2>nul >nul
REG ADD "HKCU\Control Panel\International" /v sShortDate /d "yyyy_MM_dd" /f 2>nul >nul

SET MYDATE=%date%

:: --- REVERT COMPUTER DATE BACK TO SYSTEM PREFERENCE
REG COPY "HKCU\Control Panel\International-Temp" "HKCU\Control Panel\International" /f 2>nul >nul
REG DELETE "HKCU\Control Panel\International-Temp" /f 2>nul >nul

:: --- SPLIT THE TIME [HH:MM:SS.SS] TO THREE SEPARATE VARIABLES [HH] [MM] [SS.SS]
FOR /F "tokens=1-3 delims=:" %%A IN ('echo %time%') DO (
SET HOUR=%%A
SET MINUTES=%%B
SET SECONDS=%%C
)

:: --- CHOOSE ONE OF THESE TWO OPTIONS :
:: --- FOR 4 DIGIT SECONDS        //REMOVES THE DOT FROM THE SECONDS VARIABLE [SS.SS]
:: SET SECONDS=%SECONDS:.=%
:: --- FOR 2 DIGIT SECONDS        //GETS THE FIRST TWO DIGITS FROM THE SECONDS VARIABLE [SS.SS]
SET SECONDS=%SECONDS:~0,2% 

:: --- FROM 12 AM TO 9 AM, THE HOUR VARIABLE WE EXTRACTED FROM %TIME% RETURNS A SINGLE DIGIT, 
:: --- WE PREFIX A ZERO CHARACTER TO THOSE CASES, SO THAT OUR WANTED TIMESTAMP
:: --- ALWAYS GENERATES DOUBLE-DIGIT HOURS (24-HOUR CLOCK TIME SYSTEM).
IF %HOUR%==0 (SET HOUR=00)
IF %HOUR%==1 (SET HOUR=01)
IF %HOUR%==2 (SET HOUR=02)
IF %HOUR%==3 (SET HOUR=03)
IF %HOUR%==4 (SET HOUR=04)
IF %HOUR%==5 (SET HOUR=05)
IF %HOUR%==6 (SET HOUR=06)
IF %HOUR%==7 (SET HOUR=07)
IF %HOUR%==8 (SET HOUR=08)
IF %HOUR%==9 (SET HOUR=09)

:: --- GENERATE OUR WANTED TIMESTAMP
SET TIMESTAMP=%MYDATE%__%HOUR%_%MINUTES%_%SECONDS%

:: --- VIEW THE RESULT IN THE CONSOLE SCREEN
ECHO.
ECHO    Generate a custom formatted timestamp string using date and time.
ECHO.
ECHO    Your timestamp is:    %TIMESTAMP%
ECHO.
ECHO.
ECHO    Job is done. Press any key to exit . . .
PAUSE > NUL

rem EXIT
