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
rem procedure LYRUV () -> None
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

    set LYRUV=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem Manage Python versions
rem -----------------------------------------------

rem -----------------------------------------------
rem procedure UV_python_list () -> None
rem -----------------------------------------------
:UV_python_list
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_list
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo !FUNCNAME! ...

    echo List Python versions you have installed and versions you can install
    uv python list              

    set UV_python_list=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_install () -> None
rem -----------------------------------------------
:UV_python_install
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_install
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo Install Python !AVERSION!
    rem uv python install 3.13
    uv python install !AVERSION!

    set UV_python_install=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_uninstall () -> None
rem -----------------------------------------------
:UV_python_uninstall
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_uninstall
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo unInstall Python !AVERSION!
    rem uv python uninstall 3.11.4
    rem uv python uninstall !AVERSION!

    set UV_python_uninstall=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_run () -> None
rem -----------------------------------------------
:UV_python_run
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_run
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    echo Run your default Python
    uv run python

    set UV_python_run=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_upgrade () -> None
rem -----------------------------------------------
:UV_python_upgrade
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_upgrade
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    echo Upgrade your Python versions
    uv python upgrade

    set UV_python_upgrade=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_find () -> None
rem -----------------------------------------------
:UV_python_find
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_find
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    echo Find specific Python version !AVERSION!
    uv python find !AVERSION!

    set UV_python_find=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_dir () -> None
rem -----------------------------------------------
:UV_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    echo View Python installation directory
    uv python dir

    set UV_python_dir=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_ () -> None
rem -----------------------------------------------
:UV_python_
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    echo UV will now use this version for all commands in this directory:
    
    rem  Will use Python 3.11
    uv run python --version  

    set UV_python_=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_pin () -> None
rem -----------------------------------------------
:UV_python_pin
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_pin
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set AVERSION=%~1
    rem echo AVERSION:!AVERSION!

    rem -------------------------------------------------------------------
    rem Pin a version for your project:
    rem -------------------------------------------------------------------
    rem uv python pin 3.X           
    rem cd myproject
    rem uv python pin 3.11
    uv python pin !AVERSION!
    
    set UV_python_pin=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_help () -> None
rem -----------------------------------------------
:UV_help
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_help
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    uv help

    set UV_help=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_help_cmd () -> None
rem -----------------------------------------------
:UV_help_cmd
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_help_cmd
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem auth
    rem run
    rem init
    rem add
    rem remove
    rem version
    rem sync
    rem lock
    rem export
    rem tree
    rem format
    rem tool
    rem python
    rem pip
    rem venv
    rem build
    rem publish
    rem cache
    rem self
    rem generate-shell-completion

    set ACMD=%~1
    rem echo ACMD:!ACMD!

    uv help !ACMD!

    set UV_help_cmd=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_version () -> None
rem -----------------------------------------------
:UV_version
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_version
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    uv --version

    set UV_version=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_self () -> None
rem -----------------------------------------------
:UV_self
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_self
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    uv self

    set UV_self=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_self_version () -> None
rem -----------------------------------------------
:UV_self_version
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_self_version
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    uv self version

    set UV_self_version=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_self () -> None
rem -----------------------------------------------
:UV_install_self
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_install_self
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Установка uv

    rem Рекомендуемый способ установки uv с помощью автономного установщика
    rem Для Windows:

    rem powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
    "C:\Program Files\PowerShell\7\pwsh.exe" -c "irm https://astral.sh/uv/install.ps1 | iex"

    set UV_install_self=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_other () -> None
rem -----------------------------------------------
:UV_install_other
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_install_other
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Установка uv

    rem Иные способы установки uv

    rem Cargo:
    rem cargo install --git https://github.com/astral-sh/uv uv

    rem Homebrew:
    rem brew install uv

    rem Winget:
    rem winget install --id=astral-sh.uv  -e

    rem Scoop:
    rem scoop install main/uv

    set UV_install_other=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_update_self () -> None
rem -----------------------------------------------
:UV_update_self
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_update_self
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Обновление uv

    rem Если uv был установлен через автономный установщик, обновить его можно следующим образом:

    uv self update

    set UV_update_self=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_pip () -> None
rem -----------------------------------------------
:UV_install_pip
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_install_pip
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Установка uv

    rem Если вы предпочитаете классический способ установки uv через pip из PYPI:

    pip install uv

    set UV_install_pip=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_upgrade_pip () -> None
rem -----------------------------------------------
:UV_upgrade_pip
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_upgrade_pip
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Если uv был установлен через pip:

    pip install --upgrade uv

    set UV_upgrade_pip=

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
