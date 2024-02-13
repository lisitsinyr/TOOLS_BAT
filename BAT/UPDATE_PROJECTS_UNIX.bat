@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_UNIX.bat
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
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SH\SH
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\SH
echo DIR_TO: %DIR_TO%
set FILES=*.sh
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

rem ---------------
rem 2.FreeFileSync:
rem ---------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\TOOLS_SH\LIB
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\LIB
echo DIR_TO: %DIR_TO%
set FILES=*.*
rem echo FILES: %FILES%
rem for /R %DIR_FROM% %%f in (%FILES%) do (
rem     echo %%~nf%%~xf
rem     copy %%f %DIR_TO%\
rem )

set DIR_FreeFileSync=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\BAT\99.[lyr]FreeFileSync
FreeFileSync "%DIR_FreeFileSync%\PROJECTS_UNIX.TOOLS_SH.LIB__TOOLS_SH.LIB.ffs_batch"
if not %errorlevel% == 0 (
  ::if return code is 1 or greater, something went wrong, add special treatment here
  echo Errors occurred during synchronization...
  pause & exit 1
)

rem ---------------
rem 3.git push PROJECTS_UNIX:
rem ---------------
rem call D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\lyrgit_push_main.bat
set DIR_PROJECTS_UNIX=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX
cd /D %DIR_PROJECTS_UNIX%
call lyrgit_push_main.bat

rem ---------------
rem 4.git push TOOLS_SH:
rem ---------------
rem call D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH\lyrgit_push_main.bat
set DIR_TOOLS_SH=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
cd /D %DIR_TOOLS_SH%
call lyrgit_push_main.bat

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

rem far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
