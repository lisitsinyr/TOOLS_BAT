@echo off
rem -------------------------------------------------------------------
rem chk.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...
    
    CHKDSK U: /f /v /x /r

    exit /b 0
:end

rem ===================================================================

