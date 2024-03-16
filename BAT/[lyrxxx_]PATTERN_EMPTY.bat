@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_EMPTY.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    call :Check_P1 || exit /b 1

    rem mkdir %date:~6,4%%P1%%date:~3,2%%P1%%date:~0,2%

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem Check_P1 [P1_Value]
rem --------------------------------------------------------------------------------
:Check_P1
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    if "%1"=="" (
        set P1=""
        rem set /p P1=P1:
    ) else (
        set P1=%1
        exit /b 0
    )
    if "%P1%"=="" (
        set P1=""
    )
    echo P1: %P1%

    exit /b 0
rem endfunction
