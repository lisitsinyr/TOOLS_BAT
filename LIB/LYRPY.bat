@echo off
rem -------------------------------------------------------------------
rem LYRPY.bat
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
rem procedure LYRPY ()
rem --------------------------------------------------------------------------------
:LYRPY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_START ()
rem -----------------------------------------------
:PY_ENV_START
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SetROOT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem echo PY_ENVDIR:!PY_ENVDIR!
    rem echo PY_ENVNAME:!PY_ENVNAME!
    call !PY_ENVDIR!\!PY_ENVNAME!\Scripts\activate.bat
    rem call D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P312\Scripts\activate.bat

    rem echo VIRTUAL_ENV_PROMPT:!VIRTUAL_ENV_PROMPT!
    rem echo PROMPT:!PROMPT!
    rem echo PYTHONHOME:!PYTHONHOME!
    rem echo PATH:!PATH!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_STOP ()
rem -----------------------------------------------
:PY_ENV_STOP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SetROOT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call !PY_ENVDIR!\!PY_ENVNAME!\Scripts\deactivate.bat
    rem call D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P312\Scripts\deactivate.bat

    rem echo VIRTUAL_ENV_PROMPT:!VIRTUAL_ENV_PROMPT!
    rem echo PROMPT:!PROMPT!
    rem echo PYTHONHOME:!PYTHONHOME!
    rem echo PATH:!PATH!

    exit /b 0
rem endfunction
