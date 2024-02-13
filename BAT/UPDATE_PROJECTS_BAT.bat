@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]������_BAT.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 
rem echo -------------------------------------------------------
rem CURRENT_DIR - ������� �������
set CURRENT_DIR=%CD%
rem echo ������� ������� %CURRENT_DIR%
rem ���� �������: �������+���+����������
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ���� �������: ���+����������
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ���� �������: ���
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem ������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%

call %BAT_DIR%\__SET__.bat


echo ------------------------------------------------------- > %LOG_FULLFILENAME%
echo ������ %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo ������� ������� %CURRENT_DIR% >> %LOG_FULLFILENAME%

echo ���� ������� %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%

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
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\LIB
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT\LIB
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
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
rem     git pull    

cd /D %CURRENT_DIR%
echo ������� ������� %CURRENT_DIR% >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
