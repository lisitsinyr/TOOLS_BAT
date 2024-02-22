@echo off
rem -------------------------------------------------------------------
rem LYRDateTime.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRDateTime
rem     :YYYYMMDDHHMMSS
rem     :DateTime
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :LYRDateTime
rem --------------------------------------------------------------------------------
:LYRDateTime
rem beginfunction
    set FNAME=procedure :LYRDateTime
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :YYYYMMDDHHMMSS
rem --------------------------------------------------------------------------------
:YYYYMMDDHHMMSS
rem beginfunction
    set FNAME=procedure :YYYYMMDDHHMMSS
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set YYYYMMDDHHMMSS=YYYYMMDDHHMMSS
    echo %YYYYMMDDHHMMSS%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :DateTime
rem --------------------------------------------------------------------------------
:DateTime
rem beginfunction
    set FNAME=procedure :DateTime
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set DateTime=DateTime
    echo %DateTime%
    exit /b 0
rem endfunction
