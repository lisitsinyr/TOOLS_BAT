@echo off
rem -------------------------------------------------------------------
rem __SET.bat
rem -------------------------------------------------------------------
rem chcp 1251
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
rem :__SET_CHECK_REPO
rem REPO_NAME - Имя репозитария
rem     REPO_NAME=
rem REPO_INI - Файл с параметрами репозитария
rem     REPO_INI=REPO.ini
rem -------------------------------------------------------------------
rem :__SET_LOG
rem LOG_DIR - Каталог журнала
rem     LOG_DIR=
rem LOG_BASEFILENAME - Файл журнала [имя+расширение]
rem     LOG_BASEFILENAME=
rem LOG_FILENAME - Файл журнала [имя]
rem     LOG_FILENAME=
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
rem     LOG_FILENAME_FORMAT=
rem LOG_OPT - Параметры журнала [11]
rem     LOG_OPT=11
rem -------------------------------------------------------------------
rem KIX_DIR - Каталог с файлами .KIX
rem     KIX_DIR=
rem APP_KIX - Скрипт APP_KIX [имя+расширение]
rem     APP_KIX=lyrxxx_ШАБЛОН.kix
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :__SET_VAR_SCRIPT
rem     :__SET_VAR_DEFAULT
rem     :__SET_VAR_PROJECTS
rem     :__SET_CHECK_REPO
rem     :__SET_LOG
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :__SET_VAR_SCRIPT [%1]
rem --------------------------------------------------------------------------------
:__SET_VAR_SCRIPT
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_VAR_SCRIPT ...
    rem echo ---------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    set SCRIPT_FULLFILENAME=%~f1
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
    rem SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    set SCRIPT_BASEFILENAME=%~n1%~x1
    rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
    rem SCRIPT_FILENAME - Файл скрипта [имя]
    set SCRIPT_FILENAME=%~n1
    rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :__SET_VAR_DEFAULT
rem --------------------------------------------------------------------------------
:__SET_VAR_DEFAULT
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_VAR_DEFAULT
    rem echo ---------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
    set LOG_FILENAME=%REPO_NAME%_xxxxxxxxxxxxxxxxxx
    set LOG_FILENAME=
    rem echo LOG_FILENAME: %LOG_FILENAME%
    rem -------------------------------------------------------------------
    rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: %DATETIME_STAMP%
    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    if "%LOG_FILENAME_FORMAT%"=="" (
        set LOG_FILENAME_FORMAT=FILENAME
        rem set LOG_FILENAME_FORMAT=DATETIME
    )
    rem echo LOG_FILENAME_FORMAT [FILENAME,DT,...]: %LOG_FILENAME_FORMAT%
    rem -------------------------------------------------------------------
    rem LOG_OPT - Параметры журнала [11]
    if "%LOG_OPT%"=="" (
        set LOG_OPT=11
    )
    rem echo LOG_OPT [11]: %LOG_OPT%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :__SET_VAR_PROJECTS
rem --------------------------------------------------------------------------------
:__SET_VAR_PROJECTS
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_VAR_PROJECTS
    rem echo ---------------------------------------------------------------
    set PROJECTS=PROJECTS_BAT
    rem echo PROJECTS: %PROJECTS%
    rem -------------------------------------------------------------------
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
    rem -------------------------------------------------------------------
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: %UNAME%
    rem -------------------------------------------------------------------
    set USERNAME=%USERNAME%
    rem echo USERNAME: %USERNAME%
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
    rem echo PROJECTS_DIR: %PROJECTS_DIR%
    rem -------------------------------------------------------------------
    rem CURRENT_DIR - Текущий каталог
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: %CURRENT_DIR%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :__SET_CHECK_REPO
rem --------------------------------------------------------------------------------
:__SET_CHECK_REPO
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_CHECK_REPO
    rem echo ---------------------------------------------------------------
    rem REPO_NAME - Имя репозитария
    set REPO_NAME=
    rem -------------------------------------------------------------------
    rem REPO_INI - Файл с параметрами репозитария
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: %REPO_INI%
    rem -------------------------------------------------------------------
    rem Проверка существования файла REPO.ini
    if exist %REPO_INI% (
        for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set %%i=%%j
            rem echo %%i: %%%j%
        )
    ) else (
        echo INFO: File %REPO_INI% not exist
        rem exit /b 1
    )
    rem echo REPO_NAME: %REPO_NAME%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :__SET_LOG
rem --------------------------------------------------------------------------------
:__SET_LOG
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_LOG
    rem echo ---------------------------------------------------------------

    if "%__SET_LOG__%"=="1" (echo __SET_LOG__: %__SET_LOG__% && exit /b 0) else (set __SET_LOG__=1)

    rem LOG_DIR - Каталог журнала [каталог]
    if "%LOG_DIR%"=="" (
        set LOG_DIR=%PROJECTS_LYR_DIR%\LOGS
    )
    rem echo LOG_DIR: %LOG_DIR%
    if not exist %LOG_DIR% (
        echo ERROR: Dir %LOG_DIR% not exist
        exit /b 1
    )
    rem LOG_FILENAME - Файл журнала [имя]
    if "%LOG_FILENAME%"=="" (
        if "%LOG_FILENAME_FORMAT%"=="FILENAME" (
            set LOG_FILENAME=%SCRIPT_FILENAME%
        ) else (
            if "%LOG_FILENAME_FORMAT%"=="DATETIME" (
                set LOG_FILENAME=%DATETIME_STAMP%
            ) else (
                echo ERROR: LOG_FILENAME not set 
                exit /b 1
            )
        )
    )
    rem echo LOG_FILENAME: %LOG_FILENAME%
    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    if "%REPO_NAME%"=="" (
        set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
    ) else (
        set LOG_FULLFILENAME=%LOG_DIR%\%REPO_NAME%_%LOG_FILENAME%.log
    )
    rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
    rem -------------------------------------------------------------------
    rem LOG_OPT1 - Параметр журнала [1]
    set LOG_OPT1=%LOG_OPT:~0,1%
    if "%LOG_OPT1%"=="" (
        set LOG_OPT1=1
    )
    rem echo LOG_OPT1 [1]: %LOG_OPT1%
    rem -------------------------------------------------------------------
    rem LOG_OPT2 - Параметры журнала [1]
    set LOG_OPT2=%LOG_OPT:~1,1%
    if "%LOG_OPT2%"=="" (
        set LOG_OPT2=1
    )
    rem echo LOG_OPT2 [1]: %LOG_OPT2%
    exit /b 0
rem endfunction

rem ===================================================================
:Exit
