@echo off
rem -------------------------------------------------------------------
rem ListDir.bat [lyrxxx_]PATTERN_empty.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    for %%f in ( *.* ) do (
        echo Файл: %%f
        rem echo %%~nf%%~xf
    )

    exit /b 0
:end

rem ===================================================================
