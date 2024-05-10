@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_add.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Adds a new dependency to pyproject.toml.
rem   The add command adds required packages to your pyproject.toml and installs them.
rem 
rem Usage:
rem   add [options] [--] <name>...
rem 
rem Arguments:
rem   name                       The packages to add.
rem 
rem Options:
rem   -G, --group=GROUP          The group to add the dependency to. [default: "main"]
rem   -D, --dev                  Add as a development dependency. (Deprecated) Use --group=dev instead.
rem   -e, --editable             Add vcs/path dependencies as editable.
rem   -E, --extras=EXTRAS        Extras to activate for the dependency. (multiple values allowed)
rem       --optional             Add as an optional dependency.
rem       --python=PYTHON        Python version for which the dependency must be installed.
rem       --platform=PLATFORM    Platforms for which the dependency must be installed.
rem       --source=SOURCE        Name of the source to use to install the package.
rem       --allow-prereleases    Accept prereleases.
rem       --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
rem       --lock                 Do not perform operations (only update the lockfile).
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
rem   The add command adds required packages to your pyproject.toml and installs them.
rem   
rem   If you do not specify a version constraint, poetry will choose a suitable one based on the available package versions.
rem   
rem   You can specify a package in the following forms:
rem     - A single name (requests)
rem     - A name and a constraint (requests@^2.23.0)
rem     - A git url (git+https://github.com/python-poetry/poetry.git)
rem     - A git url with a revision (git+https://github.com/python-poetry/poetry.git#develop)
rem     - A git SSH url (git+ssh://github.com/python-poetry/poetry.git)
rem     - A git SSH url with a revision (git+ssh://github.com/python-poetry/poetry.git#develop)
rem     - A file path (../my-package/my-package.whl)
rem     - A directory (../my-package/)
rem     - A url (https://example.com/packages/my-package-0.1.0.tar.gz)
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    rem echo I want to go out with a bang^^!

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Adds a new dependency to pyproject.toml ...
    set COMMAND=add

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
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if "!DEBUG!"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set group=
    set PN_CAPTION=The group to add the dependency to
    call :Read_P group "" || exit /b 1
    rem echo group: %group%
    if not "%group%"=="" (
        set OPTION=%OPTION% --group %group%
    )
    set editable=
    set PN_CAPTION=Add vcs/path dependencies as editable
    call :Read_P editable "" || exit /b 1
    rem echo editable: %editable%
    if not "%editable%"=="" (
        set OPTION=%OPTION% --editable %editable%
    )
    set extras=
    set PN_CAPTION=Extras to activate for the dependency. ^(multiple values allowed^)
    call :Read_P extras "" || exit /b 1
    rem echo extras: %extras%
    if not "%extras%"=="" (
        set OPTION=%OPTION% --extras %extras%
    )
    set optional=
    set PN_CAPTION=Add as an optional dependency
    call :Read_P optional "" || exit /b 1
    rem echo optional: %optional%
    if not "%optional%"=="" (
        set OPTION=%OPTION% --optional %optional%
    )
    set python=
    set PN_CAPTION=Python version for which the dependency must be installed
    call :Read_P python "" || exit /b 1
    rem echo python: %python%
    if not "%python%"=="" (
        set OPTION=%OPTION% --python %python%
    )
    set platform=
    set PN_CAPTION=Platforms for which the dependency must be installed
    call :Read_P platform "" || exit /b 1
    rem echo platform: %platform%
    if not "%platform%"=="" (
        set OPTION=%OPTION% --platform %platform%
    )
    set source=
    set PN_CAPTION=Name of the source to use to install the package
    call :Read_P source "" || exit /b 1
    rem echo source: %source%
    if not "%source%"=="" (
        set OPTION=%OPTION% --source %source%
    )
    set allow-prereleases=
    set PN_CAPTION=Accept prereleases
    call :Read_P allow-prereleases "" || exit /b 1
    rem echo allow-prereleases: %allow-prereleases%
    if not "%allow-prereleases%"=="" (
        set OPTION=%OPTION% --allow-prereleases %allow-prereleases%
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything ^(implicitly enables -verbose^)
    call :Read_P dry-run "" || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set OPTION=%OPTION% --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=Do not perform install [only update the lockfile]
    call :Read_P lock "" || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set OPTION=%OPTION% --lock %lock%
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set names=
    set PN_CAPTION=names
    call :Read_P names "" || exit /b 1
    rem echo names: %names%
    rem Проверка на обязательные аргументы
    if defined names (
        set ARGS=%ARGS% %names%
    ) else (
        echo ERROR: names not defined ...
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
