@echo off
rem -------------------------------------------------------------------
rem updatePROJECT_PY.bat
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Создание проекта
rem 
rem Usage:
rem   createPROJECT_PY <name>
rem 
rem Arguments:
rem   name - Имя проекта
rem 
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    set DEBUG=

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    echo CurrentDir: !CurrentDir!

    set OK=yes
    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    rem call :StopLogFile || exit /b 1

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN ()
rem --------------------------------------------------------------------------------
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if defined OK (
        echo ProjectName: !ProjectName!

        call :CheckDir .devcontainer
        rem call :CheckDir .git
        call :CheckDir .idea
        call :CheckDir .venv
        call :CheckDir .vscode
        call :CheckDir BUILD
        call :CheckDir CONFIG
        call :CheckDir DATA
        call :CheckDir DIST
        call :CheckDir DOC
        call :CheckDir EXE
        call :CheckDir LOG
        call :CheckDir NOTEBOOKS
        call :CheckDir OUT
        call :CheckDir SRC
        call :CheckDir SRC\!ProjectName!
        call :CheckDir TESTS
        call :CheckDir WORK

        call :CheckFile .gitmodules
        call :CheckFile .pypirc
        call :CheckFile LICENSE
        call :CheckFile src\test\__init__.py
        call :CheckFile tests\__init__.py

        set DIR_TO=!CurrentDir!
        rem echo DIR_TO: !DIR_TO!

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
        rem echo DIR_FROM: !DIR_FROM!
        copy "!DIR_FROM!\lyrgit_push_main.bat" "!DIR_TO!" > NUL
        copy "!DIR_FROM!\lyrgit_init.bat" "!DIR_TO!"      > NUL

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PATTERN_PY
        rem echo DIR_FROM: !DIR_FROM!
        copy "!DIR_FROM!\.gitignore" "!DIR_TO!" > NUL

        set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\BATPY
        rem echo DIR_FROM: !DIR_FROM!
        copy "!DIR_FROM!\updatePROJECT_PY.bat" "!DIR_TO!" > NUL

        call :CheckFile UPDATE_!ProjectName!.bat

        set LFileName=README.md
        call :CheckFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo !ProjectName! >> !LFileName!
            echo ---------- >> !LFileName!
            echo You can use [GitHub-flavored Markdown]^(https://guides.github.com/features/mastering-markdown/^) >> !LFileName!
        )

        set LFileName=POETRY.ini
        call :CheckFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo PROJECT_NAME=!ProjectName! >> !LFileName!
        )

        set LFileName=PROJECT.ini
        call :CheckFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo PROJECT_NAME=!ProjectName! >> !LFileName!
        )

        set LFileName=REPO.ini
        call :CheckFile !LFileName!
        call :FileSize !LFileName!
        if !FileSize!==0 (
            echo # Это простой файл с настройками >> !LFileName!
            echo REPO_NAME=!ProjectName! >> !LFileName!
        )
    )

    exit /b 0
:end

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set PN_CAPTION=Имя проекта
    set ProjectName=test
    call :Read_P ProjectName %1 || exit /b 1
    rem echo name: !name!

    if not defined ProjectName (
        echo ERROR: ProjectName not defined ...
        set OK=
    ) else (
        set OK=yes
    )

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
:Read_F
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
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
