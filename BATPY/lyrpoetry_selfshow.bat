@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfshow.bat
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
rem   self show - Show packages from Poetry's runtime environment.
rem               The self show command behaves similar to the show command, but working within Poetry’s runtime environment. This lists all packages installed within the Poetry install environment.
rem -------------------------------------------------------------------
rem   Usage 
rem   To show only additional packages that have been added via self add and their dependencies use self show --addons.
rem     poetry self show
rem   Options
rem   --addons: List only add-on packages installed.
rem   --tree: List the dependencies as a tree.
rem   --latest (-l): Show the latest version.
rem   --outdated (-o): Show the latest version but only for packages that are outdated.
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

    echo Show packages from Poetry's runtime environment ...
    set COMMAND=self show
    set APPRUN=poetry -v %COMMAND%

    set P1=
    call :Check_P P1 %1 || exit /b 1
   
    if "%P1%"=="" (
        call :MAIN_FUNC
        rem set APPRUN=poetry %*
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
    set addons=
    set PN_CAPTION=List only add-on packages installed
    call :Read_P addons %1 || exit /b 1
    rem echo addons: %addons%
    if not "%addons%"=="" (
        set APPRUN=%APPRUN% --addons %addons%
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
