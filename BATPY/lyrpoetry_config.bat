@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_config.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Manages configuration settings.
rem   The config command allows you to edit poetry config settings and repositories.
rem 
rem Usage:
rem   config [options] [--] [<key> [<value>...]]
rem 
rem Arguments:
rem   key                        Setting key.
rem   value                      Setting value.
rem 
rem Options:
rem       --list                 List configuration settings.
rem       --unset                Unset configuration setting.
rem       --local                Set/Get from the project's local configuration.
rem   -h, --help                 Display help for the given command. When no command is given display help for the list command.
rem   -q, --quiet                Do not output any message.
rem   -V, --version              Display this application version.
rem       --ansi                 Force ANSI output.
rem       --no-ansi              Disable ANSI output.
rem   -n, --no-interaction       Do not ask any interactive question.
rem       --no-plugins           Disables plugins.
rem       --no-cache             Disables Poetry source caches.
rem   -C, --directory=DIRECTORY  The working directory for the Poetry command (defaults to the current working directory).
rem   -v|vv|vvv, --verbose       Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
rem 
rem Help:
rem   This command allows you to edit the poetry config settings and repositories.
rem   
rem   To add a repository:
rem   
rem       poetry config repositories.foo https://bar.com/simple/
rem   
rem   To remove a repository (repo is a short alias for repositories):
rem   
rem       poetry config --unset repo.foo
rem -------------------------------------------------------------------
rem   Usage
rem     poetry config [options] [setting-key] [setting-value1] ... [setting-valueN]
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=
    set OK=yes

    call :MAIN_INIT || exit /b 1
    call :SET_LIB %0 || exit /b 1
    echo CURRENT_DIR: !CURRENT_DIR!
    call :StartLogFile || exit /b 1
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN %* || exit /b 1
    )
    call :StopLogFile || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� ��������
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� ��������
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - ������� �������� KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SET ()
rem --------------------------------------------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem ���������� ����������
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    set tomlFile=pyproject.toml
    call :CheckFile !tomlFile! || exit /b 1
    if not defined CheckFile (
        echo ERROR: ���� !tomlFile! �� ���������� ...
        set OK=
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo Manages configuration settings ...
    set COMMAND=config

    if not defined Read_N (
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    ) else (
        set APPRUN=!APP! !COMMAND!!OPTION! %*
    )
    echo APPRUN: !APPRUN!
    !APPRUN!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set list=Y
    set PN_CAPTION=List configuration settings
    call :Read_F list "yN" 0 || exit /b 1
    rem echo list: !list!
    if defined list (
        set OPTION=!OPTION! --list
    )
    set unset=N
    set PN_CAPTION=Unset configuration setting
    call :Read_F unset "yN" 0 || exit /b 1
    rem echo unset: !unset!
    if defined unset (
        set OPTION=!OPTION! --unset
    )
    set local=Y
    set PN_CAPTION=Set/Get from the project's local configuration
    call :Read_F local "yN" 0 || exit /b 1
    rem echo local: !local!
    if defined local (
        set OPTION=!OPTION! --local
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������
    set key=
    set PN_CAPTION=Setting key
    call :Read_P key "" || exit /b 1
    rem echo key: !key%
    if not "!key!"=="" (
        set ARGS=!ARGS! !key!
    ) else (
        echo INFO: key not defined ...
        set OK=yes
    )
    set value=
    set PN_CAPTION=Setting value
    call :Read_P value "" || exit /b 1
    rem echo value: !value!
    if not "!value!"=="" (
        set ARGS=!ARGS! !value!
    ) else (
        echo INFO: value not defined ...
        set OK=yes
    )

    exit /b 0
rem endfunction

rem =================================================
rem ������� LIB
rem =================================================
rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_CHECK_REPO
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_CHECK_PROJECT
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRConst.bat %*
exit /b 0
rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
rem =================================================
rem LYRFileUtils.bat
rem =================================================
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLog.bat
rem =================================================
:FormatStr
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
rem =================================================
rem LYRStrUtils.bat
rem =================================================
rem =================================================
rem LYRSupport.bat
rem =================================================
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Check_P
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
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
