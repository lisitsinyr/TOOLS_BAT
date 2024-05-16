@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_init.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Creates a basic pyproject.toml file in the current directory.
rem 
rem Usage:
rem   init [options]
rem 
rem Options:
rem       --name=NAME                      Name of the package.
rem       --description=DESCRIPTION        Description of the package.
rem       --author=AUTHOR                  Author name of the package.
rem       --python=PYTHON                  Compatible Python versions.
rem       --dependency=DEPENDENCY          Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
rem       --dev-dependency=DEV-DEPENDENCY  Package to require for development, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)
rem   -l, --license=LICENSE                License of the package.
rem   -h, --help                           Display help for the given command. When no command is given display help for the list command.
rem   -q, --quiet                          Do not output any message.
rem   -V, --version                        Display this application version.
rem       --ansi                           Force ANSI output.
rem       --no-ansi                        Disable ANSI output.
rem   -n, --no-interaction                 Do not ask any interactive question.
rem       --no-plugins                     Disables plugins.
rem       --no-cache                       Disables Poetry source caches.
rem   -C, --directory=DIRECTORY            The working directory for the Poetry command (defaults to the current working directory).
rem   -v|vv|vvv, --verbose                 Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
rem 
rem Help:
rem   The init command creates a basic pyproject.toml file in the current directory.
rem   
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=
    set OK=yes

    call :MAIN_INIT %0 || exit /b 1
    call :__SET_MAIN %0 || exit /b 1
    echo CURRENT_DIR: !CURRENT_DIR!
    call :StartLogFile || exit /b 1
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN %* || exit /b 1
    )
    call :StopLogFile || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SET ()
rem --------------------------------------------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    set APP=poetry
    set OPTION= -v --no-ansi
    set ARGS=
    set APPRUN=

    set tomlFile=pyproject.toml
    call :CheckFile tomlFile
    if not defined CheckFile (
        echo ERROR: Файл !tomlFile! не существует ...
        set OK=
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Delete_tomlFile ()
rem --------------------------------------------------------------------------------
:Delete_tomlFile
rem beginfunction
    set tomlFile=pyproject.toml
    if exist "!tomlFile!" (
        echo Удаление файла %tomlFile%
        del %tomlFile%
    )
    
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo Creates a basic pyproject.toml file in the current directory ...
    set COMMAND=init
    
    rem call :Delete_tomlFile

    if not defined Read_N (
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    ) else (
        set APPRUN=!APP! !COMMAND!!OPTION! %*
    )
    echo APPRUN: !APPRUN!
    !APPRUN!

    exit /b 0
rem endfunction

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
    set name=
    set PN_CAPTION=Name of the package
    call :Read_P name "" || exit /b 1
    rem echo name: !name!
    if defined name (
        set OPTION=!OPTION! --name=!name!
    )
    set description=Description of the package
    set PN_CAPTION=Description of the package
    call :Read_P description "" || exit /b 1
    rem echo description: !description!
    if defined description (
        set OPTION=!OPTION! --description="!description!"
    )
    set author=lisitsinyr ^<lisitsinyr@gmail.com^>
    set PN_CAPTION=Author of the package
    call :Read_P author "" || exit /b 1
    rem echo author: !author!
    if defined author (
        set OPTION=!OPTION! --author="!author!"
    )
    set python=
    set PN_CAPTION=Compatible Python versions
    call :Read_P python "" || exit /b 1
    rem echo python: !python!
    if defined python (
        set OPTION=!OPTION! --python=!python!
    )
    set dependency=
    set PN_CAPTION=Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. ^(multiple values allowed^)
    call :Read_P dependency "" || exit /b 1
    rem echo dependency: !dependency!
    if defined dependency (
        set OPTION=!OPTION! --dependency=!dependency!
    )
    set dev-dependency=
    set PN_CAPTION=Package to require for development, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. ^(multiple values allowed^)
    call :Read_P dev-dependency "" || exit /b 1
    rem echo dev-dependency: !dev-dependency!
    if defined dev-dependency (
        set OPTION=!OPTION! --dev-dependency=!dev-dependency!
    )
    set license=
    set PN_CAPTION=License of the package
    call :Read_P license "" || exit /b 1
    rem echo license: !license!
    if defined license (
        set OPTION=!OPTION! --license=!license!
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:__SET_VAR_SCRIPT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_PROJECT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_KIX
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0

rem =================================================
rem LYRConst.bat
rem =================================================
rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
rem =================================================
rem LYRFileUtils.bat
rem =================================================
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
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLog.bat
rem =================================================
:FormatStr
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
rem =================================================
rem LYRStrUtils.bat
rem =================================================
rem =================================================
rem LYRSupport.bat
rem =================================================
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
