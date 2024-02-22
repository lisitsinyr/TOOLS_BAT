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
rem LOG_DT_FORMAT -
rem     LOG_DT_FORMAT=
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
rem     LOG_FILENAME_FORMAT=
rem LOG_FILE_ADD - Параметры журнала [1]
rem     LOG_FILE_ADD=  
rem LOG_FILE_DT - Параметры журнала [0]
rem     LOG_FILE_DT=
rem LOG_DIR - Каталог журнала
rem     LOG_DIR=
rem LOG_FILENAME - Файл журнала [имя]
rem     LOG_FILENAME=
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
rem     :__SET_VAR_SCRIPT
rem     :__SET_VAR_DEFAULT
rem     :__SET_VAR_PROJECTS
rem     :__SET_CHECK_REPO
rem     :__SET_LOG
rem     :__SET_KIX
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_DEFAULT (DEBUG)
rem --------------------------------------------------------------------------------
:__SET_VAR_DEFAULT
rem beginfunction
    rem  -------------------------------------------------------------------
    rem  DEBUG 1-включить DEBUG 0-выключить DEBUG
    set DEBUG=%1
    rem echo DEBUG: %DEBUG%

    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT -
    rem LOG_DT_FORMAT_DEFAULT=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    set LOG_DT_FORMAT_DEFAULT=%date:~6,4%%date:~3,2%%date:~0,2%
    rem echo LOG_DT_FORMAT_DEFAULT: $LOG_DT_FORMAT_DEFAULT

    rem -------------------------------------------------------------------
    rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: %DATETIME_STAMP%

    rem -------------------------------------------------------------------
    set S01=------------------------------------------------------
    rem --------------------------------
    set loStandard=0
    set loTextFile=1
    set loAll=2
    rem --------------------------------
    set NOTSET=0
    set DEBUG=1
    set INFO=2
    set WARNING=3
    set ERROR=4
    set CRITICAL=5
    set DEBUGTEXT=11
    set BEGIN=21
    set END=22
    set PROCESS=23
    set TEXT=24
    rem # --------------------------------
    set ctlsNOTSET=" "
    set ctlsDEBUG=D
    set ctlsINFO=I
    set ctlsWARNING=W
    set ctlsERROR=E
    set ctlsCRITICAL=C
    set ctlsBEGIN="<"
    set ctlsEND=">"
    set ctlsPROCESS=P
    set ctlsDEBUGTEXT=T
    set ctlsTEXT=T

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_SCRIPT (FULLFILENAME)
rem --------------------------------------------------------------------------------
:__SET_VAR_SCRIPT
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    set SCRIPT_FULLFILENAME=%~f1
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
    rem -------------------------------------------------------------------
    rem SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    set SCRIPT_BASEFILENAME=%~n1%~x1
    rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
    rem -------------------------------------------------------------------
    rem SCRIPT_FILENAME - Файл скрипта [имя]
    set SCRIPT_FILENAME=%~n1
    rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
    rem -------------------------------------------------------------------
    rem Файл скрипта: каталог
    set SCRIPT_FILEDIR=
    rem echo SCRIPT_FILEDIR: %SCRIPT_FILEDIR%
    rem -------------------------------------------------------------------
    rem Файл скрипта: расширение
    set SCRIPT_FILEEXT=
    rem echo SCRIPT_FILEEXT: %SCRIPT_FILEEXT%
    exit /b 0
rem endfunction


rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_PROJECTS ()
rem --------------------------------------------------------------------------------
:__SET_VAR_PROJECTS
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    rem -------------------------------------------------------------------
    rem PROJECTS - проект
    rem set PROJECTS=
    rem echo PROJECTS: %PROJECTS%
    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR -
    rem set PROJECTS_LYR_DIR=
    rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR -
    rem set PROJECTS_DIR=
    rem echo PROJECTS_DIR: %PROJECTS_DIR%
    rem -------------------------------------------------------------------
    rem CURRENT_SYSTEM -
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
    rem -------------------------------------------------------------------
    rem UNAME - COMPUTERNAME
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: %UNAME%
    rem -------------------------------------------------------------------
    rem USERNAME - USERNAME
    set USERNAME=%USERNAME%
    rem echo USERNAME: %USERNAME%
    rem -------------------------------------------------------------------
    rem CURRENT_DIR - Текущий каталог
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: %CURRENT_DIR%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_CHECK_REPO ()
rem --------------------------------------------------------------------------------
:__SET_CHECK_REPO
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    rem -------------------------------------------------------------------
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
rem procedure __SET_LOG ()
rem --------------------------------------------------------------------------------
:__SET_LOG
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )

    rem if "%__SET_LOG__%"=="1" (echo __SET_LOG__: %__SET_LOG__% && exit /b 0) else (set __SET_LOG__=1)
    if "%__SET_LOG__%"=="1" (exit /b 0) else (set __SET_LOG__=1)
    rem if "%__SET_LOG__%"=="" (set __SET_LOG__=1)

    rem ------------------------------------------------------
    rem LOG_DT_FORMAT -
    if "%LOG_DT_FORMAT%"=="" (
        set LOG_DT_FORMAT=%LOG_DT_FORMAT_DEFAULT%
    )
    rem echo LOG_DT_FORMAT: %LOG_DT_FORMAT%
    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    if "%LOG_FILENAME_FORMAT%"=="" (
        set LOG_FILENAME_FORMAT=FILENAME
        rem set LOG_FILENAME_FORMAT=DATETIME
    )
    rem echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: %LOG_FILENAME_FORMAT%
    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD -
    if "%LOG_FILE_ADD%"=="" (
        set LOG_FILE_ADD=1
    )
    rem echo LOG_FILE_ADD: %LOG_FILE_ADD%
    rem -------------------------------------------------------------------
    rem LOG_FILE_DT -
    if "%LOG_FILE_DT%"=="" (
        set LOG_FILE_DT=0
    )
    rem echo LOG_FILE_DT: %LOG_FILE_DT%
    rem -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    if "%LOG_DIR%"=="" (
        set LOG_DIR=%PROJECTS_LYR_DIR%\LOGS
    )
    echo LOG_DIR: %LOG_DIR%
    if not exist %LOG_DIR% (
        echo ERROR: Dir %LOG_DIR% not exist
        exit /b 1
    )
    rem -------------------------------------------------------------------
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
    if "%LOG_FILENAME_FORMAT%"=="FILENAME" (
        if "%LOG_FILE_DT%"=="1" (
           set LOG_FILENAME=%DATETIME_STAMP%_%LOG_FILENAME%
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

    exit /b 0
rem endfunction


rem --------------------------------------------------------------------------------
rem :__SET_KIX
rem --------------------------------------------------------------------------------
:__SET_KIX
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo __SET_KIX
    rem echo ---------------------------------------------------------------
    rem -------------------------------------------------------------------
    rem KIX_DIR - Каталог с файлами .KIX
    set KIX_DIR=
    rem APP_KIX_DIR - каталог APP_KIX
    set APP_KIX_DIR=
    rem -------------------------------------------------------------------
    rem APP_KIX - Скрипт APP_KIX имя+расширение
    set APP_KIX=[lyrxxx_]PATTERN_KIX.kix
    rem -------------------------------------------------------------------

    rem echo -------------------------------------------------------
    rem echo Каталог библиотеки KIX: каталог
    rem echo    %LIB_KIX%"
    rem echo -------------------------------------------------------
    rem LIB_KIX - Каталог библиотеки KIX [каталог]
    if "%LIB_KIX%"=="" (
        rem echo INFO: Dir LIB_KIX not set

        if "%COMPUTERNAME%"=="%USERDOMAIN%" (
            set LIB_KIX=%SCRIPTS_DIR_KIX%\LIB
        ) else (
            set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
        )
    )
    rem echo LIB_KIX: %LIB_KIX%
    if exist %LIB_KIX% (
        rem echo Dir %LIB_KIX% exist
    ) else (
        echo INFO: Dir %LIB_KIX% not exist
        rem exit /b 1
    )

    rem echo -------------------------------------------------------
    rem echo APP_KIX
    rem echo    %APP_KIX%
    rem echo    %APP_KIX_DIR%
    rem echo -------------------------------------------------------
    if "%APP_KIX%"=="" (
        echo File APP_KIX not set
    ) else (
        if exist %APP_KIX% (
            rem echo Файл %APP_KIX% существует
            set APP_KIX_DIR=.
        ) else (
            rem echo Файл %APP_KIX% не существует
            if exist KIX\%APP_KIX% (
                rem echo Файл KIX\%APP_KIX% существует
                set APP_KIX_DIR=KIX
            ) else (
                rem echo Файл KIX\%APP_KIX% не существует
                if exist %BAT_DIR%\KIX\%APP_KIX% (
                    rem echo Файл %BAT_DIR%\KIX\%APP_KIX% существует
                    set APP_KIX_DIR=%BAT_DIR%\KIX
                ) else (
                    echo INFO: File %BAT_DIR%\KIX\%APP_KIX% not exist
                    rem exit /b 1
                )
            )
        )
    )
    echo APP_KIX_DIR: %APP_KIX_DIR%

    exit /b 0
rem endfunction

rem ===================================================================
:Exit
