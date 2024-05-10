@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_sourceadd.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Add source configuration for project.
rem   The source add command adds source configuration to the project.
rem 
rem Usage:
rem   source add [options] [--] <name> [<url>]
rem 
rem Arguments:
rem   name                       Source repository name.
rem   url                        Source repository URL. Required, except for PyPI, for which it is not allowed.
rem 
rem Options:
rem   -d, --default              Set this source as the default (disable PyPI). A default source will also be the fallback source if you add other sources. (Deprecated, use --priority)
rem   -s, --secondary            Set this source as secondary. (Deprecated, use --priority)
rem   -p, --priority=PRIORITY    Set the priority of this source. One of: default, primary, secondary, supplemental, explicit. Defaults to primary.
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
rem   For example, to add the pypi-test source, you can run:
rem     poetry source add pypi-test https://test.pypi.org/simple/
rem   You cannot use the name pypi for a custom repository as it is reserved for use by the default PyPI source. However, you can set the priority of PyPI:
rem     poetry source add --priority=explicit pypi
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir%

    echo Add source configuration for project ...
    set COMMAND=source add
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    if "!Read_N!"=="" (
        call :MAIN_FUNC
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    ) else (
        set APPRUN=!APP! %*
    )
    echo APPRUN: !APPRUN!

    if defined OK (
        !APPRUN!
    )

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
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set default=
    set PN_CAPTION=Set this source as the default (disable PyPI). Deprecated in favor of --priority
    call :Read_P default %1 || exit /b 1
    rem echo default: !default%
    if not "!default!"=="" (
        set OPTION=!OPTION! --default %default%
    )
    set secondary=
    set PN_CAPTION=Set this source as a secondary source. Deprecated in favor of --priority
    call :Read_P secondary %1 || exit /b 1
    rem echo secondary: !secondary%
    if not "!secondary!"=="" (
        set OPTION=!OPTION! --secondary %secondary%
    )
    set priority=
    set PN_CAPTION=Set the priority of this source. Accepted values are: default, secondary, supplemental, and explicit. Refer to the dedicated sections in Repositories for more information
    call :Read_P priority %1 || exit /b 1
    rem echo priority: !priority%
    if not "!priority!"=="" (
        set OPTION=!OPTION! --priority %priority%
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
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
