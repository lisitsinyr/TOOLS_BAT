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
    set FUNCNAME=%0
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

rem --------------------------------------------------------------------------------
rem procedure Read_P_old ()
rem --------------------------------------------------------------------------------
:Read_P_old
rem beginfunction
    set FUNCNAME=%0
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

rem --------------------------------------------------------------------------------
rem procedure Read_P ()
rem --------------------------------------------------------------------------------
:Read_P
rem beginfunction
    set FUNCNAME=%0
    if "!DEBUG!"=="1" (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set P_Name=%1
    rem !P_Name! - имя переменной
    rem echo P_Name: !P_Name!
    rem %P_Name% - имя переменной
    rem echo P_Name: %P_Name%
    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value: !%P_Name%!

    rem - значение переменной
    set P_Value=%~2
    rem echo P_Value: !P_Value!

    set Input=
    if "!P_Value!"=="" (
        if not "!PN_CAPTION!"=="" (
            rem !PN_CAPTION! - PN_CAPTION
            rem [!P_Name!]   - имя переменной
            rem [!%P_Name%!] - значение переменной по умолчанию
            set /p Input=!PN_CAPTION![!P_Name!][!%P_Name%!]:
        )
    ) else (
        set %P_Name%=!P_Value!
        exit /b 0
    )
    rem echo Input: !Input!
    echo ggggggggggggggggg

    if "!Input!"=="" (
        rem [!%P_Name%!] - значение переменной по умолчанию
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_N ()
rem --------------------------------------------------------------------------------
:Read_N
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    for %%a in (%*) do set /a Read_N+=1

    exit /b 0
rem endfunction

rem ===================================================================
