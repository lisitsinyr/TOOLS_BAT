@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_remove.bat
rem     Запуск poetry из глобального виртуального пространства
rem 
rem Description:
rem   Removes a package from the project dependencies.
rem   The remove command removes a package from the current list of installed packages.
rem 
rem Usage:
rem   remove [options] [--] <packages>...
rem 
rem Arguments:
rem   packages                   The packages to remove.
rem 
rem Options:
rem   -G, --group=GROUP          The group to remove the dependency from.
rem   -D, --dev                  Remove a package from the development dependencies. (Deprecated) Use --group=dev instead.
rem       --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
rem       --lock                 Do not perform operations (only update the lockfile).
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
rem   The remove command removes a package from the current
rem   list of installed packages
rem   
rem   poetry remove
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

    echo Removes a package from the project dependencies ...
    set COMMAND=remove
    
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
    set group=
    set PN_CAPTION=The group to remove the dependency from
    call :Read_P group %1 || exit /b 1
    rem echo group: !group%
    if not "!group!"=="" (
        set OPTION=!OPTION! --group %group%
    )
    set dev=
    set PN_CAPTION=Removes a package from the development dependencies. (Deprecated, use -G dev instead)
    call :Read_P dev %1 || exit /b 1
    rem echo dev: !dev%
    if not "!dev!"=="" (
        set OPTION=!OPTION! --dev %dev%
    )
    set dry-run=
    set PN_CAPTION=Outputs the operations but will not execute anything (implicitly enables –verbose)
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: !dry-run%
    if not "!dry-run!"=="" (
        set OPTION=!OPTION! --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=Do not perform operations (only update the lockfile)
    call :Read_P lock %1 || exit /b 1
    rem echo lock: !lock%
    if not "!lock!"=="" (
        set OPTION=!OPTION! --lock %lock%
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
