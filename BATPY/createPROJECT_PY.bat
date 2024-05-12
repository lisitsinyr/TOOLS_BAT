@echo off
rem -------------------------------------------------------------------
rem createPROJECT_PY.bat
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

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=!SCRIPTS_DIR!\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: !CurrentDir!

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    call :MAIN_FUNC %*

    if defined OK (
        echo Создание проекта !name! ...
        if exist "!name!"\ (
            echo ERROR: Каталог "!name!" существует...
            set delete=
            set PN_CAPTION=Удалить?
            call :Read_F delete "yN" || exit /b 1
            if defined delete (
                echo Удаление каталога "!folder!"
                rmdir "!name!" /s
            )
        ) else (
            mkdir "!name!"
        )
        rem call lyrpoetry_new.bat
    )

:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    set name=
    set PN_CAPTION=Имя проекта
    call :Read_P name %1 || exit /b 1
    rem echo name: !name!
    if defined name (
        set OK=yes
    ) else (
        echo ERROR: name not defined ...
        set OK=
    )

:Exit
exit /b 0

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
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
