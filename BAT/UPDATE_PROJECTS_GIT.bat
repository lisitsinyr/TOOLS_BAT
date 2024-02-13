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

rem ---------------------------------------------------------
rem 1.COPY: PROJECTS_GIT\TOOLS_GIT\BAT\*.bat -> TOOLS_GIT\BAT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT\BAT
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

rem ---------------------------------------------------------
rem 2.COPY: PROJECTS_GIT\TOOLS_GIT\BAT_KIX\*.bat -> TOOLS_GIT\BAT_KIX
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT_KIX
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT\BAT_KIX
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

rem ---------------------------------------------------------
rem 3.COPY: PROJECTS_GIT\SH\*.sh -> TOOLS_SH\SH_GIT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\SH
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\SH_GIT
echo DIR_TO: %DIR_TO%
set FILES=*.sh
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

rem ---------------------------------------------------------
rem 4.git push TOOLS_SH:
rem ---------------------------------------------------------
rem D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\lyrgit_push_main.bat
set DIR_TOOLS_SH=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
cd /D %DIR_TOOLS_SH%
call lyrgit_push_main.bat

rem ---------------------------------------------------------
rem 5.git push PROJECTS_GIT:
rem ---------------------------------------------------------
rem call D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\lyrgit_push_main.bat
set DIR_PROJECTS_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
cd /D %DIR_PROJECTS_GIT%
call lyrgit_push_main.bat

rem ---------------------------------------------------------
rem 6.git push TOOLS_GIT:
rem ---------------------------------------------------------
rem call D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT\lyrgit_push_main.bat
set DIR_TOOLS_GIT=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
cd /D %DIR_TOOLS_GIT%
call lyrgit_push_main.bat

rem ---------------------------------------------------------
rem 7.git pull TOOLS_GIT:
rem ---------------------------------------------------------
rem D:\TOOLS\TOOLS_GIT
set DIR_TOOLS_GIT=D:\TOOLS\TOOLS_GIT
cd /D %DIR_TOOLS_GIT%
git pull    

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

rem far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
