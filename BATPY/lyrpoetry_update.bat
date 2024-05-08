@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_install.bat
rem     Запуск poetry из глобального виртуального пространства
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
rem   update - Update the dependencies as according to the pyproject.toml file.
rem            In order to get the latest versions of the dependencies and to update
rem            the poetry.lock file, you should use the update command.
rem -------------------------------------------------------------------
rem   Options
rem   --without: The dependency groups to ignore.
rem   --with: The optional dependency groups to include.
rem   --only: The only dependency groups to include.
rem   --dry-run : Outputs the operations but will not execute anything (implicitly enables –verbose).
rem   --no-dev : Do not update the development dependencies. (Deprecated, use --only main or --without dev instead)
rem   --lock : Do not perform install (only update the lockfile).
rem   --sync: Synchronize the environment with the locked packages and the specified groups.
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Update the dependencies as according to the pyproject.toml file ...
    set COMMAND=update
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

    set without=
    set PN_CAPTION=without
    call :Read_P without %1 || exit /b 1
    rem echo without: %without%
    if not "%without%"=="" (
        set APPRUN=%APPRUN% --without %without%
    )
    set with=
    set PN_CAPTION=with
    call :Read_P with %1 || exit /b 1
    rem echo with: %with%
    if not "%with%"=="" (
        set APPRUN=%APPRUN% --with %with%
    )
    set only=
    set PN_CAPTION=only
    call :Read_P only %1 || exit /b 1
    rem echo only: %only%
    if not "%only%"=="" (
        set APPRUN=%APPRUN% --only %only%
    )
    set dry-run=
    set PN_CAPTION=dry-run
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set no-dev=
    set PN_CAPTION=no-dev
    call :Read_P no-dev %1 || exit /b 1
    rem echo no-dev: %no-dev%
    if not "%no-dev%"=="" (
        set APPRUN=%APPRUN% --no-dev %no-dev%
    )
    set lock=
    set PN_CAPTION=lock
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set APPRUN=%APPRUN% --lock %lock%
    )
    set sync=
    set PN_CAPTION=sync
    call :Read_P sync %1 || exit /b 1
    rem echo sync: %sync%
    if not "%sync%"=="" (
        set APPRUN=%APPRUN% --sync %sync%
    )
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ LIB
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
