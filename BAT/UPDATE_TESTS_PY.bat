@echo off
rem -------------------------------------------------------------------
rem UPDATE_TESTS_PY.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 
rem echo -------------------------------------------------------
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
rem echo Текущий каталог %CURRENT_DIR%
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem Каталог BAT_DIR: каталог
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\BAT\99.[lyr]LYR
)
rem echo BAT_DIR: %BAT_DIR%

call %BAT_DIR%\__SET__.bat

echo ------------------------------------------------------- > %LOG_FULLFILENAME%
echo Запуск %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

echo ТЕЛО СКРИПТА %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%

rem ---------------
rem 1.FreeFileSync:
rem ---------------
set DIR_FROM=
echo DIR_FROM: %DIR_FROM%
set DIR_TO=
echo DIR_TO: %DIR_TO%
set FILES=
echo FILES: %FILES%
rem for /R %DIR_FROM% %%f in (%FILES%) do (
rem     echo %%~nf%%~xf
rem     copy %%f %DIR_TO%\
rem )

rem ---------------
rem 2.FreeFileSync:
rem ---------------
set DIR_FROM=
echo DIR_FROM: %DIR_FROM%
set DIR_TO=
echo DIR_TO: %DIR_TO%
set FILES=
rem echo FILES: %FILES%
rem for /R %DIR_FROM% %%f in (%FILES%) do (
rem     echo %%~nf%%~xf
rem     copy %%f %DIR_TO%\
rem )

rem ---------------
rem 3.git push TESTS_PY:
rem ---------------
rem call D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY\lyrgit_push_main.bat
set DIR_TESTS_PY=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY
cd /D %DIR_TESTS_PY%
call lyrgit_push_main.bat

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

rem far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
