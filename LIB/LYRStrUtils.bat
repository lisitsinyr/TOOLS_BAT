@echo off
rem -------------------------------------------------------------------
rem LYRStrUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

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

    echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimLeft (ASTR) -> TrimLeft
rem --------------------------------------------------------------------------------
:TrimLeft
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimLeft
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ASTR:!ASTR!

    rem Обрезать слева - обрезать пробелы в начале строки
    for /f "tokens=* delims= " %%a in ("!ASTR!") do set ASTR=%%a
    set !FUNCNAME!=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimRight (ASTR) -> TrimRight
rem --------------------------------------------------------------------------------
:TrimRight
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimRight
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ASTR:!ASTR!

    rem Обрезать справа - обрезать пробелы в конце строки
    for /l %%a in (1,1,31) do if "!ASTR:~-1!"==" " set ASTR=!ASTR:~0,-1!
    set !FUNCNAME!=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Trim (ASTR) -> Trim
rem --------------------------------------------------------------------------------
:Trim
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Trim
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1

    call :TrimLeft !ASTR!
    call :TrimRight !ASTR!

    set !FUNCNAME!=!ASTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Left (ASTR, Alen) -> Left
rem --------------------------------------------------------------------------------
:Left
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Left
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ASTR:!ASTR!
    set /a Alen=%2
    rem echo Alen:!Alen!

    set !FUNCNAME!=!ASTR:0,Alen!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function  Mid (ASTR, Aposition, Alen) -> Mid
rem --------------------------------------------------------------------------------
:Mid
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Mid
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%~1
    rem echo ASTR:!ASTR!
    set /a Aposition=%2
    rem echo Aposition:!Aposition!
    set /a Alen=%3
    rem echo Alen:!Alen!

    set !FUNCNAME!=!ASTR:~!Aposition!,Alen!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimQuotes (ASTR) -> TrimQuotes
rem --------------------------------------------------------------------------------
:TrimQuotes
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=TrimQuotes
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASTR=%1
    rem echo ASTR:!ASTR!

    for /f "useback tokens=*" %%a in ('%ASTR%') do set ASTR=%%~a

    set !FUNCNAME!=!ASTR!

    exit /b 0
rem endfunction

rem ===================================================================
