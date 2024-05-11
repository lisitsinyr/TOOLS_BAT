@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_FUNCTION.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :FUNC_01
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure FUNC_01 ()
rem --------------------------------------------------------------------------------
:FUNC_01
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function read_choice ()
rem --------------------------------------------------------------------------------
:read_choice
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo Available commands ^(экранирование^):
    echo 01.install  Installs the project dependencies.
    echo 02.install  Installs the project dependencies.
    echo 03.install  Installs the project dependencies.
    echo 04.install  Installs the project dependencies.
    echo 05.install  Installs the project dependencies.
    echo 06.install  Installs the project dependencies.
    echo 07.install  Installs the project dependencies.
    echo 08.install  Installs the project dependencies.
    echo 09.install  Installs the project dependencies.
    echo 10.install  Installs the project dependencies.
    echo 99.         Quit

    set /p CHOICE=PN_CAPTION[99][99]:
    echo !CHOICE!
    if "!CHOICE!"=="01" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="02" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="03" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="04" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="05" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="06" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="07" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="08" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="09" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="10" (
        set COMMAND=
    ) else (
    if "!CHOICE!"=="99" (
        set COMMAND=
    ) else (
        echo ERROR: Параметр CHOICE не реализован...
        rem call :PressAnyKey || exit /b 1
    )
    )))))))))))

    set read_choice=!CHOICE!

    exit /b 0
rem endfunction

rem ===================================================================
