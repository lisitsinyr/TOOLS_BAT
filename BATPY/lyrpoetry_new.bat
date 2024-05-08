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
rem   new - Creates a new Python project at <path>.
rem -------------------------------------------------------------------
rem   Options
rem    --name: Set the resulting package name.
rem    --src: Use the src layout for the project.
rem    --readme: Specify the readme file extension.
rem      Default is md. If you intend to publish to PyPI keep the recommendations
rem      for a PyPI-friendly README in mind.
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
    set COMMAND=new
    rem echo COMMAND: %COMMAND%

    echo Удаление файла pyproject.toml
    del pyproject.toml

    set P1=
    call :Check_P P1 %1 || exit /b 1
    rem echo P1: %P1%    
   
    if "%P1%"=="" (
        rem call :run_poetry %1 %2 %3 %4 %5 %6 %7 %8 %9
        call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
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


    set folder=folder folder
    set name=test
    set src=test2
    set readme=

    set PN_CAPTION=Folder
    call :Read_P folder %1 || exit /b 1
    rem echo folder: %folder%
    set PN_CAPTION=Name of the package
    call :Read_P name %1 || exit /b 1
    rem echo name: %name%
    set PN_CAPTION=Use the src layout for the project
    call :Read_P src %1 || exit /b 1
    rem echo src: %src%
    set PN_CAPTION= Specify the readme file extension
    call :Read_P readme %1 || exit /b 1
    rem echo readme: %readme%

    rem call :run_poetry folder --name %name% --src --readme %readme%

    call :run_poetry "%folder%" --name %name% --src

:Exit
exit /b 0

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

    set APPRUN=poetry.exe %COMMAND% %1 %2 %3 %4 %5 %6 %7 %8 %9

    rem set RARCMD=rar a -r "%P1%.rar" "%P2%"

    echo APPRUN: %APPRUN%
    %APPRUN%

    rem poetry.exe %COMMAND% %1 %2 %3 %4 %5 %6 %7 %8 %9

    rem call :PressAnyKey || exit /b 1

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
