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
    set APPRUN=poetry %COMMAND%

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

    set folder=folder folder
    set PN_CAPTION=Folder
    call :Read_P folder || exit /b 1
    rem echo folder: %folder%

    if "%folder%"=="" (

        set tomlFile= pyproject.toml
        if exist "%tomlFile%" (
            echo Удаление файла %tomlFile%
            del %tomlFile%
        )
        
    ) else (

        if exist "%folder%"\ (
            echo ERROR: Каталог "%folder%" существует...
            echo Удаление каталога "%folder%"
            rmdir "%folder%" /s
        )
        set APPRUN=%APPRUN% "%folder%"

    )

    set name=test
    set PN_CAPTION=Name of the package
    call :Read_P name || exit /b 1
    rem echo name: %name%
    set APPRUN=%APPRUN% --name %name%

    set src=
    set PN_CAPTION=Use the src layout for the project
    call :Read_P src || exit /b 1
    rem echo src: %src%
    if not "%src%"=="" (
        set APPRUN=%APPRUN% --src
    )

    set readme=md
    set PN_CAPTION= Specify the readme file extension
    call :Read_P readme || exit /b 1
    rem echo readme: %readme%
    set APPRUN=%APPRUN% --readme %readme%
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
