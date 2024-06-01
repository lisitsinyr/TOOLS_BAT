rem Этот bat-файл (сохраните как datetimestr.bat) создает строку datetime 3 раза: (1) длинную строку datetime с днем недели и секундами, (2) короткую строку datetime без них и (3) сокращенную версию кода.

@echo off
REM "%date: =0%" replaces spaces with zeros
set d=%date: =0%
REM "set yyyy=%d:~-4%" pulls the last 4 characters
set yyyy=%d:~-4%
set mm=%d:~4,2%
set dd=%d:~7,2%
set dow=%d:~0,3%
set d=%yyyy%-%mm%-%dd%_%dow%

set t=%TIME: =0%
REM "%t::=%" removes semi-colons
REM Instead of above, you could use "%t::=-%" to 
REM replace semi-colons with hyphens (or any 
REM non-special character)
set t=%t::=%
set t=%t:.=%

set datetimestr=%d%_%t%
@echo  Long date time str = %datetimestr%

set d=%d:~0,10%
set t=%t:~0,4%
set datetimestr=%d%_%t%
@echo Short date time str = %datetimestr%


@REM Short version of the code above
set d=%date: =0%
set t=%TIME: =0%
set datetimestr=%d:~-4%-%d:~4,2%-%d:~7,2%_%d:~0,3%_%t:~0,2%%t:~3,2%%t:~6,2%%t:~9,2%
@echo Datetimestr = %datetimestr%

pause
