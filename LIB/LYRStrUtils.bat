@echo off
rem -------------------------------------------------------------------
rem LYRStrUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRStrUtils
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRStrUtils ()
rem --------------------------------------------------------------------------------
:LYRStrUtils
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRStrUtils
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TrimLeft (str)
rem --------------------------------------------------------------------------------
:TrimLeft
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimLeft
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set STR=%~1

    rem Обрезать слева - обрезать пробелы в начале строки
    for /f "tokens=* delims= " %%a in ("!STR!") do set STR=%%a
    set !FUNCNAME!=!STR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure TrimRight (str)
rem --------------------------------------------------------------------------------
:TrimRight
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimRight
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set STR=%~1

    rem Обрезать справа - обрезать пробелы в конце строки
    for /l %%a in (1,1,31) do if "!str:~-1!"==" " set STR=!STR:~0,-1!
    set !FUNCNAME!=!STR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Trim (str)
rem --------------------------------------------------------------------------------
:Trim
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Trim
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set STR=%~1

    call :TrimLeft !STR!
    call :TrimRight !STR!

    set !FUNCNAME!=!STR!

    exit /b 0
rem endfunction

rem ===================================================================
