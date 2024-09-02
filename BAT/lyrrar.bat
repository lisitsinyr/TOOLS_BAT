@echo off
rem -------------------------------------------------------------------
rem lyrrar.bat
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
set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB

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
    set PN_CAPTION=Ввод значения archive
    set archive=archive
    call :Read_P archive %1 || exit /b 1
    rem echo archive: !archive!
    if not defined archive (
        echo ERROR: Параметр archive не задан...
        echo Использование: !BATNAME! архив [файлы]
        set OK=
    )

    call :FullFileName "!archive!" || exit /b 1
    rem echo FullFileName: !FullFileName!
    call :ExtractFileName "!archive!" || exit /b 1
    rem echo ExtractFileName: !ExtractFileName!
    call :ExtractFileNameWithoutExt "!archive!" || exit /b 1
    rem echo ExtractFileNameWithoutExt: !ExtractFileNameWithoutExt!
    call :FileAttr "!archive!" || exit /b 1
    rem echo FileAttr: !FileAttr!
    rem echo FOLDER: !FOLDER!

    if not defined FOLDER (
        set PN_CAPTION=Файлы
        set files=*.*
        call :Read_P files !files! || exit /b 1
        rem echo files: !files!    
        set ARGS=!ARGS! "!archive!.rar" "!files!"
    )

    if "!FOLDER!"=="D" (
        set ARGS=!ARGS! "!ExtractFileName!.rar" "!ExtractFileName!"
    )
    if "!FOLDER!"=="F" (
        set OPTION=
        set ARGS=!ARGS! "!ExtractFileNameWithoutExt!.rar" "!archive!"
    )
    
    if not defined Read_N (
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    ) else (
        set APPRUN=!APP! !COMMAND!!OPTION! %*
    )
    echo APPRUN: !APPRUN!
    !APPRUN!
    
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
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
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
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
