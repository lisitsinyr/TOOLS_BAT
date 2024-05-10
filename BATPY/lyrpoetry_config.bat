@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_config.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Manages configuration settings.
rem   The config command allows you to edit poetry config settings and repositories.
rem 
rem Usage:
rem   config [options] [--] [<key> [<value>...]]
rem 
rem Arguments:
rem   key                        Setting key.
rem   value                      Setting value.
rem 
rem Options:
rem       --list                 List configuration settings.
rem       --unset                Unset configuration setting.
rem       --local                Set/Get from the project's local configuration.
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
rem   This command allows you to edit the poetry config settings and repositories.
rem   
rem   To add a repository:
rem   
rem       poetry config repositories.foo https://bar.com/simple/
rem   
rem   To remove a repository (repo is a short alias for repositories):
rem   
rem       poetry config --unset repo.foo
rem -------------------------------------------------------------------
rem   Usage
rem     poetry config [options] [setting-key] [setting-value1] ... [setting-valueN]
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

    echo Manages configuration settings ...
    set COMMAND=config

    set APP=poetry
    set OPTION= -v --no-ansi
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
    set list=
    set PN_CAPTION=List configuration settings
    call :Read_P list "" || exit /b 1
    rem echo list: !list!
    if not "!list!"=="" (
        set OPTION=!OPTION! --list
    )
    set unset=
    set PN_CAPTION=Unset configuration setting
    call :Read_P unset "" || exit /b 1
    rem echo unset: !unset!
    if not "!unset!"=="" (
        set OPTION=!OPTION! --unset
    )
    set local=
    set PN_CAPTION=Set/Get from the project's local configuration
    call :Read_P local "" || exit /b 1
    rem echo local: !local!
    if not "!local!"=="" (
        set OPTION=!OPTION! --local
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set key=
    set PN_CAPTION=Setting key
    call :Read_P key "" || exit /b 1
    rem echo key: !key%
    if not "!key!"=="" (
        set OPTION=!ARGS! !key!
    ) else (
        echo ERROR: key not defined ...
        set OK=yes
    )
    set value=
    set PN_CAPTION=Setting value
    call :Read_P value "" || exit /b 1
    rem echo value: !value!
    if not "!value!"=="" (
        set OPTION=!ARGS! !value!
    ) else (
        echo ERROR: value not defined ...
        set OK=yes
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
