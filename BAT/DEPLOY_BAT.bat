@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT - ������� ��������
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� ��������
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� ��������
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: !SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� ��������
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
    )
    rem echo LIB_BAT: !LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 1
    )
    call :SET_LIB %~f0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!

    set PROJECT_GROUP=BAT
    
    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - ������� ������ ��������
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    call :WriteBEGIN ���������� ������: !PROJECT_GROUP!

    call :PressAnyKey

    set PROJECT_NAME=INFO_BAT
    call :WritePROCESS ������: !PROJECT_NAME!
    call :DEPLOY_PROJECT

    call :PressAnyKey

    set PROJECT_NAME=SCRIPTS_BAT
    call :WritePROCESS !PROJECT_NAME!
    call :DEPLOY_PROJECT

    rem call :PressAnyKey

    set PROJECT_NAME=TOOLS_SRC_BAT
    call :WritePROCESS !PROJECT_NAME!
    call :DEPLOY_PROJECT

    call :WriteEND !DIR_PROJECTS_ROOT!

    rem call :PressAnyKey

    exit /b 0
:end

rem =================================================
rem ������� LIB
rem =================================================

rem =================================================
rem LYRLIB.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0

rem =================================================
rem LYRConsole.bat
rem =================================================
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0

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
