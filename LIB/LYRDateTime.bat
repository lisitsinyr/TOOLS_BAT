@echo off
rem -------------------------------------------------------------------
rem LYRDateTime.bat
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
rem procedure LYRDateTime ()
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
rem function YYYYMMDDHHMMSS () -> YYYYMMDDHHMMSS
rem --------------------------------------------------------------------------------
:YYYYMMDDHHMMSS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=YYYYMMDDHHMMSS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LFORMAT="!YYYY!!MM!!DD!!HH!!MIN!!SS!"
    call :DateTime !LFORMAT! !! exit /b 1

    set YYYYMMDDHHMMSS=!DateTime!
    set !FUNCNAME!=!DateTime!
    rem echo YYYYMMDDHHMMSS:!YYYYMMDDHHMMSS!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function DateTime (AFORMAT) -> DateTime
rem --------------------------------------------------------------------------------
:DateTime
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DateTime
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set YYYY=%date:~6,4%
    set MM=%date:~3,2%
    set DD=%date:~0,2%
    set HH=%TIME:~0,2%
    set MIN=%TIME:~3,2%
    set SS=%TIME:~6,2%

    set AFORMAT=%~1
    rem echo AFORMAT:!AFORMAT!

    rem set DateTime=!AFORMAT!
    set !FUNCNAME!=!AFORMAT!
    rem echo DateTime:!DateTime!

    exit /b 0
rem endfunction
