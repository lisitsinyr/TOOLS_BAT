@echo off
rem -------------------------------------------------------------------
rem CtrlAltDel.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    control userpassword2

    exit /b 0
:end

rem ===================================================================

