@echo off
rem -------------------------------------------------------------------
rem LYRSupport.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRSupport
rem     :PressAnyKey
rem     :Pause
rem     :Check_P
rem     :Read_P
rem     :Read_F
rem     :Read_N
rem     :GetINI
rem     :SetINI
rem     :GetINIParametr
rem -------------------------------------------------------------------

:begin
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
    set FUNCNAME=LYRSupport
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PressAnyKey ()
rem --------------------------------------------------------------------------------
:PressAnyKey
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PressAnyKey
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

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
    set FUNCNAME=_Pause
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set /a LPause=%1
    rem echo LPause: !LPause!

    if not defined LPause (
        timeout 0
    ) else (
        timeout !LPause!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Check_P ()
rem --------------------------------------------------------------------------------
:Check_P
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Check_P
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set P_Name=%1
    rem !P_Name! - имя переменной
    rem echo P_Name: !P_Name!
    rem %P_Name% - имя переменной
    rem echo P_Name: %P_Name%

    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value_default: !%P_Name%!

    rem - значение переменной
    set P_Value=%~2
    rem echo P_Value: !P_Value!

    rem !PN_CAPTION! - PN_CAPTION
    rem [!P_Name!]   - имя переменной
    rem [!%P_Name%!] - значение переменной по умолчанию

    set Input=
    if not defined P_Value (

        if defined PN_CAPTION (
            set /p Input=!PN_CAPTION![!P_Name!][!%P_Name%!]:
        )

    ) else (

        set %P_Name%=!P_Value!
        exit /b 0
    )
    rem echo Input: !Input!

    if not defined Input (
        rem [!%P_Name%!] - значение переменной по умолчанию
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_P ()
rem --------------------------------------------------------------------------------
:Read_P
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_P
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set P_Name=%1
    rem !P_Name! - имя переменной
    rem echo P_Name: !P_Name!
    rem %P_Name% - имя переменной
    rem echo P_Name: %P_Name%

    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value_default: !%P_Name%!

    rem - значение переменной
    set P_Value=%~2
    rem echo P_Value: !P_Value!

    rem !PN_CAPTION! - PN_CAPTION
    rem [!P_Name!]   - имя переменной
    rem [!%P_Name%!] - значение переменной по умолчанию

    set Input=
    if not defined P_Value (

        if defined PN_CAPTION (
            set /p Input=!PN_CAPTION![!P_Name!][!%P_Name%!]:
        )

    ) else (

        set %P_Name%=!P_Value!
        exit /b 0
    )
    rem echo Input: !Input!

    if not defined Input (
        rem [!%P_Name%!] - значение переменной по умолчанию
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_F ()
rem --------------------------------------------------------------------------------
:Read_F
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_F
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set P_Name=%1
    rem !P_Name! имя переменной
    rem echo имя переменной: !P_Name!
    rem !%P_Name%! значение переменной по умолчанию
    echo Deault: !%P_Name%!

    rem список создаваемых вариантов
    set P_List=%~2
    rem echo P_List: !P_List!
    rem timeout
    set timeout=%3
    if not defined timeout (
        set timeout=10
    )
    rem echo timeout: !timeout!

    set %P_Name%=!%P_Name%!
    if not "!P_List!"=="" (
        choice /C !P_List! /D !%P_Name%! /T !timeout! /M "!PN_CAPTION!"
        if !ERRORLEVEL!==1 (
            set %P_Name%=!ERRORLEVEL!
        ) else (
            set %P_Name%=
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_N ()
rem --------------------------------------------------------------------------------
:Read_N
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_N
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    for %%a in (%*) do set /a Read_N+=1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SetINI ()
rem --------------------------------------------------------------------------------
:SetINI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LFileName=%1
    set LSection=%2
    set LParameter=%3
    set LValue=%4
    rem D:\TOOLS\EXE\setini.exe !LFileName! general POETRY_NAME !ProjectName!
    %SetINIAPP% !LFileName! !LSection! !LParameter! !LValue!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINI ()
rem --------------------------------------------------------------------------------
:GetINI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LFileName=%1
    set LSection=%2
    set LParameter=%3
    set !FUNCNAME!=!TEMP_DIR!\%random%.tmp
    echo !FUNCNAME!: !%FUNCNAME%!

    %GetINIAPP% !LFileName! !LSection! !LParameter! > !%FUNCNAME%!

    rem type !%FUNCNAME%!

    if exist !%FUNCNAME%! (
        for /f "eol=# delims== tokens=1,2" %%i in (!%FUNCNAME%!) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set s=%%i
            set s=!s:~0,1!
            rem echo s: !s!
            if not "!s!"=="[" (
                set %%i=%%j
                echo %%i: !%%i!
            )
        )
        del !%FUNCNAME%!
    ) else (
        echo INFO: File !%FUNCNAME%! not exist ...
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIParametr ()
rem --------------------------------------------------------------------------------
:GetINIParametr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LFileName=%1
    set LParameter=%2

    rem type !LFileName!

    if exist !LFileName! (
        for /f "eol=# delims== tokens=1,2" %%i in (!LFileName!) do (
            rem В переменной i - ключ
            rem В переменной j - значение
            set s=%%i
            set s=!s:~0,1!
            rem echo s: !s!
            if not "!s!"=="[" (
                if defined LParameter (
                    if "%%i"=="!LParameter!" (
                       set %%i=%%j
                       echo %%i: !%%i!
                       exit /b 0
                    )
                ) else (
                    set %%i=%%j
                    echo %%i: !%%i!
                )
            )
        )
    ) else (
        echo INFO: File !LFileName! not exist ...
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetDir (SET, args)
rem --------------------------------------------------------------------------------
:GetDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSET=%1
    if not defined LSET (
        set LSET=*.*
    )
    echo LSET: !LSET!

    rem set LARGS=%2
    rem echo LARGS: !LARGS!

    for /d %%D in ( !LSET!  ) do  (
        set Directory=%%~fD
        echo !Directory!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFile (SET, view, arg)
rem --------------------------------------------------------------------------------
:GetFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSET=%1
    if not defined LSET (
        set LSET=*.*
    )
    echo LSET: !LSET!

    set Lview=%2
    if not defined Lview (
        set Lview=~f
    )
    echo Lview: !Lview!

    set Larg=%3
    if not defined Larg (
        set Larg=
    )
    echo Larg: !Larg!

    for /r %%F in ( !LSET!  ) do  (
        set File=%%%Lview%F
        echo !File!
    )

    exit /b 0
rem endfunction

rem ===================================================================
