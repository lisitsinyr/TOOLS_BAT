@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_add.bat
rem     «‡ÔÛÒÍ poetry ËÁ „ÎÓ·‡Î¸ÌÓ„Ó ‚ËÚÛ‡Î¸ÌÓ„Ó ÔÓÒÚ‡ÌÒÚ‚‡
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
rem   add - Adds a new dependency to pyproject.toml.
rem         The add command adds required packages to your pyproject.toml and installs them.
rem -------------------------------------------------------------------
rem   Options
rem   --group (-G): The group to add the dependency to.
rem   --dev (-D): Add package as development dependency. (Deprecated, use -G dev instead)
rem   --editable (-e): Add vcs/path dependencies as editable.
rem   --extras (-E): Extras to activate for the dependency. (multiple values allowed)
rem   --optional: Add as an optional dependency.
rem   --python: Python version for which the dependency must be installed.
rem   --platform: Platforms for which the dependency must be installed.
rem   --source: Name of the source to use to install the package.
rem   --allow-prereleases: Accept prereleases.
rem   --dry-run: Output the operations but do not execute anything (implicitly enables ñverbose).
rem   --lock: Do not perform install (only update the lockfile).
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo —Ú‡Ú %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Adds a new dependency to pyproject.toml ...
    set COMMAND=add
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
    set PN_CAPTION=The group to add the dependency to
    call :Read_P group %1 || exit /b 1
    rem echo group: %group%
    if not "%group%"=="" (
        set APPRUN=%APPRUN% --xxxx %group%
    )
    set editable=
    set PN_CAPTION=Add vcs/path dependencies as editable
    call :Read_P editable %1 || exit /b 1
    rem echo editable: %editable%
    if not "%editable%"=="" (
        set APPRUN=%APPRUN% --editable %editable%
    )
    set extras=
    set PN_CAPTION=Extras to activate for the dependency. (multiple values allowed)
    call :Read_P extras %1 || exit /b 1
    rem echo extras: %extras%
    if not "%extras%"=="" (
        set APPRUN=%APPRUN% --extras %extras%
    )
    set optional=
    set PN_CAPTION=Add as an optional dependency
    call :Read_P optional %1 || exit /b 1
    rem echo optional: %optional%
    if not "%optional%"=="" (
        set APPRUN=%APPRUN% --optional %optional%
    )
    set python=
    set PN_CAPTION=Python version for which the dependency must be installed
    call :Read_P python %1 || exit /b 1
    rem echo python: %python%
    if not "%python%"=="" (
        set APPRUN=%APPRUN% --python %python%
    )
    set platform=
    set PN_CAPTION=Platforms for which the dependency must be installed
    call :Read_P platform %1 || exit /b 1
    rem echo platform: %platform%
    if not "%platform%"=="" (
        set APPRUN=%APPRUN% --platform %platform%
    )
    set source=
    set PN_CAPTION=Name of the source to use to install the package
    call :Read_P source %1 || exit /b 1
    rem echo source: %source%
    if not "%source%"=="" (
        set APPRUN=%APPRUN% --source %source%
    )
    set allow-prereleases=
    set PN_CAPTION=Accept prereleases
    call :Read_P allow-prereleases %1 || exit /b 1
    rem echo allow-prereleases: %allow-prereleases%
    if not "%allow-prereleases%"=="" (
        set APPRUN=%APPRUN% --allow-prereleases %allow-prereleases%
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything (implicitly enables ñverbose)
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=Do not perform install (only update the lockfile)
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set APPRUN=%APPRUN% --lock %lock%
    )
:Exit
exit /b 0

rem =================================================
rem ‘”Õ ÷»» LIB
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
