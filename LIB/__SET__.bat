@echo off
rem -------------------------------------------------------------------
rem __SET__.bat
rem -------------------------------------------------------------------
rem chcp 1251
chcp 1251>NUL

rem -------------------------------------------------------------------
rem Каталог журнала: каталог
rem     LOG_DIR=
rem Файл журнала: имя+расширение
rem     LOG_BASEFILENAME=
rem Файл журнала: имя
rem     LOG_FILENAME=
rem Формат имени файлф журнала: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem Параметры журнала
rem     LOG_OPT=11
rem Каталог APP_KIX: каталог с файлами .KIX
rem     KIX_DIR=
rem Скрипт APP_KIX: имя+расширение
rem     APP_KIX=lyrxxx_ШАБЛОН.kix
rem -------------------------------------------------------------------

:begin
if "%__SET__%"=="1" (
    goto :eof
) else (
    set __SET__=1
)
echo __SET__: %__SET__%

if "%SCRIPT_FILENAME%"=="" (
    set SCRIPT_FILENAME=__SET__
)
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%

rem Каталог BAT_DIR: каталог
if "%BAT_DIR%"=="" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT
)
echo BAT_DIR: %BAT_DIR%

rem echo -------------------------------------------------------
rem echo 1.Переменные по умолчанию
rem echo    %LOG_DIR%
rem echo    %LOG_FILENAME%
rem echo    %DATETIME_STAMP%
rem echo    %LOG_FILENAME_FORMAT%
rem echo    %LOG_OPT%
rem echo -------------------------------------------------------
rem LOG_FILENAME - Файл журнала [имя]
set LOG_FILENAME=%REPO_NAME%_xxxxxxxxxxxxxxxxxx
set LOG_FILENAME=
rem echo LOG_FILENAME: %LOG_FILENAME%
rem -------------------------------------------------------------------
rem DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: %DATETIME_STAMP%
rem -------------------------------------------------------------------
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
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

rem echo -------------------------------------------------------
rem echo 2.Проект [PROJECTS]
rem echo    %PROJECTS%
rem echo    %UNAME%
rem echo    %USERNAME%
rem echo    %PROJECTS_LYR_DIR%
rem echo    %PROJECTS_DIR%
rem echo -------------------------------------------------------
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
rem echo CURRENT_DIR: %CURRENT_DIR%
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

rem echo -------------------------------------------------------
rem echo 3.Наличие репозитария
rem echo    %REPO_NAME%
rem echo -------------------------------------------------------
rem REPO_NAME - Имя репозитария
set REPO_NAME=
rem -------------------------------------------------------------------
rem REPO_INI - Файл с параметрами репозитария
set REPO_INI=REPO.ini
echo REPO_INI [REPO.ini]: %REPO_INI%
rem -------------------------------------------------------------------
rem Проверка существования файла REPO.ini
if not exist %REPO_INI% (
    echo INFO: File %REPO_INI% not exist
    rem exit /b 1
) else (
    for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
       rem В переменной i - ключ
       rem В переменной j - значение
       set %%i=%%j
       rem echo %%i: %%%j%
    )
)
echo REPO_NAME: %REPO_NAME%

rem echo -------------------------------------------------------
rem echo 4.Настройка Каталога журналов и имени журнала 
rem echo    %LOG_DIR%
rem echo    %LOG_FILENAME%
rem echo    %LOG_OPT1%
rem echo    %LOG_OPT2%
rem echo -------------------------------------------------------
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
rem ===================================================================

echo ================================================================= > %LOG_FULLFILENAME%
echo LOG_FULLFILENAME: %LOG_FULLFILENAME%                              >> %LOG_FULLFILENAME%
echo ================================================================= >> %LOG_FULLFILENAME%

:Exit