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
    rem PROJECTS_LYR_ROOT - Каталог ROOT
    rem -------------------------------------------------------------------
    rem set PROJECTS_LYR_ROOT=D:\WORK\WIN
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Каталог проектов LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!
    if not exist "!PROJECTS_LYR_DIR!"\ (
        rem echo INFO: Dir "!PROJECTS_LYR_DIR!" not exist ...
        rem echo INFO: Create "!PROJECTS_LYR_DIR!" ...
        rem mkdir "!PROJECTS_LYR_DIR!"
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов BAT
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        rem set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        rem set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC
    )
    rem echo SCRIPTS_DIR:!SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_DEPLOY - Каталог скриптов DEPLOY
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_DEPLOY (
        set SCRIPTS_DIR_DEPLOY=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\SCRIPTS_BAT\99.DEPLOY
    )
    rem echo SCRIPTS_DIR_DEPLOY:!SCRIPTS_DIR_DEPLOY!
    
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_BAT.bat
    if exist "!APPRUN!" (
        rem echo [101;93m APPRUN:!APPRUN! [0m
        echo [31mAPPRUN:!APPRUN![0m
        rem echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_KIX.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_GIT.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_JAVA.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_Python.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_Pascal_Delphi.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
    )
    set APPRUN=!SCRIPTS_DIR_DEPLOY!\DEPLOY_UNIX.bat
    if exist "!APPRUN!" (
        echo APPRUN:!APPRUN!
        rem call !APPRUN!
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

rem =================================================
