   @ECHO off
   SETLOCAL
   IF [%1] NEQ [] goto s_start

   :: Author - Simon Sheppard, July 2003
   :: Tested for Windows NT, 2K, XP 

   ECHO STAMPME.cmd
   ECHO REName a file with the DATE/Time
   ECHO.
   ECHO SYNTAX
   ECHO       STAMPME TestFile.txt
   ECHO.
   ECHO       STAMPME "Test File.txt"
   ECHO.
   ECHO       STAMPME "c:\docs\Test File.txt"
   ECHO.
   ECHO       Will rename the file in the format "Test File-02-12-27@16-55.txt"
   ECHO.
   ECHO       In a batch file use CALL STAMPME ...

   :: To change the filename format just change around the last line below

   GOTO :eof
   
   :s_start

	SET _file=%~n1%
	SET _pathname=%~f1%
	SET _ext=%~x1%

	::Get the date
   ::  note ISO 8601 date format would require 4 digit YYYY Year)

   FOR /f "tokens=6-8 delims=/ " %%G IN ('NET TIME \\%computername%') DO (
         SET _mm=%%G
         SET _dd=%%H
         SET _yy=%%I
	 )

   :: Get the time
   FOR /f "tokens=1,2 delims=: " %%G IN ('time/t') DO (
         SET _hr=%%G
         SET _min=%%H
   )

   ECHO Today is Year: [%_yy%] Month: [%_mm%] Day: [%_dd%]
   ECHO The time is:   [%_hr%]:[%_min%]

   REN "%_pathname%" "%_file%-%_yy%-%_mm%-%_dd%@%_hr%-%_min%%_ext%"


