@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_init.bat
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
rem   init - Creates a basic pyproject.toml file in the current directory
rem -------------------------------------------------------------------
rem   Options
rem   --name: Name of the package.
rem   --description: Description of the package.
rem   --author: Author of the package.
rem   --python Compatible Python versions.
rem   --dependency: Package to require with a version constraint. Should be in format foo:1.0.0.
rem   --dev-dependency: Development requirements, see --dependency.
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
        set APPRUN=%APPRUN% --name %name%
    )

    set description=description
    set PN_CAPTION=Description of the package
    call :Read_P description %1 || exit /b 1
    rem echo description: %description%
    if not "%description%"=="" (
        set APPRUN=%APPRUN% --description "%description%"
    )
    
    set author="lisitsinyr <lisitsinyr@gmail.com>"
    set PN_CAPTION=Author of the package
    rem call :Read_P author %1 || exit /b 1
    rem echo author: %author%
    rem if not "%author%"=="" (
    rem     set APPRUN=%APPRUN% --author %author%
    rem )
    
    set python=
    set PN_CAPTION=Compatible Python versions
    call :Read_P python %1 || exit /b 1
    rem echo python: %python%
    if not "%python%"=="" (
        set APPRUN=%APPRUN% --python %python%
    )
    
    set dependency=
    set PN_CAPTION=Package to require with a version constraint
    rem call :Read_P dependency %1 || exit /b 1
    rem echo dependency: %dependency%
    if not "%dependency%"=="" (
        set APPRUN=%APPRUN% --dependency %dependency%
    )
    
    set dev-dependency=
    set PN_CAPTION=Development requirements
    rem call :Read_P dev-dependency %1 || exit /b 1
    rem echo dev-dependency: %dev-dependency%
    if not "%dev-dependency%"=="" (
        set APPRUN=%APPRUN% --dev-dependency %dev-dependency%
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
