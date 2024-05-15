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
    set FUNCNAME=%0
    set FUNCNAME=LYRDateTime
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :YYYYMMDDHHMMSS
rem --------------------------------------------------------------------------------
:YYYYMMDDHHMMSS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=YYYYMMDDHHMMSS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set YYYYMMDDHHMMSS=YYYYMMDDHHMMSS
    set !FUNCNAME!=YYYYMMDDHHMMSS
    rem echo YYYYMMDDHHMMSS: !YYYYMMDDHHMMSS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :DateTime
rem --------------------------------------------------------------------------------
:DateTime
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DateTime
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set DateTime=DateTime
    set !FUNCNAME!=DateTime
    rem echo DateTime: !DateTime!

    exit /b 0
rem endfunction
