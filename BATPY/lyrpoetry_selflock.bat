@echo off
rem -------------------------------------------------------------------
rem lyrpoetry_selflock.bat
rem -------------------------------------------------------------------
rem ������ poetry �� ����������� ������������ ������������
rem -------------------------------------------------------------------

Description:
  Lock the Poetry installation's system requirements.
  The self lock command reads this Poetry installation�s system pyproject.toml file. The system dependencies are locked in the corresponding poetry.lock file.

Usage:
  self lock [options]

Options:
      --no-update            Do not update locked versions, only refresh lock file.
      --check                Check that the poetry.lock file corresponds to the current version of pyproject.toml. (Deprecated) Use poetry check --lock instead.
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
  The self lock command reads this Poetry installation's system requirements as specified in the C:\Users\lyr\AppData\Roaming\pypoetry\pyproject.toml file.
  
  The system dependencies are locked in the C:\Users\lyr\AppData\Roaming\pypoetry\poetry.lock file.
  
rem -------------------------------------------------------------------
rem   Usage 
rem   The self lock command reads this Poetry installation�s system pyproject.toml file. The system dependencies are locked in the corresponding poetry.lock file.
rem     poetry self lock
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

    echo Lock the Poetry installation's system requirements ...
    set COMMAND=self lock
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
    set check=
    set PN_CAPTION=Verify that poetry.lock is consistent with pyproject.toml. (Deprecated
    call :Read_P check %1 || exit /b 1
    rem echo check: %check%
    if not "%check%"=="" (
        set OPTION=%OPTION% --check %check%
    )
    set no-update=
    set PN_CAPTION=Do not update locked versions, only refresh lock file
    call :Read_P no-update %1 || exit /b 1
    rem echo no-update: %no-update%
    if not "%no-update%"=="" (
        set OPTION=%OPTION% --no-update %no-update%
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
