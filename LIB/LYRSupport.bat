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
    set PN_CAPTION=

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRSupport ()
rem --------------------------------------------------------------------------------
:LYRSupport
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PressAnyKey ()
rem --------------------------------------------------------------------------------
:PressAnyKey
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem echo "Press any key to continue" && pause
    
    pause

    exit /b 0
rem endfunction
   

rem --------------------------------------------------------------------------------
rem procedure Pause (SLEEP)
rem --------------------------------------------------------------------------------
:Pause
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem echo Pause: %1

    if "%1%"=="" (
        timeout 0
    ) else (
        timeout %1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Check_P ()
rem --------------------------------------------------------------------------------
:Check_P
rem beginfunction
    set FUNCNAME=:Check_P
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set P_Name=%1
    rem echo P_Name: %P_Name%
    set P_Value=%~2
    rem echo P_Value: %P_Value%
    rem echo _: !%P_Name%!

    set Input=
    if "%P_Value%"=="" (
        if not "%PN_CAPTION%"=="" (
            set /p Input=%PN_CAPTION%[%P_Name%][!%P_Name%!]:
        )
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
rem endfunction

rem ===================================================================
