@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_run.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Runs a command in the appropriate environment.
rem   The run command executes the given command inside the project�s virtualenv.
rem 
rem Usage:
rem   run [options] [--] <args>...
rem 
rem Arguments:
rem   args                       The command and arguments/options to run.
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
rem -------------------------------------------------------------------
rem   The run command executes the given command inside the project�s virtualenv.
rem     poetry run python -V
rem   
rem   It can also execute one of the scripts defined in pyproject.toml.
rem   So, if you have a script defined like this:
rem   [tool.poetry.scripts]
rem   my-script = "my_module:main"
rem   
rem   You can execute it like so:
rem     poetry run my-script    
rem   Options
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    rem call :StopLogFile || exit /b 1

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure Check_tomlFile ()
rem --------------------------------------------------------------------------------
:Check_tomlFile
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    rem �������� ������������� ����� pyproject.toml
    set tomlFile=pyproject.toml
    if not exist "!tomlFile!" (
        echo ERROR: ���� !tomlFile! �� ���������� ...
        set OK=
    )
:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set OK=yes

    echo Runs a command in the appropriate environment ...
    set COMMAND=run
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    call :Check_tomlFile

    if defined OK (
        rem ���������� ����������
        call :Read_N %* || exit /b 1
        rem echo Read_N: !Read_N!

        if defined Read_N (
            call :MAIN_FUNC
            set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
        ) else (
            set APPRUN=!APP! %*
        )
        echo APPRUN: !APPRUN!

        if defined OK (
            !APPRUN!
        )
    )

:Exit
exit /b 0

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

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������
    set args=
    set PN_CAPTION=The command and arguments/options to run
    call :Read_P args "" || exit /b 1
    rem echo args: !args!
    if defined args (
        set ARGS=!ARGS! !args!
    ) else (
        echo ERROR: args not defined ...
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
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
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
