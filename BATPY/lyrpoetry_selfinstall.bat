@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfinstall.bat
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
rem   self install - Install locked packages (incl. addons) required by this Poetry installation.
rem                  The self install command ensures all additional packages specified are installed in the current runtime environment.
rem -------------------------------------------------------------------
rem   Usage 
rem   The self install command ensures all additional packages specified are installed in the current runtime environment.
rem     poetry self install --sync
rem   Options
rem   --sync: Synchronize the environment with the locked packages and the specified groups.
rem   --dry-run: Output the operations but do not execute anything (implicitly enables ñverbose).
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

    echo Install locked packages (incl. addons) required by this Poetry installation ...
    set COMMAND=self install
    set APPRUN=poetry -v %COMMAND%

    set P1=
    call :Check_P P1 %1 || exit /b 1
   
    if "%P1%"=="" (
        call :MAIN_FUNC
        rem set APPRUN=poetry %*
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
    set sync=
    set PN_CAPTION=Synchronize the environment with the locked packages and the specified groups
    call :Read_P sync %1 || exit /b 1
    rem echo sync: %sync%
    if not "%sync%"=="" (
        set APPRUN=%APPRUN% --sync
    )

    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything (implicitly enables ñverbose)
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
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
