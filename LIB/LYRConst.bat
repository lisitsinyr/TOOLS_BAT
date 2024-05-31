@echo off
rem -------------------------------------------------------------------
rem LYRConst.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

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

rem -------------------------------------------------------------------
rem :SET_CHECK_REPO

rem REPO_NAME - Имя репозитария
rem     REPO_NAME=
rem REPO_INI - Файл с параметрами репозитария
rem     REPO_INI=REPO.ini

rem -------------------------------------------------------------------
rem :SET_CHECK_PROJECT
rem PROJECT_NAME - проекта
rem     PROJECT_NAME=
rem PROJECT_INI - Файл с параметрами проекта
rem     PROJECT_INI=PROJECT.ini

rem -------------------------------------------------------------------
rem :SET_CHECK_POETRY
rem PROJECT_NAME - проекта
rem     PROJECT_NAME=
rem POETRY_INI - Файл с параметрами проекта
rem     POETRY_INI=POETRY.ini

rem -------------------------------------------------------------------
rem :__SET_LOG
rem LOG_DT_FORMAT -
rem     LOG_DT_FORMAT=
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
rem     LOG_FILENAME_FORMAT=
rem LOG_FILE_ADD - Параметры журнала [0]
rem     LOG_FILE_ADD=  
rem LOG_FILE_DT - Параметры журнала [0]
rem     LOG_FILE_DT=
rem LOG_DIR - Каталог журнала
rem     LOG_DIR=
rem LOG_FILENAME - Файл журнала [имя]
rem     LOG_FILENAME=
rem LOG_FILESCRIPT - Файл первого скрипта [имя]
rem     LOG_FILESCRIPT=
rem LOG_STR -
rem     LOG_STR=
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
rem KIX_DIR - Каталог с файлами .KIX
rem     KIX_DIR=
rem APP_KIX_DIR - каталог APP_KIX
rem     APP_KIX_DIR=
rem APP_KIX - Скрипт APP_KIX [имя+расширение]
rem     APP_KIX=lyrxxx_ШАБЛОН.kix
rem -------------------------------------------------------------------
rem LIB_KIX - Каталог библиотеки KIX
rem     LIB_KIX=
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem :LYRConst
rem :SET_LIB
rem :SET_KIX

rem :__SET_VAR_DEFAULT
rem :__SET_VAR_PROJECTS
rem :__SET_VAR_SCRIPT
rem :__SET_LOG

rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

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

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure SET_LIB (ASCRIPT)
rem -----------------------------------------------
:SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    set ASCRIPT=%1

    call :__SET_VAR_SCRIPT !ASCRIPT! || exit /b 1
    call :__SET_VAR_DEFAULT || exit /b 1
    call :__SET_VAR_PROJECTS || exit /b 1
    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :SET_POETRY ()
