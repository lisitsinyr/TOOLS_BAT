@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]������.bat
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
rem ������� �������: �������
rem     LOG_DIR=
rem ���� �������: ���+����������
rem     LOG_BASEFILENAME=
rem ���� �������: ���
rem     LOG_FILENAME=
rem ������ ����� ����� �������: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem ��������� �������
rem     LOG_OPT=11
rem -------------------------------------------------------------------

rem echo -------------------------------------------------------
rem echo 0.DEFAULT
rem echo -------------------------------------------------------
set REPO_NAME=
set REPO=REPO.ini
rem �������� ������������� ����� REPO
if not exist %REPO% (
    echo ���� %REPO% � ����������� �����������
    rem exit /b 1
) else (
    for /f "eol=# delims== tokens=1,2" %%i in (%REPO%) do (
       rem � ���������� i - ����
       rem � ���������� j - ��������
       set %%i=%%j
    )
)
rem echo REPO_NAME: %REPO_NAME%

set LOG_DIR=.
set LOG_DIR=D:\PROJECTS_LYR\LOGS
set LOG_FILENAME=%REPO_NAME%_CONFIG_list_so_ss_current
set LOG_FILENAME=
rem echo LOG_FILENAME: %LOG_FILENAME%

rem ...������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%
rem ...DATETIME_STAMP
set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem echo DATETIME_STAMP: %DATETIME_STAMP%
rem ...������ ����� ����� �������: FILENAME,DT,...
if "%LOG_FILENAME_FORMAT%" == "" (
    set LOG_FILENAME_FORMAT=FILENAME
    rem set LOG_FILENAME_FORMAT=DATETIME
)
rem echo LOG_FILENAME_FORMAT: %LOG_FILENAME_FORMAT%
rem ...��������� �������
if "%LOG_OPT%" == "" (
    set LOG_OPT=11
)
rem echo LOG_OPT: %LOG_OPT%
rem echo -------------------------------------------------------
rem echo 1.PROJECTS
rem echo -------------------------------------------------------
set PROJECTS=PROJECTS_BAT
rem echo PROJECTS: %PROJECTS%
set CURRENT_SYSTEM=%OS%
rem echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
set UNAME=%COMPUTERNAME%
rem echo UNAME: %UNAME%
set USERNAME=%USERNAME%
rem echo USERNAME: %USERNAME%
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
rem echo PROJECTS_DIR: %PROJECTS_DIR%
rem ...���� �������: �������+���+����������
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ...���� �������: ���+����������
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ...���� �������: ���
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem echo -------------------------------------------------------
rem echo 2.������� ��������
rem echo -------------------------------------------------------
rem ������� �������: �������
if "%LOG_DIR%" == "" (
    rem set LOG_FULLFILENAME=%~d0%~p0LOGS
    set LOG_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%\LOGS
)
rem echo LOG_DIR: %LOG_DIR%
if exist %LOG_DIR% (
    rem echo ������� %LOG_DIR% ����������
) else (
    echo ERROR: ������� %LOG_DIR% �� ����������
    exit /b 1
)
rem ...���� �������: ���
if "%LOG_FILENAME%" == "" (
    if "%LOG_FILENAME_FORMAT%" == "FILENAME" (
        set LOG_FILENAME=%SCRIPT_FILENAME%
    ) else (
        if "%LOG_FILENAME_FORMAT%" == "DATETIME" (
            set LOG_FILENAME=%DATETIME_STAMP%
        ) else (
            echo ERROR: ���� ������� �� �����
            exit /b 1
        )
    )
)
rem echo LOG_FILENAME: %LOG_FILENAME%
rem ...���� �������: �������+���+����������
if "%REPO_NAME%" == "" (
    set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
) else (
    set LOG_FULLFILENAME=%LOG_DIR%\%REPO_NAME%_%LOG_FILENAME%.log
)
rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem ...��������� ������� LOG_OPT1
set LOG_OPT1=%LOG_OPT:~0,1%
if "%LOG_OPT1%" == "" (
    set LOG_OPT1=1
)
rem echo LOG_OPT1: %LOG_OPT1%
rem ...��������� ������� LOG_OPT2
set LOG_OPT2=%LOG_OPT:~1,1%
if "%LOG_OPT2%" == "" (
    set LOG_OPT2=1
)
rem echo LOG_OPT2: %LOG_OPT2%

echo -------------------------------------------------------
echo 5. ������
echo -------------------------------------------------------

:begin
echo --------------------------------------------------------------- > %LOG_FULLFILENAME%
echo ...%SCRIPT_FULLFILENAME% >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
