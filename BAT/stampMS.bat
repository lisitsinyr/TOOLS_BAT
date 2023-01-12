
:: StampMS.cmd
:: Requires specific regional settings (unlike the Stampme.cmd script) 
:: therefore I don't advise it's use in a login script

:: Regional time format= HH:mm:ss
:: Time separator= :
:: Language= US/UK English
:: OS= Win2K, WinXp, 2K3

:: Accuracy is displayed to nearest 10 ms
:: but be aware that if comparing two PCs a variance of 
:: up to 20 milliseconds (0.020 seconds) is typical


   @ECHO off
   SETLOCAL
   IF [%1] NEQ [] goto s_start

   :: Author - Simon Sheppard, June 2005

   ECHO StampMS.cmd
   ECHO REName a file with the DATE/Time in Milliseconds
   ECHO.
   ECHO SYNTAX
   ECHO       StampMS TestFile.txt
   ECHO.
   ECHO       StampMS "Test File.txt"
   ECHO.
   ECHO       StampMS "c:\docs\Test File.txt"
   ECHO.
   ECHO       Will rename the file in the format "Test File-00-9-27@16-55-15-230.txt"
   ECHO.
   ECHO       In a batch file use CALL StampMS ...

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
   FOR /f "tokens=1-4 delims=:. " %%G in ('echo %time%') do call :s_setvar %%G-%%H-%%I-%%J
   goto :last

   :s_setvar
   SET _mstime=%10
   goto :eof 

   :last
   ECHO Today is Year: [%_yy%] Month: [%_mm%] Day: [%_dd%]
   ECHO The time is:   [%_mstime%]

   REN "%_pathname%" "%_file%-%_yy%-%_mm%-%_dd%@%_mstime%%_ext%"

