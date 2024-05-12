@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selfadd.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Add additional packages to Poetry's runtime environment.
rem   The self add command installs Poetry plugins and make them available at runtime. Additionally, it can also be used to upgrade Poetry�s own dependencies or inject additional packages into the runtime environment
rem 
rem Usage:
rem   self add [options] [--] <name>...
rem 
rem Arguments:
rem   name                       The packages to add.
rem 
rem Options:
rem   -e, --editable             Add vcs/path dependencies as editable.
rem   -E, --extras=EXTRAS        Extras to activate for the dependency. (multiple values allowed)
rem       --source=SOURCE        Name of the source to use to install the package.
rem       --allow-prereleases    Accept prereleases.
rem       --dry-run              Output the operations but do not execute anything (implicitly enables --verbose).
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
rem   The self add command installs additional packages to Poetry's runtime environment.
rem   
rem   This is managed in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
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
    echo ����� !BATNAME! ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    echo Add additional packages to Poetry's runtime environment ...
    set COMMAND=self add
    
    set APP=poetry
    set OPTION= -v
    set ARGS=
    set APPRUN=
    set OK=yes

    rem ���������� ����������
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

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
rem procedure Check_tomlFile ()
rem --------------------------------------------------------------------------------
:Check_tomlFile
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    rem �������� ������������� ����� pyproject.toml
    set tomlFile=pyproject.toml
    if not exist "!tomlFile!" (
        echo ERROR: ���� !tomlFile! �� ���������� ...
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
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set editable=
    set PN_CAPTION=Add vcs/path dependencies as editable
    call :Read_F editable "yN" || exit /b 1
    rem echo editable: !editable!
    if defined editable (
        set OPTION=!OPTION! --editable
    )
    set extras=
    set PN_CAPTION=Extras to activate for the dependency. ^(multiple values allowed^)
    call :Read_P extras "" || exit /b 1
    rem echo extras: !extras!
    if defined extras (
        set OPTION=!OPTION! --extras=!extras!
    )
    set source=
    set PN_CAPTION=Name of the source to use to install the package
    call :Read_P source "" || exit /b 1
    rem echo source: !source!
    if defined source (
        set OPTION=!OPTION! --source=!source!
    )
    set allow-prereleases=
    set PN_CAPTION=Accept prereleases
    call :Read_F allow-prereleases "yN" || exit /b 1
    rem echo allow-prereleases: !allow-prereleases!
    if defined allow-prereleases (
        set OPTION=!OPTION! --allow-prereleases
    )
    set dry-run=
    set PN_CAPTION=Output the operations but do not execute anything ^(implicitly enables --verbose^)
    call :Read_F dry-run "yN" || exit /b 1
    rem echo dry-run: !dry-run!
    if defined dry-run (
        set OPTION=!OPTION! --dry-run
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������
    set name=
    set PN_CAPTION=The packages to add
    call :Read_P name "" || exit /b 1
    rem echo name: !name!
    if defined name (
        set ARGS=!ARGS! !name!
    ) else (
        echo ERROR: name not defined ...
        set OK=
    )
    
:Exit
exit /b 0

rem =================================================
rem ������� LIB
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
