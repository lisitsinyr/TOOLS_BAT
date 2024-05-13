@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_version.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Shows the version of the project or bumps it when a valid bump rule is provided.
rem   This command shows the current version of the project or bumps the version of the project and writes the new version back to pyproject.toml if a valid bump rule is provided.
rem 
rem Usage:
rem   version [options] [--] [<version>]
rem 
rem Arguments:
rem   version                    The version number or the rule to update the version.
rem 
rem Options:
rem   -s, --short                Output the version number only
rem       --dry-run              Do not update pyproject.toml file
rem       --next-phase           Increment the phase of the current version
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
rem   The version command shows the current version of the project or bumps the version of
rem   the project and writes the new version back to pyproject.toml if a valid
rem   bump rule is provided.
rem   
rem   The new version should ideally be a valid semver string or a valid bump rule:
rem   patch, minor, major, prepatch, preminor, premajor, prerelease.
rem -------------------------------------------------------------------
chcp 1251>NUL
 
setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    rem call :StopLogFile || exit /b 1

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
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set OK=yes

    echo Shows the version of the project or bumps it when a valid bump rule is provided ...
    set COMMAND=version
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    call :Check_tomlFile

    if defined OK (
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
    )

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set short=
    set PN_CAPTION=Output the version number only
    call :Read_F short "yN" || exit /b 1
    echo short: !short!
    if defined short (
        set OPTION=!OPTION! --short
    )
    set dry-run=
    set PN_CAPTION=Do not update pyproject.toml file
    call :Read_F dry-run "yN" || exit /b 1
    rem echo dry-run: !dry-run!
    if defined dry-run (
        set OPTION=!OPTION! --dry-run
    )
    set next-phase=
    set PN_CAPTION=Increment the phase of the current version
    call :Read_F next-phase "yN" || exit /b 1
    rem echo next-phase: !next-phase!
    if defined next-phase (
        set OPTION=!OPTION! --next-phase
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set version=
    set PN_CAPTION=The version number or the rule to update the version
    call :Read_P version "" || exit /b 1
    echo version: !version!
    if defined version (
        set ARGS=!ARGS! !version!
    ) else (
        echo ERROR: version not defined ...
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
