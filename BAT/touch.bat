@echo off
rem -------------------------------------------------------------------
rem touch.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    rem @COPY /B %1+,, %1

    rem echo $null >> filename

    exit /b 0
:end

rem ===================================================================
