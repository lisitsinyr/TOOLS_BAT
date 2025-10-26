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

    rem ---------------------------------------------
    rem IF
    rem ---------------------------------------------
    if (condition_01) (
        ...
    ) else (
        ...
    )

    rem ---------------------------------------------
    rem IF AND
    rem ---------------------------------------------
    if (condition_01) (
        if (condition_02) (
            echo AND ...
        )
    )

    rem ---------------------------------------------
    rem IF OR
    rem ---------------------------------------------
    set result=F
    if (condition_01) set result=T
    if (condition_02) set result=T
    if "!result!"=="T" (
        echo OR ...
    )    

    rem ---------------------------------------------
    rem CASE
    rem ---------------------------------------------
    if (condition_01) (
        ...
    )
    if (condition_02) (
        ...
    )

    rem ---------------------------------------------
    rem WHILE
    rem ---------------------------------------------
    set Result=
    :WHILE
    if not !Result!==10 (
        ...
        goto :WHILE
    )

    exit /b 0
:end

rem ===================================================================
