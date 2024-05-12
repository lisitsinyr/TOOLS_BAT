@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfinstall.bat
rem     Запуск poetry из глобального виртуального пространства
rem 
rem Description:
rem   Install locked packages (incl. addons) required by this Poetry installation.
rem   The self install command ensures all additional packages specified are installed in the current runtime environment.
rem 
rem Usage:
rem   self install [options]
rem 
rem Options:
rem       --sync                 Synchronize the environment with the locked packages and the specified groups.
rem       --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
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
rem Help:
rem   The self install command ensures all additional packages specified are installed in the current runtime environment.
rem   
rem   This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
rem   
rem   You can add more packages using the self add command and remove them using the self remove command.
rem -------------------------------------------------------------------
rem   Usage 
rem   The self install command ensures all additional packages specified are installed in the current runtime environment.
rem     poetry self install --sync
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    echo Install locked packages (incl. addons) required by this Poetry installation ...
    set COMMAND=self install
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    rem Количество аргументов
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
    set sync=
    set PN_CAPTION=Synchronize the environment with the locked packages and the specified groups
    call :Read_F sync "yN" || exit /b 1
    rem echo sync: !sync!
    if defined sync (
        set OPTION=!OPTION! --sync
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything (implicitly enables –verbose)
    call :Read_F dry-run "yN" || exit /b 1
    rem echo dry-run: !dry-run!
    if defined dry-run (
        set OPTION=!OPTION! --dry-run
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
