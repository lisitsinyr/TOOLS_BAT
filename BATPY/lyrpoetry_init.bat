@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_init.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Creates a basic pyproject.toml file in the current directory.
rem 
rem Usage:
rem   init [options]
rem 
rem Options:
rem       --name=NAME                      Name of the package.
rem       --description=DESCRIPTION        Description of the package.
rem       --author=AUTHOR                  Author name of the package.
rem       --python=PYTHON                  Compatible Python versions.
rem       --dependency=DEPENDENCY          Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
rem       --dev-dependency=DEV-DEPENDENCY  Package to require for development, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
rem   -l, --license=LICENSE                License of the package.
rem   -h, --help                           Display help for the given command. When no command is given display help for the list command.
rem   -q, --quiet                          Do not output any message.
rem   -V, --version                        Display this application version.
rem       --ansi                           Force ANSI output.
rem       --no-ansi                        Disable ANSI output.
rem   -n, --no-interaction                 Do not ask any interactive question.
rem       --no-plugins                     Disables plugins.
rem       --no-cache                       Disables Poetry source caches.
rem   -C, --directory=DIRECTORY            The working directory for the Poetry command (defaults to the current working directory).
rem   -v|vv|vvv, --verbose                 Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
rem 
rem Help:
rem   The init command creates a basic pyproject.toml file in the current directory.
rem   
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

    echo Creates a basic pyproject.toml file in the current directory ...
    set COMMAND=init
    
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
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set tomlFile=pyproject.toml
    if exist "%tomlFile%" (
        echo Удаление файла %tomlFile%
        del %tomlFile%
    )

    set name=test
    set PN_CAPTION=Name of the package
    call :Read_P name %1 || exit /b 1
    rem echo name: %name%
    if not "%name%"=="" (
        set OPTION=%OPTION% --name %name%
    )

    set description=description
    set PN_CAPTION=Description of the package
    call :Read_P description %1 || exit /b 1
    rem echo description: %description%
    if not "%description%"=="" (
        set OPTION=%OPTION% --description "%description%"
    )
    
    set author="lisitsinyr <lisitsinyr@gmail.com>"
    set PN_CAPTION=Author of the package
    rem call :Read_P author %1 || exit /b 1
    rem echo author: %author%
    rem if not "%author%"=="" (
    rem     set OPTION=%OPTION% --author %author%
    rem )
    
    set python=
    set PN_CAPTION=Compatible Python versions
    call :Read_P python %1 || exit /b 1
    rem echo python: %python%
    if not "%python%"=="" (
        set OPTION=%OPTION% --python %python%
    )
    
    set dependency=
    set PN_CAPTION=Package to require with a version constraint
    rem call :Read_P dependency %1 || exit /b 1
    rem echo dependency: %dependency%
    if not "%dependency%"=="" (
        set OPTION=%OPTION% --dependency %dependency%
    )
   
    set dev-dependency=
    set PN_CAPTION=Development requirements
    rem call :Read_P dev-dependency %1 || exit /b 1
    rem echo dev-dependency: %dev-dependency%
    if not "%dev-dependency%"=="" (
        set OPTION=%OPTION% --dev-dependency %dev-dependency%
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
