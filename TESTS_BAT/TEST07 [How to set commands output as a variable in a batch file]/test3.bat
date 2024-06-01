@echo off
rem -------------------------------------------------------------------
rem test3.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

echo ttttttttt>var
FOR /F "tokens=* USEBACKQ" %%g IN (var) do (SET VAR=%%g)
ECHO %VAR%
