@echo off
rem -------------------------------------------------------------------
rem rard.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem SCRIPTS_DIR - Каталог скриптов
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR (
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_SRC_BAT
)

rem -------------------------------------------------------------------
rem LIB_BAT - каталог библиотеки скриптов
rem -------------------------------------------------------------------
set LIB_BAT=!SCRIPTS_DIR!\LIB

rem -------------------------------------------------------------------
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR_KIX (
    set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_SRC_KIX
)

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    call :SET_LIB %0 || exit /b 1

    rem -------------------------------------------------------------------
    rem rar - 
    rem -------------------------------------------------------------------
    set APP=rar
    set COMMAND=a
    set OPTION= -r
    set ARGS=
    set APPRUN=
    
    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set O1=
    if defined O1 (
        set OPTION=!OPTION! !O1!
    )
    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set PN_CAPTION=Ввод значения directory
    set directory=
    call :Check_P directory %1 || exit /b 1
    echo directory: !directory!
    if defined directory (
        set ARGS=!ARGS! !directory! !directory!
    ) else (
        echo ERROR: directory not defined ...
        echo Использование: !BATNAME! папка
        set OK=
    )
    
    if not defined Read_N (
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
        exit /b 1
    ) else (
        set APPRUN=!APP! !COMMAND!!OPTION! %*
    )
    echo APPRUN: !APPRUN!
    !APPRUN!

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
