@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_BAT.bat
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
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\BAT
echo DIR_FROM: %DIR_FROM%

set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\BAT
echo DIR_TO: %DIR_TO%

set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

rem ---------------
rem 2.FreeFileSync:
rem ---------------
rem set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\LIB
rem echo DIR_FROM: %DIR_FROM%
rem set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\LIB
rem rem echo DIR_TO: %DIR_TO%
rem set FILES=*.bat
rem echo FILES: %FILES%
rem for /R %DIR_FROM% %%f in (%FILES%) do (
rem     echo %%~nf%%~xf
rem     copy %%f %DIR_TO%\
rem )

set DIR_FreeFileSync=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\BAT\99.[lyr]FreeFileSync
FreeFileSync "%DIR_FreeFileSync%\PROJECTS_BAT.TOOLS_BAT.LIB__TOOLS_BAT.LIB.ffs_batch"
if not %errorlevel% == 0 (
  ::if return code is 1 or greater, something went wrong, add special treatment here
  echo Errors occurred during synchronization...
  pause & exit 1
)

rem ---------------
rem 3.git push PROJECTS_BAT:
rem ---------------
rem call D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\lyrgit_push_main.bat
set DIR_PROJECTS_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT
cd /D %DIR_PROJECTS_BAT%
call lyrgit_push_main.bat

rem ---------------
rem 4.git push TOOLS_BAT:
rem ---------------
rem call D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\lyrgit_push_main.bat
set DIR_TOOLS_BAT=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
cd /D %DIR_TOOLS_BAT%
call lyrgit_push_main.bat

rem ---------------
rem 5.git pull TOOLS_BAT:
rem ---------------
rem D:\TOOLS\TOOLS_BAT
set DIR_TOOLS_BAT=D:\TOOLS\TOOLS_BAT
cd /D %DIR_TOOLS_BAT%
git pull    

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
