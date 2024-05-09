@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_publishbuild.bat
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
rem   publish - Publishes a package to a remote repository.
rem             The build command builds the source and wheels archives.
rem -------------------------------------------------------------------
rem   Options
rem   --repository (-r): The repository to register the package to (default: pypi). Should match a repository name set by the config command.
rem   --username (-u): The username to access the repository.
rem   --password (-p): The password to access the repository.
rem   --cert: Certificate authority to access the repository.
rem   --client-cert: Client certificate to access the repository.
rem   --dist-dir: Dist directory where built artifact are stored. Default is dist.
rem   --build: Build the package before publishing.
rem   --dry-run: Perform all actions except upload the package.
rem   --skip-existing: Ignore errors from files already existing in the repository.
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

    echo Publishes a package to a remote repository ...
    set COMMAND=publish
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

    set repository=
    set PN_CAPTION=The repository to register the package to (default: pypi). Should match a repository name set by the config command
    call :Read_P repository %1 || exit /b 1
    rem echo repository: %repository%
    if not "%repository%"=="" (
        set APPRUN=%APPRUN% --repository %repository%
    )
    set username=
    set PN_CAPTION=The username to access the repository
    call :Read_P username %1 || exit /b 1
    rem echo username: %username%
    if not "%username%"=="" (
        set APPRUN=%APPRUN% --username %username%
    )
    set password=
    set PN_CAPTION=The password to access the repository
    call :Read_P password %1 || exit /b 1
    rem echo password: %password%
    if not "%password%"=="" (
        set APPRUN=%APPRUN% --password %password%
    )
    set cert=
    set PN_CAPTION=Certificate authority to access the repository
    call :Read_P cert %1 || exit /b 1
    rem echo cert: %cert%
    if not "%cert%"=="" (
        set APPRUN=%APPRUN% --cert %cert%
    )
    set client-cert=
    set PN_CAPTION=Client certificate to access the repository
    call :Read_P client-cert %1 || exit /b 1
    rem echo client-cert: %client-cert%
    if not "%client-cert%"=="" (
        set APPRUN=%APPRUN% --client-cert %client-cert%
    )
    set dist-dir=
    set PN_CAPTION=Dist directory where built artifact are stored. Default is dist
    call :Read_P dist-dir %1 || exit /b 1
    rem echo dist-dir: %dist-dir%
    if not "%dist-dir%"=="" (
        set APPRUN=%APPRUN% --dist-dir %dist-dir%
    )
    set build=
    set PN_CAPTION=Build the package before publishing
    call :Read_P build %1 || exit /b 1
    rem echo build: %build%
    if not "%build%"=="" (
        set APPRUN=%APPRUN% --build %build%
    )
    set dry-run=
    set PN_CAPTION=Perform all actions except upload the package
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set skip-existing=
    set PN_CAPTION=Ignore errors from files already existing in the repository
    call :Read_P skip-existing %1 || exit /b 1
    rem echo skip-existing: %skip-existing%
    if not "%skip-existing%"=="" (
        set APPRUN=%APPRUN% --skip-existing %skip-existing%
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
