@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_remove.bat
rem     Запуск poetry из глобального виртуального пространства

Description:
  Removes a package from the project dependencies.
  The remove command removes a package from the current list of installed packages.

Usage:
  remove [options] [--] <packages>...

Arguments:
  packages                   The packages to remove.

Options:
  -G, --group=GROUP          The group to remove the dependency from.
  -D, --dev                  Remove a package from the development dependencies. (Deprecated) Use --group=dev instead.
      --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
      --lock                 Do not perform operations (only update the lockfile).
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
  The remove command removes a package from the current
  list of installed packages
  
  poetry remove
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

    echo Removes a package from the project dependencies ...
    set COMMAND=remove
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
    set group=
    set PN_CAPTION=The group to remove the dependency from
    call :Read_P group %1 || exit /b 1
    rem echo group: %group%
    if not "%group%"=="" (
        set OPTION=%OPTION% --group %group%
    )
    set dev=
    set PN_CAPTION=Removes a package from the development dependencies. (Deprecated, use -G dev instead)
    call :Read_P dev %1 || exit /b 1
    rem echo dev: %dev%
    if not "%dev%"=="" (
        set OPTION=%OPTION% --dev %dev%
    )
    set dry-run=
    set PN_CAPTION=Outputs the operations but will not execute anything (implicitly enables –verbose)
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set OPTION=%OPTION% --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=Do not perform operations (only update the lockfile)
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set OPTION=%OPTION% --lock %lock%
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
