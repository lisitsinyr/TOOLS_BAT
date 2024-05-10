@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfshow.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------

Description:
  Show packages from Poetry's runtime environment.
  The self show command behaves similar to the show command, but working within Poetry’s runtime environment. This lists all packages installed within the Poetry install environment.

Usage:
  self show [options] [--] [<package>]

Arguments:
  package                    The package to inspect

Options:
      --addons               List only add-on packages installed.
  -t, --tree                 List the dependencies as a tree.
  -l, --latest               Show the latest version.
  -o, --outdated             Show the latest version but only for packages that are outdated.
  -h, --help                 Display help for the given command. When no command is given display help for the list command.
  -q, --quiet                Do not output any message.
  -V, --version              Display this application version.
      --ansi                 Force ANSI output.
      --no-ansi              Disable ANSI output.
  -n, --no-interaction       Do not ask any interactive question.
      --no-plugins           Disables plugins.
      --no-cache             Disables Poetry source caches.
  -C, --directory=DIRECTORY  The working directory for the Poetry command (defaults to the current working directory).
  -v|vv|vvv, --verbose       Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.

Help:
  The self show command behaves similar to the show command, but
  working within Poetry's runtime environment. This lists all packages installed within
  the Poetry install environment.
  
  To show only additional packages that have been added via self add and their
  dependencies use self show --addons.
  
  This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
  
rem -------------------------------------------------------------------
rem   Usage 
rem   To show only additional packages that have been added via self add and their dependencies use self show --addons.
rem     poetry self show
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
        set OPTION=%OPTION% --addons %addons%
    )
    set tree=
    set PN_CAPTION=List the dependencies as a tree
    call :Read_P tree %1 || exit /b 1
    rem echo tree: %tree%
    if not "%tree%"=="" (
        set OPTION=%OPTION% --tree %tree%
    )
    set latest=
    set PN_CAPTION=Show the latest version
    call :Read_P latest %1 || exit /b 1
    rem echo latest: %latest%
    if not "%latest%"=="" (
        set OPTION=%OPTION% --latest %latest%
    )
    set outdated=
    set PN_CAPTION=Show the latest version but only for packages that are outdated
    call :Read_P outdated %1 || exit /b 1
    rem echo outdated: %outdated%
    if not "%outdated%"=="" (
        set OPTION=%OPTION% --outdated %outdated%
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
