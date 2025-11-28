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
:LYRUVINIT
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

    echo List Python versions you have installed and versions you can install ...
    uv python list              

    set UV_python_list=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_install (Aversion) -> version
rem -----------------------------------------------
:UV_python_install
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_install
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    if defined Aversion (
        set version=!Aversion!
        echo Install Python !version!
        rem uv python install 3.13
        uv python install !version! --force
    ) else (
        echo ERROR: Aversion not defined ...
        exit /b 3
    )

    set UV_python_install=!version!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_uninstall (Aversion) -> version
rem -----------------------------------------------
:UV_python_uninstall
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_uninstall
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    if defined Aversion (
        set version=!Aversion!
        echo unInstall Python !Aversion! ...
        rem uv python uninstall 3.11.4
        rem uv python uninstall !Aversion!

    ) else (
        echo ERROR: Aversion not defined ...
        exit /b 3
    )

    set UV_python_uninstall=!version!

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

    echo Run your default Python ...
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

    echo Upgrade your Python versions ...
    uv python upgrade

    set UV_python_upgrade=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_find (Aversion) -> version
rem -----------------------------------------------
:UV_python_find
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_find
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    if defined Aversion (
        set version=!Aversion!
        echo Find specific Python version !Aversion! ...
        uv python find !Aversion!
    ) else (
        echo ERROR: Aversion not defined ...
        exit /b 3
    )

    set UV_python_find=version

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

    echo View Python installation directory ...
    uv python dir

    set UV_python_dir=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_version () -> None
rem -----------------------------------------------
:UV_python_version
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_version
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    echo UV will now use this version for all commands in this directory ...
    
    rem  Will use Python 3.11
    uv run python --version 

    set UV_python_version=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_pin (Aversion) -> version
rem -----------------------------------------------
:UV_python_pin
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_pin
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    echo !FUNCNAME! ...

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    if defined Aversion (
        set version=!Aversion!
        rem uv python pin 3.X           
        rem cd myproject
        rem uv python pin 3.11
        echo Pin a version for your project ...
        uv python pin !version!
    ) else (
        echo ERROR: Aversion not defined ...
        exit /b 3
    )
    
    set UV_python_pin=!version!

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

    echo help ...
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

    echo --version ...
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

    echo self ...
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

    echo self version ...
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

    echo self update ...
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

rem --------------------------------------------------------------------------------
rem function GET_python_version (python_version) -> python_version
rem --------------------------------------------------------------------------------
:GET_python_version
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_python_version
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Apython_version=%~1

    rem -------------------------------------------------------------------
    rem python_version
    rem -------------------------------------------------------------------
    call :GET_Ox "python_version" "python_version" "Apython_version" || exit /b 1
    echo python_version:!python_version!
    if defined python_version (
        set result=F
        if !python_version!==3.13 set result=T
        if !python_version!==3.14 set result=T
        if !result!==T (
            set pytho_version=!Ox!
        ) else (
            echo ERROR: !python_version! not defined ...
            exit /b 1
        )
    )

    set GET_python_version=!python_version!
    rem echo GET_python_version:!GET_python_version!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_type (project_type) -> project_type
rem --------------------------------------------------------------------------------
:GET_project_type
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_type
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_type=%~1

    rem -------------------------------------------------------------------
    rem Aproject_type
    rem -------------------------------------------------------------------
    call :GET_Ox "project_type" "project_type{app,lib,bare,script}" "Aproject_type" || exit /b 1
    echo python_version:!python_version!
    if defined project_type (
        set result=F
        if !project_type!==app set result=T
        if !project_type!==lib set result=T
        if !project_type!==bare set result=T
        if !project_type!==script set result=T
        if !result!==T (
            set project_type=--!project_type!
        ) else (
            echo ERROR: !project_type! not defined ...
            exit /b 1
        )
    )

    set GET_project_type=!project_type!
    rem echo GET_project_type:!GET_project_type!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package (package) -> package
rem --------------------------------------------------------------------------------
:GET_package
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_package
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Apackage=%~1

    rem -------------------------------------------------------------------
    rem package
    rem -------------------------------------------------------------------
    call :GET_Ox "package" "package[y/N]" "Apackage" || exit /b 1
    echo package:!package!
    if defined package (
        set result=F
        if !package!==y set result=T
        if !package!==Y set result=T
        if !result!==T (
            set package=--package
        ) else (
            set package=
            echo INFO: !package! not defined ...
        )    
    )
    
    set GET_package=!package!
    rem echo GET_package:!GET_package!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_no-workspace (no-workspace) -> no-workspace
rem --------------------------------------------------------------------------------
:GET_no-workspace
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_no-workspace
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Ano-workspace=%~1

    rem -------------------------------------------------------------------
    rem no-workspace
    rem -------------------------------------------------------------------
    call :GET_Ox "no-workspace" "no-workspace[y/N]" "Ano-workspace" || exit /b 1
    echo no-workspace:!no-workspace!
    if defined no-workspace (
        set result=F
        if !no-workspace!==y set result=T
        if !no-workspace!==Y set result=T
        if !result!==T (
            set package=--no-workspace
        ) else (
            set no-workspace=
            echo INFO: !no-workspace! not defined ...
        )    
    )
    
    set GET_no-workspace=!no-workspace!
    rem echo GET_no-workspace:!GET_no-workspace!

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

rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupportINIT
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GET_Ox
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
