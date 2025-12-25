@echo off
rem -------------------------------------------------------------------
rem diskINFO.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set Directory_INFO="D:\PROJECTS_LYR\ДИСКИ\HDD\disk_INFO"

    rem set disk_INFO=%~d1
    rem set disk=!disk_INFO:~0,1!

    set disk=%~1
    rem set disk=!disk:~0,1!
    if defined disk (
        echo !Directory_INFO!\!disk!_dir.txt
        dir !disk!:\ /ad /one > !Directory_INFO!\!disk!_dir.txt

        echo !Directory_INFO!\!disk!_tree.txt
        tree /A !disk!:\ >  !Directory_INFO!\!disk!_tree.txt

    ) else (
        echo INFO: Disk not defined ...
    )

    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

