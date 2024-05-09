@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_help.bat
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
rem     help - Displays help for a command.
rem          The help command displays global help, or help for a specific command.
rem -------------------------------------------------------------------
rem     Uses
rem     To display global help:
rem         poetry help
rem     To display help for a specific command, for instance show:
rem         poetry help show
rem     The --help option can also be passed to any command to get help for a specific command.
rem         For instance:
rem         poetry show --help
rem     Options
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

    echo Displays help for a command ...
    set COMMAND=help

    set OPTION=
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
    set OPTION=%OPTION% -v
    
    set APPRUN=poetry %OPTION% %COMMAND%

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

    set command=
    set PN_CAPTION=command
    call :Read_P command %1 || exit /b 1
    rem echo command: %command%
    if not "%command%"=="" (
        set APPRUN=%APPRUN% %command%
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