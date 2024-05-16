@echo off
rem -------------------------------------------------------------------
rem __SET_LIB.bat
rem -------------------------------------------------------------------
rem chcp 1251
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :__SET_LIB
rem     :
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure __SET_LIB ()
rem --------------------------------------------------------------------------------
:__SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SET ()
rem -----------------------------------------------
:
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    call :LYRConst %1 || exit /b 1

    exit /b 0
rem endfunction

rem ===================================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:LYRConst
%LIB_BAT%\LYRConst.bat %*
exit /b 0
