@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_sourceadd.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------

Description:
  Add source configuration for project.
  The source add command adds source configuration to the project.

Usage:
  source add [options] [--] <name> [<url>]

Arguments:
  name                       Source repository name.
  url                        Source repository URL. Required, except for PyPI, for which it is not allowed.

Options:
  -d, --default              Set this source as the default (disable PyPI). A default source will also be the fallback source if you add other sources. (Deprecated, use --priority)
  -s, --secondary            Set this source as secondary. (Deprecated, use --priority)
  -p, --priority=PRIORITY    Set the priority of this source. One of: default, primary, secondary, supplemental, explicit. Defaults to primary.
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
rem -------------------------------------------------------------------
rem   Usage 
rem   For example, to add the pypi-test source, you can run:
rem     poetry source add pypi-test https://test.pypi.org/simple/
rem   You cannot use the name pypi for a custom repository as it is reserved for use by the default PyPI source. However, you can set the priority of PyPI:
rem     poetry source add --priority=explicit pypi
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Add source configuration for project ...
    set COMMAND=source add
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

    set default=
    set PN_CAPTION=Set this source as the default (disable PyPI). Deprecated in favor of --priority
    call :Read_P default %1 || exit /b 1
    rem echo default: %default%
    if not "%default%"=="" (
        set OPTION=%OPTION% --default %default%
    )
    set secondary=
    set PN_CAPTION=Set this source as a secondary source. Deprecated in favor of --priority
    call :Read_P secondary %1 || exit /b 1
    rem echo secondary: %secondary%
    if not "%secondary%"=="" (
        set OPTION=%OPTION% --secondary %secondary%
    )
    set priority=
    set PN_CAPTION=Set the priority of this source. Accepted values are: default, secondary, supplemental, and explicit. Refer to the dedicated sections in Repositories for more information
    call :Read_P priority %1 || exit /b 1
    rem echo priority: %priority%
    if not "%priority%"=="" (
        set OPTION=%OPTION% --priority %priority%
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
