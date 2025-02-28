@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set PROJECT_GROUP=ALL
    
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
    rem DIR_PYTHON - Каталог
    rem -------------------------------------------------------------------
    set DIR_PYTHON=!PROJECTS_LYR_DIR!\CHECK_LIST\DESKTOP\Python\PROJECTS_PY
    rem echo DIR_PYTHON:!DIR_PYTHON!

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

    set APPRUN=!SCRIPTS_DIR!\SRC\BAT\99.DEPLOY\DEPLOY_Python.bat
    rem set APPRUN=DEPLOY_Python.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )

    set APPRUN=!SCRIPTS_DIR!\SRC\BAT\99.DEPLOY\DEPLOY_BAT.bat
    rem set APPRUN=DEPLOY_Python.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    
    set APPRUN=!SCRIPTS_DIR!\SRC\BAT\99.DEPLOY\DEPLOY_GIT.bat
    rem set APPRUN=DEPLOY_Python.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    
    set APPRUN=!SCRIPTS_DIR!\SRC\BAT\99.DEPLOY\DEPLOY_KIX.bat
    rem set APPRUN=DEPLOY_Python.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )
    

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
