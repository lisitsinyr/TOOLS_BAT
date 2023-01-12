@ECHO OFF
ECHO.

:: Check Windows version (XP Pro or later) and command line arguments (none)
IF NOT "%OS%"=="Windows_NT"    GOTO Syntax
IF NOT "%~1"==""               GOTO Syntax
WMIC.EXE Alias /? >NUL 2>&1 || GOTO Syntax

:: Use WMIC to retrieve date and time
FOR /F "skip=2 tokens=2-7 delims=," %%A IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:csv') DO (
	SET /A SortDate = 10000 * %%F + 100 * %%D + %%A
	SET /A SortTime = 10000 * %%B + 100 * %%C + %%E
)

:: Display the results:
SET Sort

:: Done
GOTO:EOF


:Syntax
ECHO SortDate.bat, Version 5.00 for Windows XP Pro and later
ECHO Displays date and time in YYYYMMDD and HHmmSS format,
ECHO completely independent of Windows' Regional Settings or
ECHO language, and without the use of temporary files.
ECHO.
ECHO Usage:  SORTDATE
ECHO.
ECHO Note:   Uses WMIC to query the current date and time;
ECHO         WMIC is native in Windows XP Professional,
ECHO         Windows Server 2003 and Windows Vista.
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO.
