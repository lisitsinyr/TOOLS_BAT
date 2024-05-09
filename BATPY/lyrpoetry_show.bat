@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_show.bat
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
rem   show - Shows information about packages.
rem          To list all the available packages, you can use the show command.
rem -------------------------------------------------------------------
rem   Options
rem   --without: The dependency groups to ignore.
rem   --why: When showing the full list, or a --tree for a single package, display whether they are a direct dependency or required by other packages.
rem   --with: The optional dependency groups to include.
rem   --only: The only dependency groups to include.
rem   --no-dev: Do not list the dev dependencies. (Deprecated, use --only main or --without dev instead)
rem   --tree: List the dependencies as a tree.
rem   --latest (-l): Show the latest version.
rem   --outdated (-o): Show the latest version but only for packages that are outdated.
rem   --all (-a): Show all packages (even those not compatible with current system).
rem   --top-level (-T): Only show explicitly defined packages.
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

    echo Shows information about packages ...
    set COMMAND=show
    set APPRUN=poetry -v %COMMAND%

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
    set without=
    set PN_CAPTION=The dependency groups to ignore
    call :Read_P without %1 || exit /b 1
    rem echo without: %without%
    if not "%without%"=="" (
        set APPRUN=%APPRUN% --without %without%
    )
    set why=
    set PN_CAPTION=When showing the full list, or a --tree for a single package, display whether they are a direct dependency or required by other packages
    call :Read_P why %1 || exit /b 1
    rem echo why: %why%
    if not "%why%"=="" (
        set APPRUN=%APPRUN% --why %why%
    )
    set with=
    set PN_CAPTION=The optional dependency groups to include
    call :Read_P with %1 || exit /b 1
    rem echo with: %with%
    if not "%with%"=="" (
        set APPRUN=%APPRUN% --with %with%
    )
    set only=
    set PN_CAPTION=The only dependency groups to include
    call :Read_P only %1 || exit /b 1
    rem echo only: %only%
    if not "%only%"=="" (
        set APPRUN=%APPRUN% --only %only%
    )
    set no-dev=
    set PN_CAPTION=Do not list the dev dependencies. (Deprecated, use --only main or --without dev instead)
    call :Read_P no-dev %1 || exit /b 1
    rem echo no-dev: %no-dev%
    if not "%no-dev%"=="" (
        set APPRUN=%APPRUN% --no-dev %no-dev%
    )
    set tree=
    set PN_CAPTION=List the dependencies as a tree
    call :Read_P tree %1 || exit /b 1
    rem echo tree: %tree%
    if not "%tree%"=="" (
        set APPRUN=%APPRUN% --tree %tree%
    )
    set latest=
    set PN_CAPTION=Show the latest version
    call :Read_P latest %1 || exit /b 1
    rem echo latest: %latest%
    if not "%latest%"=="" (
        set APPRUN=%APPRUN% --latest %latest%
    )
    set outdated=
    set PN_CAPTION=Show the latest version but only for packages that are outdated
    call :Read_P outdated %1 || exit /b 1
    rem echo outdated: %outdated%
    if not "%outdated%"=="" (
        set APPRUN=%APPRUN% --outdated %outdated%
    )
    set all=
    set PN_CAPTION=Show all packages (even those not compatible with current system)
    call :Read_P all %1 || exit /b 1
    rem echo all: %all%
    if not "%all%"=="" (
        set APPRUN=%APPRUN% --all %all%
    )
    set top-level=
    set PN_CAPTION=Only show explicitly defined packages
    call :Read_P top-level %1 || exit /b 1
    rem echo top-level: %top-level%
    if not "%top-level%"=="" (
        set APPRUN=%APPRUN% --top-level %top-level%
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
