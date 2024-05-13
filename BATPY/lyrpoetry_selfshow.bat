@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfshow.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Show packages from Poetry's runtime environment.
rem   The self show command behaves similar to the show command, but working within Poetry’s runtime environment. This lists all packages installed within the Poetry install environment.
rem 
rem Usage:
rem   self show [options] [--] [<package>]
rem 
rem Arguments:
rem   package                    The package to inspect
rem 
rem Options:
rem       --addons               List only add-on packages installed.
rem   -t, --tree                 List the dependencies as a tree.
rem   -l, --latest               Show the latest version.
rem   -o, --outdated             Show the latest version but only for packages that are outdated.
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
rem   The self show command behaves similar to the show command, but
rem   working within Poetry's runtime environment. This lists all packages installed within
rem   the Poetry install environment.
rem   
rem   To show only additional packages that have been added via self add and their
rem   dependencies use self show --addons.
rem   
rem   This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
rem   
rem -------------------------------------------------------------------
rem   Usage 
rem   To show only additional packages that have been added via self add and their dependencies use self show --addons.
rem     poetry self show
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

    echo Show packages from Poetry's runtime environment ...
    set COMMAND=self show
    
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

    set APP=poetry
    set OPTION= -v --no-ansi
    set ARGS=
    set APPRUN=

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set addons=
    set PN_CAPTION=List only add-on packages installed
    call :Read_F addons "yN" || exit /b 1
    rem echo addons: !addons!
    if defined addons (
        set OPTION=!OPTION! --addons
    )
    set tree=
    set PN_CAPTION=List the dependencies as a tree
    call :Read_F tree "yN" || exit /b 1
    rem echo tree: !tree!
    if defined tree (
        set OPTION=!OPTION! --tree
    )
    set latest=
    set PN_CAPTION=Show the latest version
    call :Read_F latest "" || exit /b 1
    rem echo latest: !latest!
    if defined latest (
        set OPTION=!OPTION! --latest
    )
    set outdated=
    set PN_CAPTION=Show the latest version but only for packages that are outdated
    call :Read_F outdated "yN" || exit /b 1
    rem echo outdated: !outdated!
    if defined outdated (
        set OPTION=!OPTION! --outdated
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set packages=
    set PN_CAPTION=The package to inspect
    call :Read_P packages "" || exit /b 1
    rem echo packages: !packages!
    if defined packages (
        set ARGS=!ARGS! !packages!
    ) else (
        echo ERROR: packages not defined ...
        set OK=
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
