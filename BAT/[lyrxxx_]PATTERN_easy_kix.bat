@echo off
rem -------------------------------------------------------------------
rem 
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem SCRIPTS_DIR - Каталог скриптов
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR (
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
)
rem -------------------------------------------------------------------
rem LIB_BAT - каталог библиотеки скриптов
rem -------------------------------------------------------------------
set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB

rem -------------------------------------------------------------------
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR_KIX (
    set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX
)

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=
    set /a LOG_FILE_ADD=0

    rem Количество аргументов
    call :Read_N %* || exit /b 1

    call :SET_LIB %0 || exit /b 1

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set OPTION=

    set O1_Name=O1
    set O1_Caption=O1_Caption
    set O1_Default=O1_Default
    set O1=!O1_Default!
    set PN_CAPTION=!O1_Caption!

    call :Read_P O1 !O1! || exit /b 1
    rem echo O1:!O1!
    if defined O1 (
        set OPTION=!OPTION! -!O1_Name! "!O1!"
    ) else (
        echo INFO: O1 [O1_Name:!O1_Name! O1_Caption:!O1_Caption!] not defined ...
    )
    
    echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set ARGS=

    set A1_Name=A1
    set A1_Caption=A1_Caption
    set A1_Default=A1_Default
    set A1=!A1_Default!
    set PN_CAPTION=!A1_Caption!
    call :Read_P A1 !A1! || exit /b 1
    rem echo A1:!A1!
    if defined A1 (
        set ARGS=!ARGS! "!A1!"
    ) else (
        echo ERROR: A1 [A1_Name:!A1_Name! A1_Caption:!A1_Caption!] not defined ... 
        set OK=
        exit /b 1
    )
    
    echo ARGS:!ARGS!

    rem set APP_KIX_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_KIX\KIX
    rem set APP_KIX=
    rem call :SET_KIX || exit /b 1
    rem if exist !APP_KIX_DIR!\!APP_KIX!.kix (
    rem     echo START !APP_KIX_DIR!\!APP_KIX!.kix ... 
    rem     kix32.exe !APP_KIX_DIR!\!APP_KIX!.kix "$A1=!A1!"
    rem )

    call :PressAnyKey || exit /b 1

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
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
