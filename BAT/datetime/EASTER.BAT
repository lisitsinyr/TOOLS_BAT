@ECHO OFF
ECHO.

:: Windows NT 4 / 2000 / XP only
IF NOT "%OS%"=="Windows_NT" GOTO Syntax

:: Localize environment and enable command extensions
SETLOCAL ENABLEEXTENSIONS

:: Command line check
IF NOT [%2]==[] GOTO Syntax

:: Determine current year
CALL :ThisYear

:: If no year is specified, use current year
IF "%~1"=="" (SET Y=%ThisYear%) ELSE (SET Y=%~1)

:: Is the specified year valid?
:: Check if number
FOR /F "tokens=1 delims=0123456789" %%A IN ('ECHO.%Y%') DO IF NOT "%%~A"=="" GOTO Syntax
:: check if in range
IF %Y%0 LSS 17520 GOTO Syntax
IF %Y%0 GTR 30000 GOTO Syntax

:: Calculate Easter Day using the instructions found at
:: Simon Kershaw's "KEEPING THE FEAST"
:: http://www.oremus.org/liturgy/etc/ktf/app/easter.html
SET /A G  = ( %Y% %% 19 ) + 1
SET /A S  = (( %Y% - 1600 ) / 100 ) - (( %Y% - 1600 ) / 400 )
SET /A L  = ((( %Y% - 1400 ) / 100 ) * 8 ) / 25
SET /A P1 = ( 30003 - 11 * %G% + %S% - %L% ) %% 30
SET P=%P1%
IF %P%==28 IF %G% GTR 11 SET P=27
IF %P%==29 SET P=28
SET /A D  = ( %Y% + ( %Y% / 4 ) - ( %Y% / 100 ) + ( %Y% / 400 )) %% 7
SET /A D1 = ( 8 - %D% ) %% 7
SET /A P2 = ( 70003 + %P% ) %% 7
SET /A X  = (( 70004 - %D% - %P% ) %% 7 ) + 1
SET /A E  = %P% + %X%
IF %E% LSS 11 (
	SET /A ED = %E% + 21
	SET EM=March
) ELSE (
	SET /A ED = %E% - 10
	SET EM=April
)
IF %Y% LSS %ThisYear% SET IS=was
IF %Y% EQU %ThisYear% SET IS=is
IF %Y% GTR %ThisYear% SET IS=will be

:: Calculate Ascension day's date
IF %EM%==March (
	IF %ED% GTR 22 (
		SET AM=May
		SET /A AD = %ED% - 22
	) ELSE (
		SET AM=April
		SET /A AD = %ED% + 8
	)
) ELSE (
	IF %ED% GTR 21 (
		SET AM=June
		SET /A AD = %ED% - 21
	) ELSE (
		SET AM=May
		SET /A AD = %ED% + 9
	)
)

:: Calculate Pentecost date
IF %AM%==April (
	IF %AD% GTR 20 (
		SET PM=May
		SET /A PD = %AD% - 20
	) ELSE (
		SET PM=April
		SET /A PD = %AD% + 10
	)
)
IF %AM%==May (
	IF %AD% GTR 21 (
		SET PM=June
		SET /A PD = %AD% - 21
	) ELSE (
		SET PM=May
		SET /A PD = %AD% + 10
	)
)
IF %AM%==June (
	IF %AD% GTR 21 (
		SET PM=July
		SET /A PD = %AD% - 21
	) ELSE (
		SET PM=June
		SET /A PD = %AD% + 10
	)
)

:: Display the result
ECHO In %Y% Easter Day %IS% %EM% %ED%
ECHO         Ascension Day %IS% %AM% %AD%
ECHO         Pentecost %IS% %PM% %PD%

:: Done
GOTO End


:ThisYear
:: Export registry settings to a temporary file
START /WAIT REGEDIT /E "%Temp%.\_Temp.reg" "HKEY_CURRENT_USER\Control Panel\International"
:: Read iDate and sDate from the exported data; more info on iDate can be found at
:: http://technet2.microsoft.com/windowsserver/en/library/7dedbd31-40bd-4f47-a833-517a0b9ab9bb1033.mspx
:: and more info on sDate at
:: http://technet2.microsoft.com/windowsserver/en/library/072ad962-21c4-4070-9c6f-2720922d6d361033.mspx
FOR /F "tokens=1* delims==" %%A IN ('TYPE "%Temp%.\_Temp.reg" ^| FINDSTR /R /B /C:"\"[is]Date\"="') DO SET %%~A=%%~B
DEL "%Temp%.\_Temp.reg"
:: Detemine current year depending on registry settings
FOR %%A IN (%Date%) DO SET Today=%%A
IF %iDate%==2 (SET Token=1) ELSE (SET Token=3)
FOR /F "tokens=%Token% delims=%sDate%" %%A IN ("%Today%") DO SET ThisYear=%%A
GOTO:EOF

:Syntax
ECHO Easter.bat,  Version 2.10 for Windows NT 4 and later
ECHO Calculate Easter day, Ascension day and Pentecost dates for the specified year.
ECHO.
ECHO Usage:  EASTER  [ year ]
ECHO.
ECHO Where:  year should be within the range of 1752 through 3000
ECHO.
ECHO Note:   Easter day calculation based on Simon Kershaw's "KEEPING THE FEAST":
ECHO         http://www.oremus.org/liturgy/etc/ktf/app/easter.html
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com

:End
IF "%OS%"=="Windows_NT" ENDLOCAL
