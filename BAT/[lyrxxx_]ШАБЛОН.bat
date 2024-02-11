@echo off
rem -------------------------------------------------------------------
rem lyrxxx_������.bat
rem    LOG_DIR=
rem ----------------------------------------------------------------------------
chcp 1251

echo =======================================================
echo 1.PROJECTS
echo -------------------------------------------------------
set PROJECTS=PROJECTS_BAT
echo PROJECTS: %PROJECTS%
set CURRENT_SYSTEM=%OS%
echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
set UNAME=%COMPUTERNAME%
echo UNAME: %UNAME%
set USERNAME=%USERNAME%
echo USERNAME: %USERNAME%
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
echo PROJECTS_DIR: %PROJECTS_DIR%
rem ���� �������: �������+���+����������
set SCRIPT_FULLFILENAME=%~f0
echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ���� �������: ���+����������
set SCRIPT_BASEFILENAME=%~n0%~x0
echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ���� �������: ���
set SCRIPT_FILENAME=%~n0
echo SCRIPT_FILENAME: %SCRIPT_FILENAME%

echo =======================================================
echo 2.������� ��������
echo -------------------------------------------------------
set LOG_DIR=%~d0%~p0LOGS
echo LOG_DIR: %LOG_DIR%
set LOG_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%\LOGS
echo LOG_DIR: %LOG_DIR%
rem ���� �������: ���+����������
set LOG_BASEFILENAME=""
echo LOG_BASEFILENAME: %LOG_BASEFILENAME%
rem ���� �������: �������+���+����������
set LOG_FULLFILENAME=%~d0%~p0LOGS\%~n0%~x0.log
echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem ��������� �������
set LOG_OPT=11
echo LOG_OPT: %LOG_OPT%

echo =======================================================
echo 3.���������� LYR
echo -------------------------------------------------------
if "%LIB_KIX%" == "" goto SetKXLDIR
goto OK
:SetKXLDIR
echo �������� ���������� ����� LIB_KIX �� �����������
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local
:Network
set LIB_KIX=\\S73FS01\APPInfo\tools
goto OK
:Local
set LIB_KIX=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\01_KIX\%PROJECTS%\TOOLS_KIX
set LIB_KIX=D:\TOOLS\TOOLS_BAT\TOOLS_KIX
:OK
echo LIB_KIX: %LIB_KIX%

echo =======================================================
echo 4.SCRIPT_KIX
echo -------------------------------------------------------
set KIX_DIR=""

set SCRIPT_KIX=lyrxxx_������.kix
echo SCRIPT_KIX: %SCRIPT_KIX%

set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
echo BAT_DIR: %BAT_DIR%

if EXIST %SCRIPT_KIX% (
    echo ���� %SCRIPT_KIX% exists
    set KIX_DIR=.\
) else (
    echo file %SCRIPT_KIX% does not exist
    if EXIST KIX\%SCRIPT_KIX% (
        echo ���� KIX\%SCRIPT_KIX% exists
        set KIX_DIR=KIX
    ) else (
        echo ���� KIX\%SCRIPT_KIX% does not exist
        if EXIST %BAT_DIR%\KIX\%SCRIPT_KIX% (
            echo ���� %BAT_DIR%\KIX\%SCRIPT_KIX% exists
            set KIX_DIR=%BAT_DIR%\KIX
        ) else (
            echo ���� %BAT_DIR%\KIX\%SCRIPT_KIX% does not exist
            exit :eof
        )
    )
)

echo KIX_DIR: %KIX_DIR%

kix32.exe %KIX_DIR%\%SCRIPT_KIX% "$SCRIPT_FILENAME=%~n0" "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$LIB_KIX=%LIB_KIX%"

exit :eof
:Exit


