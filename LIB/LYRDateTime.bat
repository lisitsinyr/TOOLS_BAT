@echo off
rem -------------------------------------------------------------------
rem LYRDateTime.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRDateTime
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :LYRDateTime
rem --------------------------------------------------------------------------------
:LYRDateTime
rem beginfunction
echo ---------------------------------------------------------------
echo LYRDateTime ...
echo ---------------------------------------------------------------
exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :YYYYMMDDHHMMSS
rem --------------------------------------------------------------------------------
:YYYYMMDDHHMMSS
rem beginfunction
echo ---------------------------------------------------------------
echo YYYYMMDDHHMMSS ...
echo ---------------------------------------------------------------
exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :DateTime
rem --------------------------------------------------------------------------------
:DateTime
rem beginfunction
echo ---------------------------------------------------------------
echo DateTime ...
echo ---------------------------------------------------------------
exit /b 0
rem endfunction