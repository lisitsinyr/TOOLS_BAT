@echo off
rem -------------------------------------------------------------------
rem PROJECT_PYcreate.bat
rem -------------------------------------------------------------------
rem 
rem Description:
rem   Создание проекта PROJECT_PY
rem 
rem Usage:
rem   setupPROJECT_PY.bat <ProjectName> <directory>
rem 
rem Arguments:
rem   name - имя проекта
rem   ProjectName - каталог проекта
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
    rem  echo CurrentDir: !CurrentDir!

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    set OK=yes
    rem call :MAIN_INIT %0 || exit /b 1
    rem call :MAIN_SET || exit /b 1
    rem call :StartLogFile || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN_CHECK_PARAMETR %* || exit /b 1
    call :MAIN %* || exit /b 1
    rem call :StopLogFile || exit /b 1

    exit /b 0
:end

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

        if exist "PROJECT.ini" (
        )

        echo Создание проекта !ProjectName! ...
        echo Directory: !Directory!
        if exist "!Directory!"\ (
            echo INFO: Каталог проекта "!Directory!" существует...
            set delete=N
            set PN_CAPTION=Удалить?
            call :Read_F delete "yN" 5 || exit /b 1
            if defined delete (
                echo Удаление каталога проекта "!Directory!"
                rmdir "!Directory!" /s
                mkdir "!Directory!"
            )

            set tomlFile="!Directory!"\pyproject.toml
            call :Check_tomlFile
            if defined OK (
                cd "!Directory!"
                call lyrpoetry_init.bat --name=!ProjectName!
                cd ..\
            ) else (
                call lyrpoetry_new.bat --name=!ProjectName! --src "!Directory!"
            )
        ) else (
            rem --------------------------
            rem POETRY
            rem --------------------------
            call lyrpoetry_new.bat --name=!ProjectName! --src "!Directory!"
        )

        cd "!Directory!"
        rem --------------------------
        rem Структура каталогов
        rem --------------------------
        call PROJECT_PYupdate.bat !ProjectName!

        rem --------------------------
        rem GIT
        rem --------------------------
        if exist ".git"\ (
            echo INFO: Repository exist ...
        ) else (
            call lyrgit_init.bat .\
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Check_tomlFile ()
rem --------------------------------------------------------------------------------
:Check_tomlFile
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    rem Проверка существования файла pyproject.toml
    rem set tomlFile=pyproject.toml
    if not exist "!tomlFile!" (
        echo ERROR: Файл !tomlFile! не существует ...
        set OK=
    ) else (
        set OK=yes
    )
    
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set PN_CAPTION=Имя проекта
    set ProjectName=test
    call :Read_P ProjectName %1 || exit /b 1
    rem echo ProjectName: !ProjectName!
    if not defined ProjectName (
        echo ERROR: ProjectName not defined ...
        set OK=
    )

    set PN_CAPTION=Каталог проекта
    set Directory=folder folder
    call :Read_P Directory %1 || exit /b 1
    echo Directory: !Directory!
    if not defined Directory (
        echo ERROR: Directory not defined ...
        set OK=
    )

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
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
:__SET_CHECK_PROJECT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_KIX
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
