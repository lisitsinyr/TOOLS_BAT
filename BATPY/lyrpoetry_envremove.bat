@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_envremove.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Remove virtual environments associated with the project.
rem   Deleting the environments
rem 
rem Usage:
rem   env remove [options] [--] [<python>...]
rem 
rem Arguments:
rem   python                     The python executables associated with, or names of the virtual environments which are to be removed.
rem 
rem Options:
rem       --all                  Remove all managed virtual environments associated with the project.
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
rem   Usage 
rem   Finally, you can delete existing virtual environments by using env remove:
rem     poetry env remove /full/path/to/python
rem     poetry env remove python3.7
rem     poetry env remove 3.7
rem     poetry env remove test-O3eWbxRl-py3.7
rem   You can delete more than one environment at a time.
rem     poetry env remove python3.6 python3.7 python3.8
rem   Use the --all option to delete all virtual environments at once.
rem     poetry env remove --all
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    set OK=yes
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
    rem Проверка существования файла pyproject.toml
    set tomlFile=pyproject.toml
    if not exist "!tomlFile!" (
        echo ERROR: Файл !tomlFile! не существует ...
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

    echo Remove virtual environments associated with the project ...
    set COMMAND=env remove
    
    call :Check_tomlFile

    if defined OK (
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

    set APP=poetry
    set OPTION= -v --no-ansi
    set ARGS=
    set APPRUN=

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set all=
    set PN_CAPTION=Remove all managed virtual environments associated with the project
    call :Read_F all "yN" || exit /b 1
    rem echo all: !dall%
    if defined all (
        set OPTION=!OPTION! --all
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set python=
    set PN_CAPTION=The python executables associated with, or names of the virtual environments which are to be removed
    call :Read_P python "" || exit /b 1
    rem echo python: !python!
    if defined python (
        set OPTION=!ARGS! !python!
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
