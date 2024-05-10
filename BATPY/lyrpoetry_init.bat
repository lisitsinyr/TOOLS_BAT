@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_init.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------

Description:
  Creates a basic pyproject.toml file in the current directory.

Usage:
  init [options]

Options:
      --name=NAME                      Name of the package.
      --description=DESCRIPTION        Description of the package.
      --author=AUTHOR                  Author name of the package.
      --python=PYTHON                  Compatible Python versions.
      --dependency=DEPENDENCY          Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
      --dev-dependency=DEV-DEPENDENCY  Package to require for development, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
  -l, --license=LICENSE                License of the package.
  -h, --help                           Display help for the given command. When no command is given display help for the list command.
  -q, --quiet                          Do not output any message.
  -V, --version                        Display this application version.
      --ansi                           Force ANSI output.
      --no-ansi                        Disable ANSI output.
  -n, --no-interaction                 Do not ask any interactive question.
      --no-plugins                     Disables plugins.
      --no-cache                       Disables Poetry source caches.
  -C, --directory=DIRECTORY            The working directory for the Poetry command (defaults to the current working directory).
  -v|vv|vvv, --verbose                 Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.

Help:
  The init command creates a basic pyproject.toml file in the current directory.
  
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
    set APPRUN=poetry -vvv %COMMAND%

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
