@echo off&SETLOCAL

::  DELOLDER.cmd days fullpath
::
::  For example:  
::      DELOLDER 14 C:\temp\*.*
::      DELOLDER 28 "C:\Log Files\"
::      DELOLDER 28 "C:\Log Files\*.LOG"

:: note: do not specify the Current Directory

:: To use this batch for real, edit the last line below
:: i.e. change [ECHO DELETE the file] to [DEL] or [MOVE] or whatever

:: Requires:
::   DateMath.cmd and Getdate.cmd from  www.ss64.com/ntsyntax/

:: ================================================
:: NOTES
:: Delolder only runs against a single folder at a time.
:: Although the XCOPY command does support recursing subfolders, you need to be
:: careful of the situation where an identical filename exists in two
:: folders, with different dates

:: E.g.

::  C:\data\first\MyFile.txt 29/08/2002
::  C:\data\second\MyFile.txt 30/01/2004

:: Rather than complicate the DelOlder script to account for this

:: List the sub folders
::   DIR /b C:\data\*. >list.txt

:: Run DelOlder against each subfolder
::   FOR /f %%G IN (list.txt) DO DelOlder 10 C:\data\%%G\*.*
:: ================================================

SET _days_newer=%1
SET _source=%2

:: get todays date from getdate.cmd
CALL GetDate
SET yy=%yy:~2,2%

:: calculate new date using DateMath.cmd
CALL DateMath %yy% %mm% %dd% - %_days_newer%

ECHO Files older than Year: [%_yy_int%] Month: [%_mm_str%] Day: [%_dd_str%]

:: Compare each file in the DIR with files that are newer than day X
:: and delete all those that don't match (ie are older)

FOR /f "tokens=*" %%G IN ('XCOPY %_source% /L ^| FIND "\"') DO CALL :s_match_older "%%G"
goto :eof

:s_match_older
FOR /f "tokens=*" %%G IN ('XCOPY %_source% /D:%_mm_str%-%_dd_str%-%_yy_int% /L ^| FIND "\"') DO IF %1=="%%G" (GOTO :eof)

ECHO DELETE the file %1


:: Simon Sheppard, SS64.com, Aug 2006
:: You are free to use or modify this script: Creative Commons Attribution 2.5 License.

:: Use at your own risk, supplied WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
