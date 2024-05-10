@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_install.bat
rem     ������ poetry �� ����������� ������������ ������������

Description:
  Update the dependencies as according to the pyproject.toml file.
  In order to get the latest versions of the dependencies and to update the poetry.lock file, you should use the update command.

Usage:
  update [options] [--] [<packages>...]

Arguments:
  packages                   The packages to update

Options:
      --without=WITHOUT      The dependency groups to ignore. (multiple values allowed)
      --with=WITH            The optional dependency groups to include. (multiple values allowed)
      --only=ONLY            The only dependency groups to include. (multiple values allowed)
      --no-dev               Do not update the development dependencies. (Deprecated)
      --sync                 Synchronize the environment with the locked packages and the specified groups.
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
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Update the dependencies as according to the pyproject.toml file ...
    set COMMAND=update
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
    set PN_CAPTION=without
    call :Read_P without %1 || exit /b 1
    rem echo without: %without%
    if not "%without%"=="" (
        set OPTION=%OPTION% --without %without%
    )
    set with=
    set PN_CAPTION=with
    call :Read_P with %1 || exit /b 1
    rem echo with: %with%
    if not "%with%"=="" (
        set OPTION=%OPTION% --with %with%
    )
    set only=
    set PN_CAPTION=only
    call :Read_P only %1 || exit /b 1
    rem echo only: %only%
    if not "%only%"=="" (
        set OPTION=%OPTION% --only %only%
    )
    set dry-run=
    set PN_CAPTION=dry-run
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set OPTION=%OPTION% --dry-run %dry-run%
    )
    set no-dev=
    set PN_CAPTION=no-dev
    call :Read_P no-dev %1 || exit /b 1
    rem echo no-dev: %no-dev%
    if not "%no-dev%"=="" (
        set OPTION=%OPTION% --no-dev %no-dev%
    )
    set lock=
    set PN_CAPTION=lock
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set OPTION=%OPTION% --lock %lock%
    )
    set sync=
    set PN_CAPTION=sync
    call :Read_P sync %1 || exit /b 1
    rem echo sync: %sync%
    if not "%sync%"=="" (
        set OPTION=%OPTION% --sync %sync%
    )

:Exit
exit /b 0

rem =================================================
rem ������� LIB
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
