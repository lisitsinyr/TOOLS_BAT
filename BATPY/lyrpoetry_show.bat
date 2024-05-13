@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_show.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Shows information about packages.
rem   To list all the available packages, you can use the show command.
rem 
rem Usage:
rem   show [options] [--] [<package>]
rem 
rem Arguments:
rem   package                    The package to inspect
rem 
rem Options:
rem       --without=WITHOUT      The dependency groups to ignore. (multiple values allowed)
rem       --with=WITH            The optional dependency groups to include. (multiple values allowed)
rem       --only=ONLY            The only dependency groups to include. (multiple values allowed)
rem       --no-dev               Do not list the development dependencies. (Deprecated)
rem   -t, --tree                 List the dependencies as a tree.
rem       --why                  When showing the full list, or a --tree for a single package, display whether they are a direct dependency or required by other packages
rem   -l, --latest               Show the latest version.
rem   -o, --outdated             Show the latest version but only for packages that are outdated.
rem   -a, --all                  Show all packages (even those not compatible with current system).
rem   -T, --top-level            Show only top-level dependencies.
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
rem   The show command displays detailed information about a package, or
rem   lists all packages available.
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

    echo Shows information about packages ...
    set COMMAND=show
    
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
    set without=
    set PN_CAPTION=The dependency groups to ignore. ^(multiple values allowed^)
    call :Read_P without "" || exit /b 1
    rem echo without: !without!
    if defined without (
        set OPTION=!OPTION! --without=!without!
    )
    set with=
    set PN_CAPTION=The optional dependency groups to include. ^(multiple values allowed^)
    call :Read_P with "" || exit /b 1
    rem echo with: !with!
    if defined with (
        set OPTION=!OPTION! --with=!with!
    )
    set only=
    set PN_CAPTION=he only dependency groups to include. ^(multiple values allowed^)
    call :Read_P only "" || exit /b 1
    rem echo only: !only!
    if not "!only!"=="" (
        set OPTION=!OPTION! --only=!only!
    )
    set no-dev=
    set PN_CAPTION=Do not list the development dependencies. ^(Deprecated^)
    call :Read_F no-dev "yN" || exit /b 1
    rem echo no-dev: !no-dev!
    if defined no-dev (
        set OPTION=!OPTION! --no-dev
    )
    set tree=
    set PN_CAPTION=List the dependencies as a tree
    call :Read_F tree "yN" || exit /b 1
    rem echo tree: !tree!
    if defined tree (
        set OPTION=!OPTION! --tree
    )
    set why=
    set PN_CAPTION=When showing the full list, or a --tree for a single package, display whether they are a direct dependency or required by other packages
    call :Read_F why "yN" || exit /b 1
    rem echo why: !why!
    if defined why (
        set OPTION=!OPTION! --why
    )
    set latest=
    set PN_CAPTION=Show the latest version
    call :Read_F latest "yN" || exit /b 1
    rem echo latest: !latest!
    if defined latest (
        set OPTION=!OPTION! --latest
    )
    set outdated=
    set PN_CAPTION=Show the latest version but only for packages that are outdated
    call :Read_F outdated "yN" || exit /b 1
    rem echo outdated: !outdated!
    if defined outdated (
        set OPTION=!OPTION! --outdated
    )
    set all=
    set PN_CAPTION=Show all packages (even those not compatible with current system)
    call :Read_F all "yN" || exit /b 1
    rem echo all: !all!
    if defined all (
        set OPTION=!OPTION! --all
    )
    set top-level=
    set PN_CAPTION=Only show explicitly defined packages
    call :Read_F top-level "yN" || exit /b 1
    rem echo top-level: !top-level!
    if defined top-level (
        set OPTION=!OPTION! --top-level
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set packages=
    set PN_CAPTION=The package to inspect
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
