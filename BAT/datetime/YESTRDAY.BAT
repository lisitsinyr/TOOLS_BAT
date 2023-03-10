@ECHO OFF
:: Windows NT 4 or later only
IF NOT "%OS%"=="Windows_NT" GOTO Syntax
:: No command line arguments required
IF NOT [%1]==[] GOTO Syntax

:: Keep variables local
SETLOCAL

:: Export registry's date format settings to a temporary file
START /W REGEDIT /E %TEMP%.\_TEMP.REG "HKEY_CURRENT_USER\Control Panel\International"

:: Read the exported data
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "sDate"') DO SET sDate=%%B
DEL %TEMP%.\_TEMP.REG

:: Remove quotes from exported values
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%

:: Parse today's date depending on registry's local date format settings
IF %iDate%==0 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET LocalFormat=MM%sDate%DD%sDate%YYYY
	SET YesterLocal=%%YesterM%%%sDate%%%YesterD%%%sDate%%%YesterY%%
	SET Year=%%C
	SET Month=%%A
	SET Day=%%B
)
IF %iDate%==1 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET LocalFormat=DD%sDate%MM%sDate%YYYY
	SET YesterLocal=%%YesterD%%%sDate%%%YesterM%%%sDate%%%YesterY%%
	SET Year=%%C
	SET Month=%%B
	SET Day=%%A
)
IF %iDate%==2 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET LocalFormat=YYYY%sDate%MM%sDate%DD
	SET YesterLocal=%%YesterY%%%sDate%%%YesterM%%%sDate%%%YesterD%%
	SET Year=%%A
	SET Month=%%B
	SET Day=%%C
)

:: Remove the day of week if applicable
FOR %%A IN (%Year%)  DO SET Year=%%A
FOR %%A IN (%Month%) DO SET Month=%%A
FOR %%A IN (%Day%)   DO SET Day=%%A

:: Today's date in YYYYMMDD format
SET SortDate=%Year%%Month%%Day%

:: Today's date in local format
FOR %%A IN (%Date%) DO SET Today=%%A

:: Strip leading zero from Day
SET DayS=%Day%
IF %Day:~0,1%==0 SET DayS=%Day:~1%

:: Calculate yesterday's date
IF %DayS% EQU 1 (
	SET YesterY=%Year%
	CALL :RollMonth
) ELSE (
	SET /A YesterD=%DayS% - 1
	SET YesterM=%Month%
	SET YesterY=%Year%
)

:: Add leading zero to YesterD if necessary
IF %YesterD% LSS 10 SET YesterD=0%YesterD%

:: Yesterday's date in YYYYMMDD format
SET SortYest=%YesterY%%YesterM%%YesterD%

:: Display the results
ECHO Format:     YYYYMMDD  (%LocalFormat%)
ECHO.==================================
ECHO Today:      %SortDate%  (%Today%)
CALL ECHO Yesterday:  %SortYest%  (%YesterLocal%)

:: Done
ENDLOCAL
GOTO:EOF

:: * * * * * * * *  Subroutines  * * * * * * * *


:: Subroutine to get yesterday's date if today is the first day of the month
:: Thanks for Aaron M. Jones who pointed out an error in the YesterD value for Month 2
:RollMonth
IF %Month%==01 (
	SET YesterD=31
	SET YesterM=12
	SET /A YesterY = %Year% - 1
)
IF %Month%==02 (
	SET YesterD=31
	SET YesterM=01
)
IF %Month%==03 (
	SET YesterD=28
	SET YesterM=02
	CALL :LeapYear
)
IF %Month%==04 (
	SET YesterD=31
	SET YesterM=03
)
IF %Month%==05 (
	SET YesterD=30
	SET YesterM=04
)
IF %Month%==06 (
	SET YesterD=31
	SET YesterM=05
)
IF %Month%==07 (
	SET YesterD=30
	SET YesterM=06
)
IF %Month%==08 (
	SET YesterD=31
	SET YesterM=07
)
IF %Month%==09 (
	SET YesterD=31
	SET YesterM=08
)
IF %Month%==10 (
	SET YesterD=30
	SET YesterM=09
)
IF %Month%==11 (
	SET YesterD=31
	SET YesterM=10
)
IF %Month%==12 (
	SET YesterD=30
	SET YesterM=11
)
GOTO:EOF


:LeapYear
:: Subroutine to calculate if this year is a leap year, by Anthony Walters
:: Pseudocode from http://en.wikipedia.org/wiki/Leap_year:
:: if year modulo 400 is 0 then leap
::     else if year modulo 100 is 0 then no_leap
::         else if year modulo 4 is 0 then leap
::             else no_leap

SET /A mod400 = %Year% %% 400
SET /A mod100 = %Year% %% 100
SET /A mod4   = %Year% %% 4
IF %mod400% EQU 0 (
	SET YesterD=29
) ELSE (
	IF %mod100% EQU 0 (
		SET YesterD=28
	) ELSE (
		IF %mod4% EQU 0 (
			SET YesterD=29
		) ELSE (
			SET YesterD=28
		)
	)
)
GOTO:EOF



:Syntax
ECHO.
ECHO Yesterday.bat,  Version 2.05 for Windows NT 4 / 2000 / XP
ECHO Display today's and yesterday's date in sorted and local format
ECHO.
IF     "%OS%"=="Windows_NT" ECHO Usage:  %~n0
IF NOT "%OS%"=="Windows_NT" ECHO Usage:  %0
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO Adapted for Windows XP with help from Kailash Chanduka
ECHO Local date code by Frederic Guigand and Rob van der Woude
ECHO Improved leapyear subroutine by Anthony Walters
