@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_new.bat
rem -------------------------------------------------------------------
rem Запуск poetry из глобального виртуального пространства
rem -------------------------------------------------------------------

Description:
  Creates a new Python project at <path>.

Usage:
  new [options] [--] <path>

Arguments:
  path                       The path to create the project at.

Options:
      --name=NAME            Set the resulting package name.
      --src                  Use the src layout for the project.
      --readme=README        Specify the readme file format. One of md (default) or rst
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
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%

    echo Creates a new Python project at ^<path^> ...
    set COMMAND=new
    set APPRUN=poetry %COMMAND%

    set P1=
    call :Check_P P1 %1 || exit /b 1
   
    if "%P1%"=="" (
        call :MAIN_FUNC
    ) else (
        set APPRUN=poetry %*
    )
    echo APPRUN: %APPRUN%
    %APPRUN%
    rem call :PressAnyKey || exit /b 1

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

    set folder=folder folder
    set PN_CAPTION=Folder
    call :Read_P folder || exit /b 1
    rem echo folder: %folder%

    if "%folder%"=="" (
        set tomlFile=pyproject.toml
        if exist "%tomlFile%" (
            echo Удаление файла %tomlFile%
            del %tomlFile%
        )
    ) else (
        if exist "%folder%"\ (
            echo ERROR: Каталог "%folder%" существует...
            echo Удаление каталога "%folder%"
            rmdir "%folder%" /s
        )
        set OPTION=%OPTION% "%folder%"
    )

    set name=test
    set PN_CAPTION=Name of the package
    call :Read_P name || exit /b 1
    rem echo name: %name%
    if not "%name%"=="" (
        set OPTION=%OPTION% --name %name%
    )

    set src=
    set PN_CAPTION=Use the src layout for the project
    call :Read_P src || exit /b 1
    rem echo src: %src%
    if not "%src%"=="" (
        set OPTION=%OPTION% --src
    )

    set readme=md
    set PN_CAPTION=Specify the readme file extension
    call :Read_P readme || exit /b 1
    rem echo readme: %readme%
    if not "%readme%"=="" (
        set OPTION=%OPTION% --readme %readme%
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
