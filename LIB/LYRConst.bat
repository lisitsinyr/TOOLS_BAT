@echo off
rem -------------------------------------------------------------------
rem LYRConst.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRConst
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0


rem -------------------------------------------------------------------
rem :__SET_VAR_SCRIPT
rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
rem     SCRIPT_FULLFILENAME=
rem SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
rem     SCRIPT_BASEFILENAME=
rem SCRIPT_FILENAME - Файл скрипта [имя]
rem     SCRIPT_FILENAME=
rem -------------------------------------------------------------------
rem :__SET_SCRIPTS_DIR
rem SCRIPTS_DIR - Каталог скриптов
rem     SCRIPTS_DIR=
rem -------------------------------------------------------------------
rem :__SET_VAR_DEFAULT
rem LOG_FILENAME - Файл журнала [имя]
rem     LOG_FILENAME=
rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
rem     DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
rem     LOG_FILENAME_FORMAT=FILENAME
rem LOG_OPT - Параметры журнала [11]
rem     LOG_OPT=11
rem -------------------------------------------------------------------
rem :__SET_VAR_PROJECTS
rem PROJECTS -
rem     PROJECTS=
rem CURRENT_SYSTEM -
rem     CURRENT_SYSTEM=
rem UNAME -
rem     UNAME=
rem USERNAME -
rem     USERNAME=
rem PROJECTS_LYR_DIR -
rem     PROJECTS_LYR_DIR=
rem PROJECTS_DIR -
rem     PROJECTS_DIR=
rem CURRENT_DIR - Текущий каталог
rem     CURRENT_DIR=

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRConst ()
rem --------------------------------------------------------------------------------
:LYRConst
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set touchRUN=touch -f
    set touchRUN=D:\TOOLS\EXE\touch.exe

    rem -------------------------------------------------------------------
    rem REPO_NAME - Имя репозитария
    set REPO_NAME=
    rem -------------------------------------------------------------------
    rem REPO_INI - Файл с параметрами репозитария
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: !REPO_INI!

    rem -------------------------------------------------------------------
    rem PROJECT_NAME - Имя проекта
    set PROJECT_NAME=
    rem -------------------------------------------------------------------
    rem PROJECT_INI - Файл с параметрами проекта
    set PROJECT_INI=PROJECT.ini
    rem echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!

    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%

    rem --------------------------------------------------------------------------------
    rem procedure __SET_VAR_PROJECTS ()
    rem --------------------------------------------------------------------------------
    rem -------------------------------------------------------------------
    rem PROJECTS - проект
    rem -------------------------------------------------------------------
    set PROJECTS=
    rem echo PROJECTS: !PROJECTS!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR -
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!
    
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR -
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=
    rem echo PROJECTS_DIR: !PROJECTS_DIR!

    rem -------------------------------------------------------------------
    rem CURRENT_SYSTEM -
    rem -------------------------------------------------------------------
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: !CURRENT_SYSTEM!

    rem -------------------------------------------------------------------
    rem UNAME - COMPUTERNAME
    rem -------------------------------------------------------------------
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: !UNAME!

    rem -------------------------------------------------------------------
    rem USERNAME - USERNAME
    rem -------------------------------------------------------------------
    set USERNAME=%USERNAME%
    rem echo USERNAME: !USERNAME!

    rem -------------------------------------------------------------------
    rem CURRENT_DIR - Текущий каталог
    rem -------------------------------------------------------------------
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: !CURRENT_DIR!

    rem --------------------------------------------------------------------------------
    rem procedure __SET_VAR_SCRIPT (FULLFILENAME)
    rem --------------------------------------------------------------------------------

    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%~f1
    rem echo SCRIPT_FULLFILENAME: !SCRIPT_FULLFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_BASEFILENAME=%~n1%~x1
    rem echo SCRIPT_BASEFILENAME: !SCRIPT_BASEFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_FILENAME - Файл скрипта [имя]
    rem -------------------------------------------------------------------
    set SCRIPT_FILENAME=%~n1
    rem echo SCRIPT_FILENAME: !SCRIPT_FILENAME!

    rem -------------------------------------------------------------------
    rem Файл скрипта: каталог
    rem -------------------------------------------------------------------
    set SCRIPT_FILEDIR=
    rem echo SCRIPT_FILEDIR: !SCRIPT_FILEDIR!

    rem -------------------------------------------------------------------
    rem Файл скрипта: расширение
    rem -------------------------------------------------------------------
    set SCRIPT_FILEEXT=
    rem echo SCRIPT_FILEEXT: !SCRIPT_FILEEXT!
   
    rem --------------------------------------------------------------------------------
    rem procedure __SET_VAR_DEFAULT (DEBUG)
    rem --------------------------------------------------------------------------------
    rem -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    rem -------------------------------------------------------------------
    rem set LOG_DIR=
    
    rem -------------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME=

    rem ------------------------------------------------------
    rem LOG_FILESCRIPT - Файл первого скрипта [имя]
    rem ------------------------------------------------------
    set LOG_FILESCRIPT=

    rem ------------------------------------------------------
    rem LOG_STR
    rem ------------------------------------------------------
    set LOG_STR=

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem -------------------------------------------------------------------
    rem set LOG_DT_FORMAT=

    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME_FORMAT=

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT -
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT='%Y%m%d'
    set LOG_DT_FORMAT_DEFAULT=%date:~6,4%%date:~3,2%%date:~0,2%
    rem echo LOG_DT_FORMAT_DEFAULT: !LOG_DT_FORMAT_DEFAULT!

    rem -------------------------------------------------------------------
    rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    rem -------------------------------------------------------------------
    set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: !DATETIME_STAMP!

    rem -------------------------------------------------------------------
    rem SLEEP - Number
    rem -------------------------------------------------------------------
    set /a SLEEP=0
    rem echo SLEEP: !SLEEP!

    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_LOG ()
