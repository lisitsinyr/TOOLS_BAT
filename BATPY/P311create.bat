@echo off
rem -------------------------------------------------------------------
rem P311create.bat
rem     Создание виртуального окружения
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB

    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir%

    rem set PN_CAPTION=Ввод значения
    set P1=P1_default
    set P1=
    call :Check_P P1 %1 || exit /b 1
    rem echo P1: !P1%    

    rem set PN_CAPTION=Ввод значения
    set P2=P2_default
    set P2=
    call :Check_P P2 %2 || exit /b 1
    rem echo P2: !P2%    

    rem if "!P1!"=="" (
    rem     echo ERROR: Параметр P1 не задан...
    rem     echo Использование: !BATNAME% P1 [P2] [...]
    rem ) else (
    rem     call :MAIN_FUNC
    rem )

    echo Использование: !BATNAME% [P1] [P2] [...]
    call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9

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

    C:\Users\lyr\AppData\Local\Programs\Python\Python311\python.exe -m venv D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\VENV\P311

    exit /b 0
rem endfunction

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