rem --------------------------------------------------------------------------------
:SET_POETRY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem POETRY - 
    rem -------------------------------------------------------------------
    set APP=poetry
    set OPTION= -v --no-ansi
    set OPTION= -v --ansi
    set ARGS=
    set APPRUN=
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :SET_KIX ()
rem --------------------------------------------------------------------------------
:SET_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem KIX_DIR - Каталог с файлами .KIX
    rem -------------------------------------------------------------------
    set KIX_DIR=
    
    rem -------------------------------------------------------------------
    rem APP_KIX_DIR - каталог APP_KIX
    rem -------------------------------------------------------------------
    set APP_KIX_DIR=

    rem -------------------------------------------------------------------
    rem LIB_KIX - Каталог библиотеки KIX [каталог]
    rem -------------------------------------------------------------------
    if not defined LIB_KIX (
        rem echo INFO: Dir LIB_KIX not set
        if "!COMPUTERNAME!"=="!USERDOMAIN!" (
            set LIB_KIX=!SCRIPTS_DIR_KIX!\LIB
        ) else (
            set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
        )
    )
    echo LIB_KIX: !LIB_KIX!
    if exist !LIB_KIX! (
        echo Dir !LIB_KIX! exist ...
    ) else (
        echo INFO: Dir !LIB_KIX! not exist ...
        rem exit /b 1
    )

    rem -------------------------------------------------------------------
    rem APP_KIX_DIR - 
    rem -------------------------------------------------------------------
    set APP_KIX_DIR=

    rem -------------------------------------------------------------------
    rem APP_KIX - Скрипт APP_KIX имя+расширение
    rem -------------------------------------------------------------------
    rem set APP_KIX=[lyrxxx_]PATTERN_KIX.kix
    rem echo APP_KIX: !APP_KIX!

    if not defined APP_KIX (
        echo File APP_KIX not set...
    ) else (
        if exist !APP_KIX! (
            echo Файл !APP_KIX! существует ...
            set APP_KIX_DIR=.
        ) else (
            echo Файл !APP_KIX! не существует ...
            if exist KIX\!APP_KIX! (
                echo Файл KIX\!APP_KIX! существует ...
                set APP_KIX_DIR=KIX
            ) else (
                echo Файл KIX\!APP_KIX! не существует ...
                if exist !BAT_DIR!\KIX\!APP_KIX! (
                    echo Файл !BAT_DIR!\KIX\!APP_KIX! существует ...
                    set APP_KIX_DIR=!BAT_DIR!\KIX
                ) else (
                    echo INFO: File !BAT_DIR!\KIX\!APP_KIX! not exist ...
                    rem exit /b 1
                )
            )
        )
    )
    echo APP_KIX_DIR: !APP_KIX_DIR!
    echo APP_KIX: !APP_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_SCRIPT (AFULLFILENAME)
rem --------------------------------------------------------------------------------
:__SET_VAR_SCRIPT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_SCRIPT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFULLFILENAME=%1

    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_DEFAULT ()
rem --------------------------------------------------------------------------------
:__SET_VAR_DEFAULT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_DEFAULT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APP=
    set COMMAND=
    set OPTION=
    set ARGS=
    set APPRUN=

    set touchRUN=touch -f
    set touchRUN=D:\TOOLS\EXE\touch.exe

    set SetINIAPP=D:\TOOLS\EXE\setini.exe
    set GetINIAPP=D:\TOOLS\EXE\getini.exe

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

    rem -------------------------------------------------------------------
    rem REPO_INI - Файл с параметрами репозитария
    rem -------------------------------------------------------------------
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: !REPO_INI!
    rem -------------------------------------------------------------------
    rem REPO_NAME - Имя репозитария
    rem -------------------------------------------------------------------
    set REPO_NAME=

    rem -------------------------------------------------------------------
    rem PROJECT_INI - Файл с параметрами проекта
    rem -------------------------------------------------------------------
    set PROJECT_INI=PROJECT.ini
    rem echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!
    rem -------------------------------------------------------------------
    rem PROJECT_NAME - Имя проекта
    rem -------------------------------------------------------------------
    set PROJECT_NAME=

    rem -------------------------------------------------------------------
    rem POETRY_INI - Файл с параметрами проекта
    rem -------------------------------------------------------------------
    set POETRY_INI=POETRY.ini
    rem echo POETRY_INI [POETRY.ini]: !POETRY_INI!
    rem -------------------------------------------------------------------
    rem POETRY_NAME - Имя проекта
    rem -------------------------------------------------------------------
    set POETRY_NAME=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_PROJECTS ()
rem --------------------------------------------------------------------------------
:__SET_VAR_PROJECTS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_PROJECTS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

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

    rem -------------------------------------------------------------------
    rem TEMP_DIR - Временный каталог
    rem -------------------------------------------------------------------
    set TEMP_DIR=%temp%
    rem echo TEMP_DIR: !TEMP_DIR!

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
    echo LOG_DIR: !LOG_DIR!
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
