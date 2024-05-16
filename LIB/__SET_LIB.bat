@echo off
rem -------------------------------------------------------------------
rem __SET_LIB.bat
rem -------------------------------------------------------------------
rem chcp 1251
chcp 1251>NUL

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
rem     :__SET_LIB
rem     :__SET_CHECK_REPO
rem     :__SET_CHECK_PROJECT
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
rem procedure __SET_LIB ()
rem --------------------------------------------------------------------------------
:__SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SET ()
rem -----------------------------------------------
:__SET_MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    call :LYRConst %1 || exit /b 1
    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_CHECK_REPO ()
rem --------------------------------------------------------------------------------
:__SET_CHECK_REPO
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_CHECK_REPO
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem REPO_NAME - Имя репозитария
    set REPO_NAME=
    rem -------------------------------------------------------------------
    rem REPO_INI - Файл с параметрами репозитария
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: !REPO_INI!
    rem -------------------------------------------------------------------
    rem Проверка существования файла REPO.ini
    if exist !REPO_INI! (
        for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set %%i=%%j
            rem echo %%i: %%%j%
        )
    ) else (
        echo INFO: File !REPO_INI! not exist
        rem exit /b 1
    )
    rem echo REPO_NAME: !REPO_NAME!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_CHECK_PROJECT ()
rem --------------------------------------------------------------------------------
:__SET_CHECK_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_CHECK_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem PROJECT_NAME - Имя проекта
    set PROJECT_NAME=
    rem -------------------------------------------------------------------
    rem PROJECT_INI - Файл с параметрами проекта
    set PROJECT_INI=PROJECT.ini
    rem echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!
    rem -------------------------------------------------------------------
    rem Проверка существования файла PROJECT.ini
    if exist !PROJECT_INI! (
        for /f "eol=# delims== tokens=1,2" %%i in (%PROJECT_INI%) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set %%i=%%j
            rem echo %%i: %%%j%
        )
    ) else (
        echo INFO: File !PROJECT_INI! not exist
        rem exit /b 1
    )
    rem echo PROJECT_NAME: !PROJECT_NAME!

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

rem --------------------------------------------------------------------------------
rem :__SET_KIX
rem --------------------------------------------------------------------------------
:__SET_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

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
    if not defined LIB_KIX (
        rem echo INFO: Dir LIB_KIX not set

        if "!COMPUTERNAME!"=="!USERDOMAIN!" (
            set LIB_KIX=!SCRIPTS_DIR_KIX!\LIB
        ) else (
            set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
        )
    )
    rem echo LIB_KIX: !LIB_KIX!
    if exist !LIB_KIX! (
        echo Dir !LIB_KIX! exist ...
    ) else (
        echo INFO: Dir !LIB_KIX! not exist ...
        rem exit /b 1
    )
    rem echo -------------------------------------------------------
    rem echo APP_KIX
    rem echo    !APP_KIX!
    rem echo    !APP_KIX_DIR!
    rem echo -------------------------------------------------------
    if not defined APP_KIX (
        echo File APP_KIX not set...
    ) else (
        if exist !APP_KIX! (
            rem echo Файл !APP_KIX! существует ...
            set APP_KIX_DIR=.
        ) else (
            rem echo Файл !APP_KIX! не существует ...
            if exist KIX\!APP_KIX! (
                rem echo Файл KIX\!APP_KIX! существует ...
                set APP_KIX_DIR=KIX
            ) else (
                rem echo Файл KIX\!APP_KIX! не существует ...
                if exist !BAT_DIR!\KIX\!APP_KIX! (
                    rem echo Файл !BAT_DIR!\KIX\!APP_KIX! существует ...
                    set APP_KIX_DIR=!BAT_DIR!\KIX
                ) else (
                    echo INFO: File !BAT_DIR!\KIX\!APP_KIX! not exist ...
                    rem exit /b 1
                )
            )
        )
    )
    echo APP_KIX_DIR: !APP_KIX_DIR!

    exit /b 0
rem endfunction

rem ===================================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:LYRConst
%LIB_BAT%\LYRConst.bat %*
exit /b 0
