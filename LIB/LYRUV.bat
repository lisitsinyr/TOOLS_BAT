@echo off
rem -------------------------------------------------------------------
rem LYRUV.bat
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
rem procedure LYRUV ()
rem --------------------------------------------------------------------------------
:LYRUV
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRUV
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
rem Manage Python versions
rem -----------------------------------------------

rem -----------------------------------------------
rem procedure UV_python_list ()
rem -----------------------------------------------
:UV_python_list
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_list
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo List Python versions you have installed and versions you can install
    uv python list              

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_install ()
rem -----------------------------------------------
:UV_python_install
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_install
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo Install Python !AVERSION!
    rem uv python install 3.13
    uv python install !AVERSION!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_uninstall ()
rem -----------------------------------------------
:UV_python_uninstall
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_uninstall
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo unInstall Python !AVERSION!
    rem uv python uninstall 3.11.4
    uv python uninstall !AVERSION!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_run ()
rem -----------------------------------------------
:UV_python_run
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_run
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo Run your default Python
    uv run python

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_upgrade ()
rem -----------------------------------------------
:UV_python_upgrade
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_upgrade
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo Upgrade your Python versions
    uv python upgrade

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_find ()
rem -----------------------------------------------
:UV_python_find
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_find
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo Find specific Python version !AVERSION!
    uv python find !AVERSION!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_dir ()
rem -----------------------------------------------
:UV_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo View Python installation directory
    uv python dir

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_ ()
rem -----------------------------------------------
:UV_python_
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem UV will now use this version for all commands in this directory:
    rem uv run python --version  # Will use Python 3.11

    exit /b 0
rem endfunction


rem -----------------------------------------------
rem procedure UV_python_pin ()
rem -----------------------------------------------
:UV_python_pin
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_pin
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    rem -------------------------------------------------------------------
    rem Pin a version for your project:
    rem -------------------------------------------------------------------
    rem uv python pin 3.X           
    rem cd myproject
    rem uv python pin 3.11

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
