@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_install.bat
rem     Запуск poetry из глобального виртуального пространства
rem 
rem Description:
rem   Installs the project dependencies.
rem   The install command reads the pyproject.toml file from the current project, resolves the dependencies, and installs them
rem 
rem Usage:
rem   install [options]
rem 
rem Options:
rem       --without=WITHOUT      The dependency groups to ignore. (multiple values allowed)
rem       --with=WITH            The optional dependency groups to include. (multiple values allowed)
rem       --only=ONLY            The only dependency groups to include. (multiple values allowed)
rem       --no-dev               Do not install the development dependencies. (Deprecated)
rem       --sync                 Synchronize the environment with the locked packages and the specified groups.
rem       --no-root              Do not install the root package (the current project).
rem       --no-directory         Do not install any directory path dependencies; useful to install dependencies without source code, e.g. for caching of Docker layers)
rem       --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
rem       --remove-untracked     Removes packages not present in the lock file. (Deprecated)
rem   -E, --extras=EXTRAS        Extra sets of dependencies to install. (multiple values allowed)
rem       --all-extras           Install all extra dependencies.
rem       --only-root            Exclude all dependencies.
rem       --compile              Compile Python source files to bytecode. (This option has no effect if modern-installation is disabled because the old installer always compiles.)
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
rem   The install command reads the poetry.lock file from
rem   the current directory, processes it, and downloads and installs all the
rem   libraries and dependencies outlined in that file. If the file does not
rem   exist it will look for pyproject.toml and do the same.
rem   
rem   poetry install
rem   
rem   By default, the above command will also install the current project. To install only the
rem   dependencies and not including the current project, run the command with the
rem   --no-root option like below:
rem   
rem    poetry install --no-root
rem   
rem   If you want to use Poetry only for dependency management but not for packaging,
rem   you can set the "package-mode" to false in your pyproject.toml file.
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

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!
    set APP=poetry
    set OPTION= -v --no-ansi
    set ARGS=
    set APPRUN=

    set OK=yes
    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
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

    echo Installs the project dependencies ...
    set COMMAND=install
    
    call :Check_tomlFile

    if defined OK (
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
    set PN_CAPTION=The only dependency groups to include. ^(multiple values allowed^)
    call :Read_P only "" || exit /b 1
    rem echo only: !only!
    if defined only (
        set OPTION=!OPTION! --only=!only!
    )
    set no-dev=
    set PN_CAPTION=Do not install the development dependencies. (Deprecated)
    call :Read_F no-dev "yN" || exit /b 1
    rem echo no-dev: !no-dev!
    if defined no-dev (
        set OPTION=!OPTION! --no-dev
    )
    set sync=
    set PN_CAPTION=Synchronize the environment with the locked packages and the specified groups
    call :Read_F sync "yN" || exit /b 1
    rem echo sync: !sync!
    if defined sync (
        set OPTION=!OPTION! --sync
    )
    set no-root=
    set PN_CAPTION=Do not install the root package (the current project)
    call :Read_F no-root "yN" || exit /b 1
    rem echo no-root: !no-root!
    if defined no-root (
        set OPTION=!OPTION! --no-root
    )
    set no-directory=
    set PN_CAPTION=Do not install any directory path dependencies; useful to install dependencies without source code, e.g. for caching of Docker layers
    call :Read_F no-directory "yN" || exit /b 1
    rem echo no-directory: !no-directory!
    if defined no-directory (
        set OPTION=!OPTION! --no-directory
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything ^(implicitly enables --verbose^)
    call :Read_F dry-run "yN" || exit /b 1
    rem echo dry-run: !dry-run!
    if defined dry-run (
        set OPTION=!OPTION! --dry-run
    )
    set remove-untracked=
    set PN_CAPTION=Removes packages not present in the lock file. ^(Deprecated^)
    call :Read_F remove-untracked "yN" || exit /b 1
    rem echo remove-untracked: !remove-untracked!
    if defined remove-untracked (
        set OPTION=!OPTION! --remove-untracked
    )
    set extras=
    set PN_CAPTION=Extra sets of dependencies to install. ^(multiple values allowed^)
    call :Read_P extras "" || exit /b 1
    rem echo extras: !extras!
    if defined extras (
        set OPTION=!OPTION! --extras=!extras!
    )
    set all-extras=
    set PN_CAPTION=Install all extra dependencies
    call :Read_F all-extras "yN" || exit /b 1
    rem echo all-extras: !all-extras!
    if defined all-extras (
        set OPTION=!OPTION! --all-extras
    )
    set only-root=
    set PN_CAPTION=Exclude all dependencies
    call :Read_F only-root "yN" || exit /b 1
    rem echo only-root: !only-root!
    if defined only-root (
        set OPTION=!OPTION! --only-root
    )
    set compile=
    set PN_CAPTION=Compile Python source files to bytecode. ^(This option has no effect if modern-installation is disabled because the old installer always compiles.^)
    call :Read_F compile "yN" || exit /b 1
    rem echo compile: !compile!
    if defined compile (
        set OPTION=!OPTION! --compile
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы

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
