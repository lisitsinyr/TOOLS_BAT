@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_export.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------

Description:
  Exports the lock file to alternative formats.
  This command exports the lock file to other formats.

Usage:
  export [options]

Options:
  -f, --format=FORMAT        Format to export to. Currently, only constraints.txt and requirements.txt are supported. [default: "requirements.txt"]
  -o, --output=OUTPUT        The name of the output file.
      --without-hashes       Exclude hashes from the exported file.
      --without-urls         Exclude source repository urls from the exported file.
      --dev                  Include development dependencies. (Deprecated)
      --without=WITHOUT      The dependency groups to ignore. (multiple values allowed)
      --with=WITH            The optional dependency groups to include. (multiple values allowed)
      --only=ONLY            The only dependency groups to include. (multiple values allowed)
  -E, --extras=EXTRAS        Extra sets of dependencies to include. (multiple values allowed)
      --all-extras           Include all sets of extra dependencies.
      --with-credentials     Include credentials for extra indices.
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
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Exports the lock file to alternative formats ...
    set COMMAND=export
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

    set next-phase=
    set PN_CAPTION=Increment the phase of the current version
    call :Read_P next-phase %1 || exit /b 1
    rem echo next-phase: %next-phase%
    if not "%next-phase%"=="" (
        set OPTION=%OPTION% --next-phase %next-phase%
    )
    set short=
    set PN_CAPTION=Output the version number only
    call :Read_P short %1 || exit /b 1
    rem echo short: %short%
    if not "%short%"=="" (
        set OPTION=%OPTION% --short %short%
    )
    set dry-run=
    set PN_CAPTION=Do not update pyproject.toml file
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set OPTION=%OPTION% --dry-run %dry-run%
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
