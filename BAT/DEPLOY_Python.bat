@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT - Каталог скриптов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: !SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
    )
    rem echo LIB_BAT: !LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

    set PROJECT_GROUP=Python
    
    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - Каталог группы проектов
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Python\PROJECTS_PY
    rem echo DIR_PROJECT_ROOT:!DIR_PROJECT_ROOT!

    set PROJECT_NAME=APPInfo_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=EXAMPLES_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=FRAMEWORK_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=MobileAPP_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=PATTERN_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=PATTERNS_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=PROJECTS_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=SCRIPTS_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=SOFTWARE_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TEST_P312
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TEST_P313
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TEST_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TESTS_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TOOLS_SRC_PY
    call :DEPLOY_PROJECT

    set PROJECT_NAME=YOUTUBE_PY
    call :DEPLOY_PROJECT

    exit /b 0
:end
rem ===================================================================

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0

rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem =================================================
