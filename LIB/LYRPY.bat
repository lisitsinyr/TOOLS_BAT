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
rem procedure LYRPY () -> None
rem --------------------------------------------------------------------------------
:LYRPY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRPY
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

    set LYRPY=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_START () -> None
rem -----------------------------------------------
:PY_ENV_START
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PY_ENV_START
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem echo PY_ENVDIR:!PY_ENVDIR!
    rem echo PY_ENVNAME:!PY_ENVNAME!

    if not exist !PY_ENVDIR!\ (
        echo ERROR: Dir !PY_ENVDIR! not exist ...
        exit /b 1
    )
    
    if not exist !PY_ENVDIR!\Scripts\activate.bat (
        echo ERROR: File !PY_ENVDIR!\Scripts\activate.bat not exist ...
        exit /b 2
    )

    call !PY_ENVDIR!\Scripts\activate.bat
    rem call D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\Scripts\activate.bat

    rem echo VIRTUAL_ENV_PROMPT:!VIRTUAL_ENV_PROMPT!
    rem echo PROMPT:!PROMPT!
    rem echo PYTHONHOME:!PYTHONHOME!
    rem echo PATH:!PATH!

    set PY_ENV_START=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_STOP () -> None
rem -----------------------------------------------
:PY_ENV_STOP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PY_ENV_STOP
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if not exist !PY_ENVDIR! (
        echo ERROR: Dir !PY_ENVDIR! not exist ...
        exit /b 1
    )
    
    if not exist !PY_ENVDIR!\Scripts\activate.bat (
        echo ERROR: File !PY_ENVDIR!\Scripts\deactivate.bat ...
        exit /b 2
    )

    call !PY_ENVDIR!\Scripts\deactivate.bat
    rem call D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P312\Scripts\deactivate.bat

    rem echo VIRTUAL_ENV_PROMPT:!VIRTUAL_ENV_PROMPT!
    rem echo PROMPT:!PROMPT!
    rem echo PYTHONHOME:!PYTHONHOME!
    rem echo PATH:!PATH!

    set PY_ENV_STOP=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function PROJECT_DIR (APROJECTDIR) -> None
rem --------------------------------------------------------------------------------
:PROJECT_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PROJECT_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTDIR=%~1
    echo APROJECTDIR:!APROJECTDIR!

    rem -------------------------------------------------------------------
    rem project_dir - 
    rem -------------------------------------------------------------------
    if defined APROJECTDIR (
        if not exist !APROJECTDIR!\ (
            echo ERROR: Dir !APROJECTDIR! not exist ...
            exit /b 1
        ) else (
            if not exist !APROJECTDIR!\PROJECT.ini (
                echo ERROR: Dir !APROJECTDIR!\PROJECT.ini not exist ...
                exit /b 1
            ) else (
                cd /D !APROJECTDIR!
            )
        )
    )

    set PROJECT_DIR=

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function VENV_DIR (AVENVDIR) -> None
rem --------------------------------------------------------------------------------
:VENV_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AVENVDIR=%~1
    echo AVENVDIR:!AVENVDIR!

    rem -------------------------------------------------------------------
    rem ENV - 
    rem -------------------------------------------------------------------
    if !AVENVDIR!==P313 (
        set PY_ENVDIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313
    ) else (
        if !AVENVDIR!==P314 (
            set PY_ENVDIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314
        ) else (
            if !AVENVDIR!==.venv (
                set PY_ENVDIR=!project_dir!\.venv
            ) else (
               set PY_ENVDIR=!AVENVDIR!
            )
        )
    )
    echo PY_ENVDIR:!PY_ENVDIR!
    if not exist !PY_ENVDIR!\ (
        echo INFO: Dir !PY_ENVDIR! not exist ...
        exit /b 1
    )

    set VENV_DIR=

    exit /b 0

rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
