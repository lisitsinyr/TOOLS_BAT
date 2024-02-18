@echo off
rem -------------------------------------------------------------------
rem LYRSupport.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRSupport
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :LYRSupport
rem --------------------------------------------------------------------------------
:LYRSupport
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo LYRSupport ...
    rem echo ---------------------------------------------------------------
    set LYRSupport=LYRSupport
    echo %LYRSupport%
    exit /b 0
rem endfunction

:Check_P1
echo ---------------------------------------------------------------
echo Check_P1 [P1_Value]
echo ---------------------------------------------------------------
if "%1"=="" (
    set P1=""
    set /p P1=P1:
) else (
    set P1=%1
    exit /b 0
)
if "%P1%"=="" (
    set P1=""
)
echo P1: %P1%
exit /b 0

:Check_P
rem echo ---------------------------------------------------------------
rem echo Check_P [P_Name,P_Value]
rem echo ---------------------------------------------------------------
set P_Name=%1
rem echo P_Name: %P_Name%
set P_Value=%2
rem echo P_Value: %P_Value%

rem echo !%P_Name%!

if "%P_Value%"=="" (
    set Input=
    rem set /p Input=%P_Name%[!%P_Name%!]:
) else (
    set %P_Name%=%P_Value%
    exit /b 0
)
rem echo Input: %Input%
if "%Input%"=="" (
    set %P_Name%=!%P_Name%!
    rem set %P_Name%=33333333333333
) else (
    set %P_Name%=%Input%
)
exit /b 0

rem ===================================================================
