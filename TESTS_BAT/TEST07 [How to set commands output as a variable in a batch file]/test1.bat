@echo off
rem -------------------------------------------------------------------
rem test1.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

echo ttttttttt>var
FOR /F "tokens=* USEBACKQ" %%F IN (var) DO (SET var=%%F)
ECHO %var%
