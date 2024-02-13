@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_GIT.bat
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

set UPDATE_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT

set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM% >> %LOG_FULLFILENAME%
set FILES=*.bat
echo FILES: %FILES% >> %LOG_FULLFILENAME%

call :REPO_WORK PROJECTS_GIT  || exit /b 1
call :REPO_WORK TOOLS_GIT     || exit /b 1
call :REPO_WORK PROJECTS_UNIX || exit /b 1
call :REPO_WORK TOOLS_SH      || exit /b 1
call :REPO_WORK PROJECTS_KIX  || exit /b 1
call :REPO_WORK TOOLS_KIX     || exit /b 1
call :REPO_WORK PROJECTS_BAT  || exit /b 1
call :REPO_WORK TOOLS_BAT     || exit /b 1
call :REPO_WORK EXAMPLES_PY   || exit /b 1
call :REPO_WORK MobileAPP     || exit /b 1
call :REPO_WORK PROJECTS_PY   || exit /b 1
call :REPO_WORK TESTS_PY      || exit /b 1
call :REPO_WORK TOOLS_PY      || exit /b 1
call :REPO_WORK YOUTUBE       || exit /b 1
call :REPO_WORK PROJECTS_JAVA || exit /b 1
call :REPO_WORK TESTS_JAVA    || exit /b 1
call :REPO_WORK TOOLS_JAVA    || exit /b 1

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

rem far -v %LOG_FULLFILENAME%

:Exit

rem Выход из сценария. Дальше - только функции.
exit /b 0

rem Функция для чтения настроек из файла.
rem Вход: %1 - Имя файла с настройками

:REPO_WORK
set PROJECTS=%1
if "%PROJECTS%" == "PROJECTS_GIT" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
) else (
if "%PROJECTS%" == "TOOLS_GIT" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
) else (
if "%PROJECTS%" == "PROJECTS_UNIX" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX
) else (
if "%PROJECTS%" == "TOOLS_SH" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
) else (
if "%PROJECTS%" == "PROJECTS_KIX" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX
) else (
if "%PROJECTS%" == "TOOLS_KIX" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
) else (
if "%PROJECTS%" == "PROJECTS_BAT" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT
) else (
if "%PROJECTS%" == "TOOLS_BAT" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
) else (
if "%PROJECTS%" == "EXAMPLES_PY" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\EXAMPLES_PY
) else (
if "%PROJECTS%" == "MobileAPP" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\MobileAPP
) else (
if "%PROJECTS%" == "PROJECTS_PY" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PROJECTS_PY
) else (
if "%PROJECTS%" == "TESTS_PY" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY
) else (
if "%PROJECTS%" == "TOOLS_PY" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TOOLS_PY
) else (
if "%PROJECTS%" == "YOUTUBE" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\YOUTUBE
) else (
if "%PROJECTS%" == "PROJECTS_JAVA" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\PROJECTS_JAVA
) else (
if "%PROJECTS%" == "TESTS_JAVA" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TESTS_JAVA
) else (
if "%PROJECTS%" == "TOOLS_JAVA" (
    set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TOOLS_JAVA
) else (
    set DIR_TO=
)))))))))))))))))

if not "%PROJECTS%" == "" (
    echo --------------------------------------------------------- >> %LOG_FULLFILENAME%
    echo PROJECTS: %PROJECTS% >> %LOG_FULLFILENAME%
    echo DIR_TO: %DIR_TO% >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------- >> %LOG_FULLFILENAME%
    rem for /R %DIR_FROM% %%f in (%FILES%) do (
    rem     echo %%~nf%%~xf
    rem     copy %%f %DIR_TO%\
    rem )

    del %DIR_TO%\*.bat
    echo COPY: %DIR_FROM%\lyrgit_push_main.bat       >> %LOG_FULLFILENAME%
    copy %DIR_FROM%\lyrgit_push_main.bat %DIR_TO%    >> %LOG_FULLFILENAME%
    echo COPY: %UPDATE_BAT%\UPDATE_%PROJECTS%.bat    >> %LOG_FULLFILENAME%
    copy %UPDATE_BAT%\UPDATE_%PROJECTS%.bat %DIR_TO% >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------- >> %LOG_FULLFILENAME%
)

exit /b 0
