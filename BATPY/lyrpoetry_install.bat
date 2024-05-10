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
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir%

    echo Installs the project dependencies ...
    set COMMAND=install
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    if "!Read_N!"=="" (
        call :MAIN_FUNC
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    ) else (
        set APPRUN=!APP! %*
    )
    echo APPRUN: !APPRUN!

    if defined OK (
        !APPRUN!
    )

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
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set without=
    set PN_CAPTION=without
    call :Read_P without "" || exit /b 1
    rem echo without: !without!
    if not "!without!"=="" (
        set OPTION=!OPTION! --without !without!
    )
    set with=
    set PN_CAPTION=with
    call :Read_P with "" || exit /b 1
    rem echo with: !with%
    if not "!with!"=="" (
        set OPTION=!OPTION! --with %with%
    )
    set only=
    set PN_CAPTION=only
    call :Read_P only "" || exit /b 1
    rem echo only: !only%
    if not "!only!"=="" (
        set OPTION=!OPTION! --only %only%
    )
    set only-root=
    set PN_CAPTION=only-root
    call :Read_P only-root "" || exit /b 1
    rem echo only-root: !only-root%
    if not "!only-root!"=="" (
        set OPTION=!OPTION! --only-root %only-root%
    )
    set sync=
    set PN_CAPTION=sync
    call :Read_P sync "" || exit /b 1
    rem echo sync: !sync%
    if not "!sync!"=="" (
        set OPTION=!OPTION! --sync %sync%
    )
    set no-root=
    set PN_CAPTION=no-root
    call :Read_P no-root "" || exit /b 1
    rem echo no-root: !no-root%
    if not "!no-root!"=="" (
        set OPTION=!OPTION! --no-root %no-root%
    )
    set no-directory=
    set PN_CAPTION=no-directory
    call :Read_P no-directory "" || exit /b 1
    rem echo no-directory: !no-directory%
    if not "!no-directory!"=="" (
        set OPTION=!OPTION! --no-directory %no-directory%
    )
    set dry-run=
    set PN_CAPTION=dry-run
    call :Read_P dry-run "" || exit /b 1
    rem echo dry-run: !dry-run%
    if not "!dry-run!"=="" (
        set OPTION=!OPTION! --dry-run %dry-run%
    )
    set extra=
    set PN_CAPTION=extra
    call :Read_P extra "" || exit /b 1
    rem echo extra: !extra%
    if not "!extra!"=="" (
        set OPTION=!OPTION! --extra %extra%
    )
    set all-extras=
    set PN_CAPTION=all-extras
    call :Read_P all-extras "" || exit /b 1
    rem echo all-extras: !all-extras%
    if not "!all-extras!"=="" (
        set OPTION=!OPTION! --all-extras %all-extras%
    )
    set compile=
    set PN_CAPTION=compile
    call :Read_P compile "" || exit /b 1
    rem echo compile: !compile%
    if not "!compile!"=="" (
        set OPTION=!OPTION! --compile %compile%
    )
    set no-dev=
    set PN_CAPTION=no-dev
    call :Read_P no-dev "" || exit /b 1
    rem echo no-dev: !no-dev%
    if not "!no-dev!"=="" (
        set OPTION=!OPTION! --no-dev %no-dev%
    )
    set remove-untracked=
    set PN_CAPTION=remove-untracked
    call :Read_P remove-untracked "" || exit /b 1
    rem echo remove-untracked: !remove-untracked%
    if not "!remove-untracked!"=="" (
        set OPTION=!OPTION! --remove-untracked %remove-untracked%
    )
    
    
    set xxxx=
    set PN_CAPTION=xxxx
    call :Read_P xxxx "" || exit /b 1
    rem echo xxxx: !xxxx!
    if not "!xxxx!"=="" (
        set OPTION=!OPTION! --xxxx !xxxx!
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
