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
rem procedure LYRUVINIT () -> None
rem --------------------------------------------------------------------------------
:LYRUVINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRUVINIT
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
rem procedure UV_python_list () -> None
rem -----------------------------------------------
:UV_python_list
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=UV_python_list
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo List Python versions you have installed and versions you can install ...
    echo uv python list ...
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
    set !FUNCNAME!=

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    set version=
    if defined Aversion (
        set version=!Aversion!
        echo Install Python !version!
        rem uv python install 3.13
        echo uv python install !version! --force ...
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
    set !FUNCNAME!=

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    set version=
    if defined Aversion (
        set version=!Aversion!

        echo uv python uninstall !Aversion! ...
        rem uv python uninstall 3.11.4
        
        uv python uninstall !Aversion!

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
    set !FUNCNAME!=

    echo Run your default Python ...
    echo uv run python ...
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
    set !FUNCNAME!=

    echo Upgrade your Python versions ...
    echo uv python upgrade ...
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
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    set Aversion=%~1
    rem echo Aversion:!Aversion!

    set version=
    if defined Aversion (
        set version=!Aversion!
        echo Find specific Python version !Aversion! ...
        echo uv python find !Aversion! ...
        uv python find !Aversion!
    ) else (
        echo ERROR: Aversion not defined ...
        exit /b 3
    )

    set UV_python_find=!version!

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
    set !FUNCNAME!=

    echo View Python installation directory ...
    echo uv python dir ...
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
    set !FUNCNAME!=

    echo UV will now use this version for all commands in this directory ...
    echo uv run python --version  ...
    rem Will use Python 3.11
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
    set !FUNCNAME!=

    set Aversion=%~1
    rem echo Aversion:!Aversion!

    rem -------------------------------------------------------------------
    rem version
    rem -------------------------------------------------------------------
    set version=
    if defined Aversion (
        set version=!Aversion!
        rem uv python pin 3.X           
        rem cd myproject
        rem uv python pin 3.11
        echo Pin a version for your project ...
        echo uv python pin !version! ...
        uv python pin !version!
    ) else (
        echo ERROR: Aversion not defined ...
        set UV_python_pin=
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
    set !FUNCNAME!=

    echo uv help ...
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
    set !FUNCNAME!=

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
    echo uv help !ACMD! ...

    uv help !ACMD!

    set UV_help_cmd=!ACMD!

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
    set !FUNCNAME!=

    echo uv --version ...
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
    set !FUNCNAME!=

    echo uv self ...
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
    set !FUNCNAME!=

    echo uv self version ...
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
    set !FUNCNAME!=

    echo Установка uv

    echo Рекомендуемый способ установки uv с помощью автономного установщика
    echo Для Windows:

    rem powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
    echo "C:\Program Files\PowerShell\7\pwsh.exe" -c "irm https://astral.sh/uv/install.ps1 | iex"
    
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
    set !FUNCNAME!=

    echo Установка uv

    echo Иные способы установки uv

    echo Cargo:
    echo cargo install --git https://github.com/astral-sh/uv uv

    echo Homebrew:
    echo brew install uv

    echo Winget:
    echo winget install --id=astral-sh.uv  -e

    echo Scoop:
    echo scoop install main/uv
    
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
    set !FUNCNAME!=

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
    set !FUNCNAME!=

    echo Установка uv

    echo Если вы предпочитаете классический способ установки uv через pip из PYPI:

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
    set !FUNCNAME!=

    echo upgrade uv
 
    echo Если uv был установлен через pip:

    pip install --upgrade uv

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_python_version (VarName VarCaption VarDefault) -> python_version
rem --------------------------------------------------------------------------------
:GET_python_version
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_python_version
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem python_version
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo VarValue:!VarValue!
    set VarCaption=%~2
    rem echo VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo VarDefault:!VarDefault!

    if defined !VarName! (
        set result=F
        if !%VarName%!==3.13 set result=T
        if !%VarName%!==3.14 set result=T
        if !result!==T (
            rem set pytho_version=!%VarName%!
        ) else (
            echo ERROR: !%VarName%! not defined ...
            exit /b 1
        )
    ) else (
        echo INFO: !VarName! not defined ...
    )                      

    set GET_python_version=!%VarName%!
    rem echo GET_python_version:!GET_python_version!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_type (VarName VarCaption VarDefault) -> project_type
rem --------------------------------------------------------------------------------
:GET_project_type
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_type
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo VarValue:!VarValue!
    set VarCaption=%~2
    rem echo VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    if defined !VarName! (
        set result=F
        if !%VarName%!==app set result=T
        if !%VarName%!==lib set result=T
        if !%VarName%!==bare set result=T
        if !%VarName%!==script set result=T
        if !result!==T (
            set project_type=--!%VarName%!
        ) else (
            echo ERROR: !%VarName%! not defined ...
            exit /b 1
        )
    rem ) else (
    rem     echo INFO: !VarName! not defined ...
    )

    set GET_project_type=!%VarName%!
    rem echo GET_project_type:!GET_project_type!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package (VarName VarCaption VarDefault) -> package
rem --------------------------------------------------------------------------------
:GET_package
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_package
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem package
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo VarValue:!VarValue!
    set VarCaption=%~2
    rem echo VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        set result=F
        if !%VarName%!==y set result=T
        if !%VarName%!==Y set result=T
        if !result!==T (
            set !%VarName%!=--package
        ) else (
            set !%VarName%!=
            echo INFO: !%VarName%! not defined ...
        )    
    rem ) else (
    rem     echo INFO: !VarName! not defined ...
    )

    set GET_package=!%VarName%!
    rem echo GET_package:!GET_package!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_no-workspace (VarName VarCaption VarDefault) -> no-workspace
rem --------------------------------------------------------------------------------
:GET_no-workspace
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_no-workspace
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem no-workspace
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo VarValue:!VarValue!
    set VarCaption=%~2
    rem echo VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    if defined !VarName! (
        set result=F
        if !%VarName%!==y set result=T
        if !%VarName%!==Y set result=T
        if !result!==T (
            set !%VarName%!=--no-workspace
        ) else (
            set !%VarName%!=
            echo INFO: !%VarName%! not defined ...
        )    
    rem ) else (
    rem     echo INFO: !VarName! not defined ...
    )

    set GET_no-workspace=!%VarName%!
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
