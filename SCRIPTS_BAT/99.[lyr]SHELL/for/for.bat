@echo off
rem -------------------------------------------------------------------
rem for.bat
rem ----------------------------------------------------------------------------
chcp 1251

rem ====================================================================
rem 1.PROJECTS
rem -------------------------------------------------------------------
set PROJECTS=PROJECTS_KIX
echo PROJECTS: %PROJECTS%
set CURRENT_SYSTEM=%OS%
echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
set UNAME=%COMPUTERNAME%
echo UNAME: %UNAME%
set USERNAME=%USERNAME%
echo USERNAME: %USERNAME%
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!
set PROJECTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LISTSCRIPT\KIX\%PROJECTS%
echo PROJECTS_DIR: %PROJECTS_DIR%
rem  Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLNAME=%~f0
echo SCRIPT_FULLNAME: %SCRIPT_FULLNAME%
rem  Файл скрипта: имя+расширение
set SCRIPT_BASENAME=%~n0%~x0
echo SCRIPT_BASENAME: %SCRIPT_BASENAME%
rem  Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
echo SCRIPT_FILENAME: %SCRIPT_FILENAME%

rem ====================================================================
rem 2.БИБЛИОТЕКА LYR
rem -------------------------------------------------------------------
if "%LIB_KIX%" == "" goto SetKXLDIR
goto OK
:SetKXLDIR
echo Значение переменной среды LIB_KIX не установлено
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local
:Network
set LIB_KIX=\\S73FS01\APPInfo\tools
goto OK
:Local
set LIB_KIX=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\KIX\%PROJECTS%\TOOLS_KIX
set LIB_KIX=D:\TOOLS\TOOLS_BAT\TOOLS_KIX
:OK
echo LIB_KIX: %LIB_KIX%

rem =======================================================
rem 3.Каталог журналов
rem -------------------------------------------------------------------
set LOG_DIR=%~d0%~p0LOGS
echo LOG_DIR: %LOG_DIR%
rem  Файл журнала: каталог+имя+расширение
set LOG_FILE=%~d0%~p0LOGS\%~n0%~x0.log
echo LOG_FILE: %LOG_FILE%
rem  Параметры журнала
set LOG_OPT=11
echo LOG_OPT: %LOG_OPT%
rem =======================================================

rem =======================================================
rem 4.SCRIPT_KIX
rem -------------------------------------------------------------------
set KIX_DIR=""

set SCRIPT_KIX=lyrxxx_ШАБЛОН.kix
echo SCRIPT_KIX: %SCRIPT_KIX%

set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT\BAT
echo SCRIPTS_DIR: %SCRIPTS_DIR%

if exist %SCRIPT_KIX% (
    echo Файл %SCRIPT_KIX% exists
    set KIX_DIR=.\
) else (
    echo file %SCRIPT_KIX% does not exist
    if exist KIX\%SCRIPT_KIX% (
        echo Файл KIX\%SCRIPT_KIX% exists
        set KIX_DIR=KIX
    ) else (
        echo Файл KIX\%SCRIPT_KIX% does not exist
        if exist %SCRIPTS_DIR%\KIX\%SCRIPT_KIX% (
            echo Файл %SCRIPTS_DIR%\KIX\%SCRIPT_KIX% exists
            set KIX_DIR=%SCRIPTS_DIR%\KIX
        ) else (
            echo Файл %SCRIPTS_DIR%\KIX\%SCRIPT_KIX% does not exist
            exit :eof
        )
    )
)

echo KIX_DIR: %KIX_DIR%

kix32.exe %KIX_DIR%\%SCRIPT_KIX% "$SCRIPT_FILENAME=%~n0" "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$LIB_KIX=%LIB_KIX%"

exit :eof
:Exit
