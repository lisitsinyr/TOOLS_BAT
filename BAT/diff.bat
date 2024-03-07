@echo off
rem -------------------------------------------------------------------
rem diff1.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    rem windiff.exe %1 %2
    rem WinMergeU.exe %1 %2
    wincmp3.exe %1 %2

:Exit
exit /b 0

rem ===================================================================
