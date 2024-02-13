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
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\TOOLS_GIT
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\TOOLS_SH
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\EXAMPLES_PY
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\EXAMPLES_PY
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\MobileAPP
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\MobileAPP
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PROJECTS_PY
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\PROJECTS_PY
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TESTS_PY
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TOOLS_PY
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\TOOLS_PY
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\YOUTUBE
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\02_Python\PROJECTS_PY\YOUTUBE
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\PROJECTS_JAVA
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\PROJECTS_JAVA
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TESTS_JAVA
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TESTS_JAVA
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)
rem ---------------------------------------------------------
rem COPY: D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK\*.bat
rem  -> D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TOOLS_JAVA
rem ---------------------------------------------------------
set DIR_FROM=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\TOOLS_GIT\BAT\A.WORK
echo DIR_FROM: %DIR_FROM%
set DIR_TO=D:\PROJECTS_LYR\CHECK_LIST\05_DESKTOP\03_Java\PROJECTS_JAVA\TOOLS_JAVA
echo DIR_TO: %DIR_TO%
set FILES=*.bat
echo FILES: %FILES%
for /R %DIR_FROM% %%f in (%FILES%) do (
    echo %%~nf%%~xf
    copy %%f %DIR_TO%\
)

cd /D %CURRENT_DIR%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
