@echo off
rem -------------------------------------------------------------------
rem INIT_TOOLS_SRC_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    rem -------------------------------------------------------------------
    rem Установка PROJECTS_LYR_DIR
    rem -------------------------------------------------------------------
    call :INIT_PROJECTS_LYR_DIR
    rem -------------------------------------------------------------------
    rem Установка проекта PATTERN
    rem -------------------------------------------------------------------
    call :INIT_PROJECT
    rem -------------------------------------------------------------------
    rem Установка LIB LYR
    rem -------------------------------------------------------------------
    call :INIT_LIB "$1"

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem --------------------------------------------------------------------------------
rem procedure INIT_PROJECTS_LYR_DIR ()
rem --------------------------------------------------------------------------------
:INIT_PROJECTS_LYR_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECTS_LYR_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - каталог проектов LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure INIT_PROJECT ()
rem -----------------------------------------------
:INIT_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if not defined INIT_PROJECT (
        rem -------------------------------------------------------------------
        rem Инициализация проекта PATTERN
        rem -------------------------------------------------------------------
        set PROJECT=TOOLS_SRC_BAT
        set PROJECTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
        set PROJECT_DIR=!PROJECTS_DIR!\!PROJECT!
        set LPROJECTSET=!PROJECT_DIR!\!PROJECT!_SET.bat
    
        if not exist "!LPROJECTSET!" (
            echo INFO: Файл "!LPROJECTSET!" не существует...
        ) else (
            echo INFO: Загрузка !LPROJECTSET! ...
            call "!LPROJECTSET!"
        )
        set INIT_PROJECT=1
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure INIT_LIB (SCRIPT)
rem -----------------------------------------------
:INIT_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if not defined INIT_LIB (
        rem -------------------------------------------------------------------
        rem SCRIPTS_DIR - каталог скриптов
        rem -------------------------------------------------------------------
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
        rem -------------------------------------------------------------------
        rem LIB_BAT - каталог библиотеки скриптов
        rem -------------------------------------------------------------------
        if not defined LIB_SH (
            set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
        )
        if not exist "!LIB_BAT!"\ (
            echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        ) else (
            rem -------------------------------------------------------------------
            rem Инициализация БИБЛИОТЕКИ LYR
            rem -------------------------------------------------------------------
            echo INFO: Инициализация БИБЛИОТЕКИ LYR !LIB_BAT! ...
            call "!LIB_BAT!"\LYRINIT.bat "$1"
        )
    )

    exit /b 0
rem endfunction
