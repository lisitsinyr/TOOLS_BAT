@echo off
rem -------------------------------------------------------------------
rem LYRConst.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRConst
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRConst ()
rem --------------------------------------------------------------------------------
:LYRConst
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set touchRUN=touch -f
    set touchRUN=D:\TOOLS\EXE\touch.exe

    rem -------------------------------------------------------------------
    rem PROJECTS - проект
    set PROJECTS=
    rem echo PROJECTS: !PROJECTS!
    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR -
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR -
    set PROJECTS_DIR=
    rem echo PROJECTS_DIR: !PROJECTS_DIR!
    rem -------------------------------------------------------------------
    rem CURRENT_SYSTEM -
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: !CURRENT_SYSTEM!
    rem -------------------------------------------------------------------
    rem UNAME - COMPUTERNAME
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: !UNAME!
    rem -------------------------------------------------------------------
    rem USERNAME - USERNAME
    set USERNAME=%USERNAME%
    rem echo USERNAME: !USERNAME!
    rem -------------------------------------------------------------------
    rem CURRENT_DIR - Текущий каталог
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: !CURRENT_DIR!

    exit /b 0
rem endfunction

rem ===================================================================
