@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_config.bat
rem     ������ poetry �� ����������� ������������ ������������
rem Poetry (version 1.8.2)
rem 
rem Usage:
rem   command [options] [arguments]
rem 
rem Options:
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
rem -------------------------------------------------------------------
rem   config - Manages configuration settings.
rem            The config command allows you to edit poetry config settings and repositories.
rem -------------------------------------------------------------------
rem   Usage
rem   poetry config [options] [setting-key] [setting-value1] ... [setting-valueN]
rem   Options
rem   --unset: Remove the configuration element named by setting-key.
rem   --list: Show the list of current config variables.
rem   --local: Set/Get settings that are specific to a project (in the local configuration file poetry.toml).
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Manages configuration settings ...
    set COMMAND=config
    set APPRUN=poetry -v %COMMAND%

    set P1=
    call :Check_P P1 %1 || exit /b 1
   
    if "%P1%"=="" (
        call :MAIN_FUNC
    ) else (
        set APPRUN=poetry %*
    )
    echo APPRUN: %APPRUN%
    %APPRUN%

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
rem   --unset: Remove the configuration element named by setting-key.
rem   --list: Show the list of current config variables.
rem   --local: Set/Get settings that are specific to a project (in the local configuration file poetry.toml).

    set unset=
    set PN_CAPTION=Remove the configuration element named by setting-key
    call :Read_P unset %1 || exit /b 1
    rem echo unset: %unset%
    if not "%unset%"=="" (
        set APPRUN=%APPRUN% --unset
    )
    set list=
    set PN_CAPTION=lock
    call :Read_P list %1 || exit /b 1
    rem echo list: %list%
    if not "%list%"=="" (
        set APPRUN=%APPRUN% --list
    )
    set local=
    set PN_CAPTION=Set/Get settings that are specific to a project (in the local configuration file poetry.toml)
    call :Read_P local %1 || exit /b 1
    rem echo local: %local%
    if not "%local%"=="" (
        set APPRUN=%APPRUN% --local
    )
    set setting-key=
    set PN_CAPTION=setting-key
    call :Read_P setting-key %1 || exit /b 1
    rem echo setting-key: %setting-key%
    if not "%setting-key%"=="" (
        set APPRUN=%APPRUN% --local %setting-key%
    )
    set setting-value1=
    set PN_CAPTION=setting-value1
    call :Read_P setting-value1 %1 || exit /b 1
    rem echo setting-value1: %setting-value1%
    if not "%setting-value1%"=="" (
        set APPRUN=%APPRUN% --local %setting-value1%
    )

:Exit
exit /b 0

rem =================================================
rem ������� LIB
rem =================================================
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
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
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================