@echo off
rem -------------------------------------------------------------------
rem UPDATE_PROJECTS_JAVA.bat
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
set REPO_NAME=TOOLS_JAVA
set REPO_DIR=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TOOLS_JAVA
rem echo -------------------------------------------------------

:begin
echo ---------------------------------------------------------------
echo ...
echo ---------------------------------------------------------------
echo ������� ������� %CURRENT_DIR%

echo ---------------------------------------------------------------
echo 1.FreeFileSync:
echo ---------------------------------------------------------------
echo FreeFileSync *.ffs_gui
echo FreeFileSync *.ffs_batch
echo ---------------------------------------------------------------
echo 2.FreeFileSync:
echo ---------------------------------------------------------------
echo FreeFileSync *.ffs_gui
echo FreeFileSync *.ffs_batch
echo ---------------------------------------------------------------
echo 3.git push PROJECTS_BAT:
echo ---------------------------------------------------------------

CD /D %REPO_DIR%
echo ������� ������� %CD%

call lyrgit_push_main.bat

echo ---------------------------------------------------------------

cd %CURRENT_DIR%
echo ������� ������� %CURRENT_DIR%

exit /b 0

:Exit

