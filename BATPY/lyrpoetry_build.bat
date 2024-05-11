@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_build.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Builds a package, as a tarball and a wheel by default.
rem   The build command builds the source and wheels archives.
rem 
rem Usage:
rem   build [options]
rem 
rem Options:
rem   -f, --format=FORMAT        Limit the format to either sdist or wheel.
rem   -o, --output=OUTPUT        Set output directory for build artifacts. Default is `dist`. [default: "dist"]
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
    echo ����� !BATNAME! ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    echo Builds a package, as a tarball and a wheel by default ...
    set COMMAND=build

    set APP=poetry
    set OPTION= -v --no-ansi
    set ARGS=
    set APPRUN=
    set OK=yes

    call :Check_tomlFile

    if defined OK (
        rem ���������� ����������
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
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set format=
    set PN_CAPTION=Limit the format to either sdist or wheel
    call :Read_P format %1 || exit /b 1
    rem echo format: !format!
    if defined format (
        set OPTION=!OPTION! --format !format!
    )
    set output=
    set PN_CAPTION=Set output directory for build artifacts. Default is `dist`. [default: "dist"]
    call :Read_P output %1 || exit /b 1
    rem echo output: !output!
    if defined output (
        set OPTION=!OPTION! --output !output!
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem �������� �� ������������ ���������

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
