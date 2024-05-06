@echo off
rem -------------------------------------------------------------------
rem poetry.bat
rem     Запуск poetry из глобального виртуального пространства
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

    set PN_CAPTION=Ввод значения
    set COMMAND=init
    rem set COMMAND=
    call :Check_P COMMAND %1 || exit /b 1
    rem echo COMMAND: %COMMAND%

    if "%COMMAND%"=="" (
        echo ERROR: Параметр COMMAND не задан...
        echo Использование: %BATNAME% COMMAND [P2] [...]
    ) else (
        call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
    )

    rem echo Использование: %BATNAME% [P1] [P2] [...]
    rem call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9

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
    echo COMMAND: %COMMAND%

    if "%COMMAND%"=="init" (
        call :poetry_init %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        echo ERROR: Параметр COMMAND не реализован...
        call :PressAnyKey || exit /b 1
    )
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_init ()
rem --------------------------------------------------------------------------------
:poetry_init
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    rem set PN_CAPTION=Ввод значения
    rem set PROJECT=test
    rem set PROJECT=
    rem call :Check_P PROJECT %2 || exit /b 1
    rem if "%PROJECT%"=="" (
    rem     echo ERROR: Параметр PROJECT не задан...
    rem     echo Использование: %BATNAME% COMMAND PROJECT
    rem ) else (
    rem     echo PROJECT: %PROJECT%
    rem )

    C:\Users\lyr\AppData\Local\Programs\Python\Python312\Scripts\poetry.exe %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    call :PressAnyKey || exit /b 1
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:Check_P
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
