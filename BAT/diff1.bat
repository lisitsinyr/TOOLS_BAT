@echo off
rem -------------------------------------------------------------------
rem diff1.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
"C:\Program Files\WinMerge\WinMergeU.exe" %1 %2
:Exit
exit /b 0

rem ===================================================================
