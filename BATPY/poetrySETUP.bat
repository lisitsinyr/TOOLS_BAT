@echo off
rem -------------------------------------------------------------------
rem poetrySETUP.bat
rem     ������ poetry �� ����������� ������������ ������������
rem 
rem -----------------------------------------------------
rem Config Directory
rem -----------------------------------------------------
rem Linux: $XDG_CONFIG_HOME/pypoetry or ~/.config/pypoetry
rem Windows: %APPDATA%\pypoetry
rem MacOS: ~/Library/Application Support/pypoetry
rem You can override the Config directory by setting the POETRY_CONFIG_DIR environment variable.
rem -----------------------------------------------------
rem Data Directory
rem -----------------------------------------------------
rem Linux: $XDG_DATA_HOME/pypoetry or ~/.local/share/pypoetry
rem Windows: %APPDATA%\pypoetry
rem MacOS: ~/Library/Application Support/pypoetry
rem You can override the Data directory by setting the POETRY_DATA_DIR or POETRY_HOME environment variables. If POETRY_HOME is set, it will be given higher priority.
rem C:\Users\lyr\AppData\Roaming\pypoetry\config.toml
rem [virtualenvs]
rem in-project = true
rem 
rem -----------------------------------------------------
rem Cache Directory
rem -----------------------------------------------------
rem Linux: $XDG_CACHE_HOME/pypoetry or ~/.cache/pypoetry
rem Windows: %LOCALAPPDATA%\pypoetry
rem MacOS: ~/Library/Caches/pypoetry
rem You can override the Cache directory by setting the POETRY_CACHE_DIR environment variable.
rem C:\Users\lyr\AppData\Local\pypoetry\Cache\cache
rem C:\Users\lyr\AppData\Local\pypoetry\Cache\virtualenvs
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

    call lyrpoetry_config.bat var value
    ...

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

    set dry-run=
    set PN_CAPTION=dry-run
    call :Read_P dry-run %1 || exit /b 1
    rem echo dry-run: %dry-run%
    if not "%dry-run%"=="" (
        set APPRUN=%APPRUN% --dry-run %dry-run%
    )
    set lock=
    set PN_CAPTION=lock
    call :Read_P lock %1 || exit /b 1
    rem echo lock: %lock%
    if not "%lock%"=="" (
        set APPRUN=%APPRUN% --lock %lock%
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
