@echo off
rem -------------------------------------------------------------------
rem diskINFO.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set Directory_INFO="G:\SOFT-install\ДИСКИ\HDD\disk_INFO"

    set disk_INFO=%~d1
    set disk=!disk_INFO:~0,1!
    if defined disk (
        echo disk:!disk!
        echo !Directory_INFO!\!disk!_dir.txt
        dir !disk_INFO!:\ /ad /one > !Directory_INFO!\!disk!_dir.txt
        echo !Directory_INFO!\!disk!_tree.txt
        tree /A !disk_INFO!:\ >  !Directory_INFO!\!disk!_tree.txt
    ) else (
        echo INFO: Disk not defined ...
    )

    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

