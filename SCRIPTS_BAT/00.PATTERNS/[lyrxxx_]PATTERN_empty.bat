@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_empty.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set GERRORLEVEL=!errorlevel!
    echo GERRORLEVEL:!GERRORLEVEL!

    exit /b 0
:end

rem ===================================================================
