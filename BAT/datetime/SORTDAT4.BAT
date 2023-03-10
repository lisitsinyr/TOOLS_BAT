@ECHO OFF
CLS
ECHO.
ECHO SortDate.bat, Version 4.01 for Windows NT 4 / 2000 / XP
ECHO Display day, month and year, independent of Windows'
ECHO Regional Settings, and using internal commands only.
ECHO.
ECHO Based on Simon Sheppard's GetDate.bat
ECHO http://www.ss64.com/ntsyntax/GetDate.txt
ECHO.
ECHO This version demonstrates how to adjust the code for non-English Windows
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO.

SETLOCAL
:: Get the format: dd-mm-yy, or mm/dd/yy, or whatever other format your PC uses
FOR /F "tokens=2 delims=()" %%A IN ('ECHO. ^| DATE') DO SET Format=%%A
:: Get the delimiter used: the first character that is different
SET Char1=%Format:~0,1%
SET Char2=%Format:~1,1%
SET Char3=%Format:~2,1%
SET Char4=%Format:~3,1%
SET Char5=%Format:~4,1%
IF NOT [%Char1%]==[%Char2%] (
	SET Delim=%Char2%
	GOTO Parse
)
IF NOT [%Char2%]==[%Char3%] (
	SET Delim=%Char3%
	GOTO Parse
)
IF NOT [%Char3%]==[%Char4%] (
	SET Delim=%Char4%
	GOTO Parse
)
IF NOT [%Char4%]==[%Char5%] (
	SET Delim=%Char5%
) ELSE (
	ECHO Error finding delimiter.
	ECHO Aborting . . .
	GOTO:EOF
)

:: Get the current date string
:Parse
FOR /F "tokens=1* delims= " %%A IN ('DATE/T') DO IF "%%B"=="" (SET Date=%%A) ELSE (SET Date=%%B)

:: Display the intermediate results
ECHO Date=%Date%        Format=%Format%        Delim=%Delim%
ECHO.

:: Parse the Date string using the delimiter found earlier
FOR %%? IN (1,2,3) DO CALL :ParseVal %%?

:: This assumes the variable names are dd, mm and yy
ECHO.
ECHO For English NT versions only, modify if format does NOT use dd, mm and yy.
ECHO SET SortDate=%%yy%%%%mm%%%%dd%%
ECHO.
SET SortDate=%yy%%mm%%dd%
SET SortDate

ENDLOCAL & SET SortDate=%SortDate%
GOTO:EOF


:ParseVal
:: Get the day, month or year variable name
FOR /F "tokens=%1 delims=%Delim% " %%A IN ('ECHO.%Format%') DO SET Var%1=%%A
:: Get the day, month or year variable value
FOR /F "tokens=%1 delims=%Delim% " %%A IN ('ECHO.%Date%')   DO SET Val%1=%%A
:: Assingn the value
CALL SET %%Var%1%%=%%Val%1%%
:: Display the result
CALL SET %%Var%1%%
GOTO:EOF
