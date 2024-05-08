@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_install.bat
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
rem   install - Installs the project dependencies.
rem          The install command reads the pyproject.toml file from the current project,
rem          resolves the dependencies, and installs them
rem -------------------------------------------------------------------
rem   Options
rem   --without: The dependency groups to ignore.
rem   --with: The optional dependency groups to include.
rem   --only: The only dependency groups to include.
rem   --only-root: Install only the root project, exclude all dependencies.
rem   --sync: Synchronize the environment with the locked packages and the specified groups.
rem   --no-root: Do not install the root package (your project).
rem   --no-directory: Skip all directory path dependencies (including transitive ones).
rem   --dry-run: Output the operations but do not execute anything (implicitly enables ñverbose).
rem   --extras (-E): Features to install (multiple values allowed).
rem   --all-extras: Install all extra features (conflicts with ñextras).
rem   --compile: Compile Python source files to bytecode.
rem   --no-dev: Do not install dev dependencies. (Deprecated, use --only main or --without dev instead)
rem   --remove-untracked: Remove dependencies not presented in the lock file. (Deprecated, use --sync instead)
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

    echo Installs the project dependencies ...
    set COMMAND=install
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
        set APPRUN=%APPRUN% --without %without%
    )
    set with=
    set PN_CAPTION=with
    call :Read_P with %1 || exit /b 1
    rem echo with: %with%
    if not "%with%"=="" (
        set APPRUN=%APPRUN% --with %with%
    )
    set only=
    set PN_CAPTION=only
    call :Read_P only %1 || exit /b 1
    rem echo only: %only%
    if not "%only%"=="" (
        set APPRUN=%APPRUN% --only %only%
    )
    set only-root=
    set PN_CAPTION=only-root
    call :Read_P only-root %1 || exit /b 1
    rem echo only-root: %only-root%
    if not "%only-root%"=="" (
        set APPRUN=%APPRUN% --only-root %only-root%
    )
    set sync=
    set PN_CAPTION=sync
    call :Read_P sync %1 || exit /b 1
    rem echo sync: %sync%
    if not "%sync%"=="" (
        set APPRUN=%APPRUN% --sync %sync%
    )
    set no-root=
    set PN_CAPTION=no-root
    call :Read_P no-root %1 || exit /b 1
    rem echo no-root: %no-root%
    if not "%no-root%"=="" (
        set APPRUN=%APPRUN% --no-root %no-root%
    )
    set no-directory=
    set PN_CAPTION=no-directory
    call :Read_P no-directory %1 || exit /b 1
    rem echo no-directory: %no-directory%
    if not "%no-directory%"=="" (
        set APPRUN=%APPRUN% --no-directory %no-directory%
    )
    set dry-run=
    set PN_CAPTION=dry-run
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set extra=
    set PN_CAPTION=extra
    call :Read_P extra %1 || exit /b 1
    rem echo extra: %extra%
    if not "%extra%"=="" (
        set APPRUN=%APPRUN% --extra %extra%
    )
    set all-extras=
    set PN_CAPTION=all-extras
    call :Read_P all-extras %1 || exit /b 1
    rem echo all-extras: %all-extras%
    if not "%all-extras%"=="" (
        set APPRUN=%APPRUN% --all-extras %all-extras%
    )
    set compile=
    set PN_CAPTION=compile
    call :Read_P compile %1 || exit /b 1
    rem echo compile: %compile%
    if not "%compile%"=="" (
        set APPRUN=%APPRUN% --compile %compile%
    )
    set no-dev=
    set PN_CAPTION=no-dev
    call :Read_P no-dev %1 || exit /b 1
    rem echo no-dev: %no-dev%
    if not "%no-dev%"=="" (
        set APPRUN=%APPRUN% --no-dev %no-dev%
    )
    set remove-untracked=
    set PN_CAPTION=remove-untracked
    call :Read_P remove-untracked %1 || exit /b 1
    rem echo remove-untracked: %remove-untracked%
    if not "%remove-untracked%"=="" (
        set APPRUN=%APPRUN% --remove-untracked %remove-untracked%
    )
    
    
    set xxxx=
    set PN_CAPTION=xxxx
    call :Read_P xxxx %1 || exit /b 1
    rem echo xxxx: %xxxx%
    if not "%xxxx%"=="" (
        set APPRUN=%APPRUN% --xxxx %xxxx%
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
