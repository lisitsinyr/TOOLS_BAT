@echo off
rem -------------------------------------------------------------------
rem lyrrar.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=
    set OK=yes

    call :MAIN_INIT %0 || exit /b 1
    call :__SET_MAIN %0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!
    rem call :StartLogFile || exit /b 1
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
    if defined OK (
        call :MAIN %* || exit /b 1
    )
    rem call :StopLogFile || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SET ()
rem --------------------------------------------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    rem set APP=poetry
    rem set OPTION= -v --no-ansi
    rem set ARGS=
    rem set APPRUN=
    rem set tomlFile=pyproject.toml
    rem call :CheckFile tomlFile
    rem if not defined CheckFile (
    rem     echo ERROR: Файл !tomlFile! не существует ...
    rem     set OK=
    rem )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_CHECK_PARAMETR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set RARCMD=

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set PN_CAPTION=Ввод значения archive
    set archive=
    call :Check_P archive %1 || exit /b 1
    rem echo archive: !archive!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы
    
    if not defined archive (
        echo ERROR: Параметр archive не задан...
        echo Использование: !BATNAME! архив [файлы]
        set OK=
    ) else (
        call :ExtractFileName "!archive!" || exit /b 1
        rem echo ExtractFileName: !ExtractFileName!
        call :ExtractFileNameWithoutExt "!archive!" || exit /b 1
        rem echo ExtractFileNameWithoutExt: !ExtractFileNameWithoutExt!
        call :FileAttr "!archive!" || exit /b 1
        rem echo FileAttr: !FileAttr!
        rem echo FOLDER: !FOLDER!
        call :FullFileName "!archive!" || exit /b 1
        rem echo FullFileName: !FullFileName!
        if "!FOLDER!"=="D" (
            set RARCMD=rar a -r "!ExtractFileName!.rar" "!ExtractFileName!"
        )
        if "!FOLDER!"=="F" (
            set RARCMD=rar a "!ExtractFileNameWithoutExt!.rar" "!archive!"
        )
        if not defined FOLDER (
            set PN_CAPTION=Файлы
            set files=*.*
            call :Check_P files !files! || exit /b 1
            rem echo files: !files!    
            set RARCMD=rar a -r "!archive!.rar" "!files!"
        )
    )
    echo RARCMD: !RARCMD!

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN ()
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    
    !RARCMD!
    
    rem call :Pause !SLEEP! || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:__SET_TEST
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_MAIN
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_SCRIPT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
rem =================================================
rem LYRConst.bat
rem =================================================
rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
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
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLog.bat
rem =================================================
:FormatStr
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
rem =================================================
rem LYRStrUtils.bat
rem =================================================
rem =================================================
rem LYRSupport.bat
rem =================================================
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
