@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfadd.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------

Description:
  Add additional packages to Poetry's runtime environment.
  The self add command installs Poetry plugins and make them available at runtime. Additionally, it can also be used to upgrade Poetry’s own dependencies or inject additional packages into the runtime environment

Usage:
  self add [options] [--] <name>...

Arguments:
  name                       The packages to add.

Options:
  -e, --editable             Add vcs/path dependencies as editable.
  -E, --extras=EXTRAS        Extras to activate for the dependency. (multiple values allowed)
      --source=SOURCE        Name of the source to use to install the package.
      --allow-prereleases    Accept prereleases.
      --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
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

Help:
  The self add command installs additional packages to Poetry's runtime environment.
  
  This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
  
  If you do not specify a version constraint, poetry will choose a suitable one based on the available package versions.
  
  You can specify a package in the following forms:
    - A single name (requests)
    - A name and a constraint (requests@^2.23.0)
    - A git url (git+https://github.com/python-poetry/poetry.git)
    - A git url with a revision (git+https://github.com/python-poetry/poetry.git#develop)
    - A git SSH url (git+ssh://github.com/python-poetry/poetry.git)
    - A git SSH url with a revision (git+ssh://github.com/python-poetry/poetry.git#develop)
    - A file path (../my-package/my-package.whl)
    - A directory (../my-package/)
    - A url (https://example.com/packages/my-package-0.1.0.tar.gz)
rem -------------------------------------------------------------------
rem   Usage 
rem   For example, to install the poetry-plugin-export plugin, you can run:
rem     poetry self add poetry-plugin-export
rem   To update to the latest poetry-core version, you can run:
rem     poetry self add poetry-core@latest
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

    echo Add additional packages to Poetry's runtime environment ...
    set COMMAND=self add
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
    set editable=
    set PN_CAPTION=Add vcs/path dependencies as editable
    call :Read_P editable %1 || exit /b 1
    rem echo editable: %editable%
    if not "%editable%"=="" (
        set OPTION=%OPTION% --editable %editable%
    )
    set extras=
    set PN_CAPTION=Extras to activate for the dependency. (multiple values allowed)
    call :Read_P extras %1 || exit /b 1
    rem echo extras: %extras%
    if not "%extras%"=="" (
        set OPTION=%OPTION% --extras %extras%
    )
    set allow-prereleases=
    set PN_CAPTION=Accept prereleases
    call :Read_P allow-prereleases %1 || exit /b 1
    rem echo allow-prereleases: %allow-prereleases%
    if not "%allow-prereleases%"=="" (
        set OPTION=%OPTION% --allow-prereleases %allow-prereleases%
    )
    set source=
    set PN_CAPTION=Name of the source to use to install the package
    call :Read_P source %1 || exit /b 1
    rem echo source: %source%
    if not "%source%"=="" (
        set OPTION=%OPTION% --source %source%
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything (implicitly enables –verbose)
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
