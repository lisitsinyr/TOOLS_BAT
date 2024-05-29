@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_easy1.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem SCRIPTS_DIR - Каталог скриптов
rem -------------------------------------------------------------------
set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT

rem -------------------------------------------------------------------
rem LIB_BAT - каталог библиотеки скриптов
rem -------------------------------------------------------------------
set LIB_BAT=!SCRIPTS_DIR!\LIB

rem -------------------------------------------------------------------
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
rem -------------------------------------------------------------------
set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    call :SET_LIB %0 || exit /b 1

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set O1=
    if defined O1 (
        set OPTION=!OPTION! !O1!
    ) else (
        echo INFO: O1 not defined ...
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set A1=
    if defined A1 (
        set ARGS=!ARGS! !A1!
    ) else (
        echo ERROR: A1 not defined ...
        set OK=
    )
    
    rem call :SET_KIX || exit /b 1
    rem if exist %APP_KIX_DIR%\%APP_KIX% (
    rem     echo START script %APP_KIX_DIR%\%APP_KIX% ... >> %LOG_FULLFILENAME%
    rem     kix32.exe %APP_KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9"
    rem )

    rem call :Pause !SLEEP! || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRConst.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRConst.bat %*
exit /b 0
rem =================================================
rem LYRDateTime.bat
rem =================================================
rem =================================================
rem LYRFileUtils.bat
rem =================================================
rem =================================================
rem LYRLog.bat
rem =================================================
rem =================================================
rem LYRStrUtils.bat
rem =================================================
rem =================================================
rem LYRSupport.bat
rem =================================================
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
