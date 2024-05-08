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
rem   init - Creates a basic pyproject.toml file in the current directory.
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
    echo COMMAND: %COMMAND%

    rem set PN_CAPTION=Ввод значения
    set P1=P1_default
    set P1=
    call :Check_P P1 %1 || exit /b 1
   
    if "%P1%"=="" (
        call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        echo P1: %P1%    
        call :run_poetry %1 %2 %3 %4 %5 %6 %7 %8 %9
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
    --name: Name of the package.


    call :poetry_init %1 %2 %3 %4 %5 %6 %7 %8 %9
:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure poetry_init ()
rem --------------------------------------------------------------------------------
:poetry_init
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure run_poetry ()
rem --------------------------------------------------------------------------------
:run_poetry
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem C:\Users\lyr\AppData\Local\Programs\Python\Python312\Scripts\poetry.exe %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    rem poetry.exe %COMMAND% %1 %2 %3 %4 %5 %6 %7 %8 %9

    call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

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
