@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_export.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Exports the lock file to alternative formats.
rem   This command exports the lock file to other formats.
rem 
rem Usage:
rem   export [options]
rem 
rem Options:
rem   -f, --format=FORMAT        Format to export to. Currently, only constraints.txt and requirements.txt are supported. [default: "requirements.txt"]
rem   -o, --output=OUTPUT        The name of the output file.
rem       --without-hashes       Exclude hashes from the exported file.
rem       --without-urls         Exclude source repository urls from the exported file.
rem       --dev                  Include development dependencies. (Deprecated)
rem       --without=WITHOUT      The dependency groups to ignore. (multiple values allowed)
rem       --with=WITH            The optional dependency groups to include. (multiple values allowed)
rem       --only=ONLY            The only dependency groups to include. (multiple values allowed)
rem   -E, --extras=EXTRAS        Extra sets of dependencies to include. (multiple values allowed)
rem       --all-extras           Include all sets of extra dependencies.
rem       --with-credentials     Include credentials for extra indices.
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
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
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

    echo Exports the lock file to alternative formats ...
    set COMMAND=export
    
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
    set format=
    set PN_CAPTION=Format to export to. Currently, only constraints.txt and requirements.txt are supported. [default: "requirements.txt"]
    call :Read_P format "" || exit /b 1
    rem echo format: !format!
    if not "!format!"=="" (
        set OPTION=!OPTION! --format=!format!
    )
    set output=
    set PN_CAPTION=The name of the output file
    call :Read_P output "" || exit /b 1
    rem echo output: !output!
    if not "!output!"=="" (
        set OPTION=!OPTION! --output=!output!
    )
    set without-hashes=
    set PN_CAPTION=Exclude hashes from the exported file
    call :Read_F without-hashes "yN" || exit /b 1
    rem echo without-hashes: !without-hashes!
    if not "!without-hashes!"=="" (
        set OPTION=!OPTION! --without-hashes
    )
    set without-urls=
    set PN_CAPTION=Exclude source repository urls from the exported file
    call :Read_F without-urls "yN" || exit /b 1
    rem echo without-urls: !without-urls!
    if not "!without-urls!"=="" (
        set OPTION=!OPTION! --without-urls
    )
    set dev=
    set PN_CAPTION=Include development dependencies. ^(Deprecated^)
    call :Read_F dev "yN" || exit /b 1
    rem echo dev: !dev!
    if not "!dev!"=="" (
        set OPTION=!OPTION! --dev
    )
    set without=
    set PN_CAPTION=The dependency groups to ignore. ^(multiple values allowed^)
    call :Read_P without "" || exit /b 1
    rem echo without: !without!
    if not "!without!"=="" (
        set OPTION=!OPTION! --without=!without!
    )
    set with=
    set PN_CAPTION=The optional dependency groups to include. ^(multiple values allowed^)
    call :Read_P with "" || exit /b 1
    rem echo with: !with!
    if not "!with!"=="" (
        set OPTION=!OPTION! --with=!with!
    )
    set only=
    set PN_CAPTION=The only dependency groups to include. ^(multiple values allowed^)
    call :Read_P only "" || exit /b 1
    rem echo only: !only!
    if not "!only!"=="" (
        set OPTION=!OPTION! --only=!only!
    )
    set extras=
    set PN_CAPTION=Extra sets of dependencies to include. ^(multiple values allowed^)
    call :Read_P extras "" || exit /b 1
    rem echo extras: !extras!
    if not "!extras!"=="" (
        set OPTION=!OPTION! --extras=!extras!
    )
    set all-extras=
    set PN_CAPTION=Include all sets of extra dependencies
    call :Read_F all-extras "yN" || exit /b 1
    rem echo all-extras: !all-extras!
    if not "!all-extras!"=="" (
        set OPTION=!OPTION! --all-extras
    )
    set with-credentials=
    set PN_CAPTION=Include credentials for extra indices
    call :Read_F with-credentials "yN" || exit /b 1
    rem echo with-credentials: !with-credentials!
    if not "!with-credentials!"=="" (
        set OPTION=!OPTION! --with-credentials
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
