@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfremove.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Remove additional packages from Poetry's runtime environment.
rem   The self remove command removes an installed addon package.
rem 
rem Usage:
rem   self remove [options] [--] <packages>...
rem 
rem Arguments:
rem   packages                   The packages to remove.
rem 
rem Options:
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
rem   The self remove command removes additional package's to Poetry's runtime environment.
rem   
rem   This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
rem   
rem -------------------------------------------------------------------
rem   Usage 
rem   The self remove command removes an installed addon package.
rem     poetry self remove poetry-plugin-export
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

    echo Remove additional packages from Poetry's runtime environment ...
    set COMMAND=self remove
    
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
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything ^(implicitly enables --verbose^)
    call :Read_F dry-run "" || exit /b 1
    rem echo dry-run: !dry-run!
    if defined dry-run! (
        set OPTION=!OPTION! --dry-run
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set packages=
    set PN_CAPTION=The packages to remove
    call :Read_P packages "" || exit /b 1
    rem echo packages: !packages!
    if defined packages (
        set ARGS=!ARGS! !packages!
    ) else (
        echo ERROR: packages not defined ...
        set OK=
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