rem --------------------------------------------------------------------------------
:__SET_LOG
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LOG
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - Параметры журнала [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_ADD (
        set /a LOG_FILE_ADD=0
    )
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!

    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - Параметры журнала [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_DT (
        set /a LOG_FILE_DT=0
    )

    rem ------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem -------------------------------------------------------------------
    if not defined LOG_DT_FORMAT (
        set LOG_DT_FORMAT=!LOG_DT_FORMAT_DEFAULT!
    )
    rem echo LOG_DT_FORMAT: !LOG_DT_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    rem -------------------------------------------------------------------
    if not defined LOG_FILENAME_FORMAT (
        set LOG_FILENAME_FORMAT=FILENAME
        rem set LOG_FILENAME_FORMAT=DATETIME
    )
    rem echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: !LOG_FILENAME_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD -
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_ADD (
        set /a LOG_FILE_ADD=0
    )
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!

    rem -------------------------------------------------------------------
    rem LOG_FILE_DT -
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_DT (
        set /a LOG_FILE_DT=0
    )
    rem echo LOG_FILE_DT: !LOG_FILE_DT!

    rem -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    rem -------------------------------------------------------------------
    if not defined LOG_DIR (
        set LOG_DIR=!PROJECTS_LYR_DIR!\LOG
    )
    rem echo LOG_DIR: !LOG_DIR!
    if not exist !LOG_DIR! (
        echo INFO: Dir !LOG_DIR! not exist
        rem echo INFO: Каталог "!LOG_DIR!" не существует...
        echo INFO: Create !LOG_DIR!
        mkdir "!LOG_DIR!"
        rem echo ERRORLEVEL: !ERRORLEVEL!
        if not !ERRORLEVEL!==0 (
            echo ERROR: Dir !LOG_DIR! not created...
            exit /b 1
        )
    )

    rem -------------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
    rem -------------------------------------------------------------------
    if not defined LOG_FILENAME (
        if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
            set LOG_FILENAME=!SCRIPT_FILENAME!
        ) else (
            if "!LOG_FILENAME_FORMAT!"=="DATETIME" (
                set LOG_FILENAME=!DATETIME_STAMP!
            ) else (
                echo ERROR: LOG_FILENAME_FORMAT not set...
                exit /b 1
            )
        )
    )
    if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
        if LOG_FILE_DT==1 (
           set LOG_FILENAME=!DATETIME_STAMP!_!LOG_FILENAME!
        )
    )
    rem echo LOG_FILENAME: !LOG_FILENAME!

    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set LOG_FULLFILENAME=!LOG_DIR!\!LOG_FILENAME!.log
    rem echo LOG_FULLFILENAME: !%LOG_FULLFILENAME!

    exit /b 0
rem endfunction

rem ===================================================================
