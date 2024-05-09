@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_remove.bat
rem     «‡ÔÛÒÍ poetry ËÁ „ÎÓ·‡Î¸ÌÓ„Ó ‚ËÚÛ‡Î¸ÌÓ„Ó ÔÓÒÚ‡ÌÒÚ‚‡
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
rem   remove - Removes a package from the project dependencies.
rem            The remove command removes a package from the current list of installed packages.
rem -------------------------------------------------------------------
rem   Options
rem   --group (-G): The group to remove the dependency from.
rem   --dev (-D): Removes a package from the development dependencies. (Deprecated, use -G dev instead)
rem   --dry-run : Outputs the operations but will not execute anything (implicitly enables ñverbose).
rem   --lock: Do not perform operations (only update the lockfile).
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo —Ú‡Ú %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Removes a package from the project dependencies ...
    set COMMAND=remove
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
    set group=
    set PN_CAPTION=The group to remove the dependency from
    call :Read_P group %1 || exit /b 1
    rem echo group: %group%
    if not "%group%"=="" (
        set APPRUN=%APPRUN% --group %group%
    )
    set dev=
    set PN_CAPTION=Removes a package from the development dependencies. (Deprecated, use -G dev instead)
    call :Read_P dev %1 || exit /b 1
    rem echo dev: %dev%
    if not "%dev%"=="" (
        set APPRUN=%APPRUN% --dev %dev%
    )
    set dry-run=
    set PN_CAPTION=Outputs the operations but will not execute anything (implicitly enables ñverbose)
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=Do not perform operations (only update the lockfile)
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set APPRUN=%APPRUN% --lock %lock%
    )
:Exit
exit /b 0

rem =================================================
rem ‘”Õ ÷»» LIB
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
