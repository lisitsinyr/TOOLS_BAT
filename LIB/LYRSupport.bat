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
rem procedure Pause (APause)
rem --------------------------------------------------------------------------------
:Pause
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=_Pause
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set /a APause=%1
    rem echo APause:!APause!

    if not defined APause (
        timeout 0
    ) else (
        timeout !APause!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Check_P (P_Name, P_Value)
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
    rem echo P_Name:!P_Name!
    rem %P_Name% - имя переменной
    rem echo P_Name:%P_Name%

    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value_default:!%P_Name%!

    rem - значение переменной
    set P_Value=%~2
    rem echo P_Value:!P_Value!

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
    rem echo Input:!Input!

    if not defined Input (
        rem [!%P_Name%!] - значение переменной по умолчанию
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_P (P_Name, P_Value)
rem --------------------------------------------------------------------------------
:Read_P
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_P
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem !PN_CAPTION! - CAPTION
    rem echo PN_CAPTION:!PN_CAPTION!

    rem !P_Name! - имя переменной
    set P_Name=%1
    rem echo P_Name:!P_Name!

    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value [default]:!%P_Name%!

    rem !P_Value! - значение переменной
    set P_Value=%~2
    rem echo P_Value:!P_Value!

    set Input=
    if not defined P_Value (

        if defined PN_CAPTION (
            set /p Input=!PN_CAPTION![!P_Name!][!%P_Name%!]:
        )

    ) else (

        rem !P_Value! - значение переменной
        set %P_Name%=!P_Value!
        exit /b 0
    )
    rem echo Input:!Input!

    if not defined Input (
        rem !%P_Name%! - значение переменной по умолчанию
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_F (P_Name, P_List, Atimeout)
rem --------------------------------------------------------------------------------
:Read_F
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_F
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem !P_Name! - имя переменной
    set P_Name=%1
    rem echo P_Name:!P_Name!

    rem !%P_Name%! - значение переменной по умолчанию
    rem echo P_Value [default]:!%P_Name%!

    rem список создаваемых вариантов
    set P_List=%~2
    rem echo P_List: !P_List!

    rem Atimeout
    set Atimeout=%3
    if not defined Atimeout (
        set Atimeout=10
    )
    rem echo Atimeout:!Atimeout!

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
rem procedure SetINI (AFileName, ASection, AParameter, AValue)
rem --------------------------------------------------------------------------------
:SetINI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set ASection=%~2
    rem echo ASection:!ASection!
    set AParameter=%~3
    rem echo AParameter:!AParameter!
    set AValue=%~4
    rem echo AValue:!AValue!

    %SetINIAPP% "!AFileName!" !ASection! !AParameter! "!AValue!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINI (AFileName, ASection, AParameter)
rem --------------------------------------------------------------------------------
:GetINI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set ASection=%~2
    rem echo ASection:!ASection!
    set AParameter=%~3
    rem echo AParameter:!AParameter!

    set !FUNCNAME!=!TEMP_DIR!\%random%.tmp
    echo !FUNCNAME!: !%FUNCNAME%!

    %GetINIAPP% !AFileName! !ASection! !AParameter! > !%FUNCNAME%!

    rem type !%FUNCNAME%!

    if exist !%FUNCNAME%! (
        for /f "eol=# delims== tokens=1,2" %%i in (!%FUNCNAME%!) do (
            rem В переменной i - ключ
            rem В переменной j - значение

            set %%i=%%j
            echo %%i:!%%i!

            rem set STRi=%%i
            rem rem echo STRi:!STRi!
            rem call :TrimRight !STRi! || exit /b 1
            rem rem echo TrimRight:!TrimRight!
            rem set STRj=%%j
            rem rem echo STRj:!STRj!
            rem call :TrimLeft "!STRj!" || exit /b 1
            rem rem echo TrimLeft:!TrimLeft!
            rem !%TrimRight%!=!TrimLeft!
            rem echo !TrimRight!=!TrimLeft!
        )

        rem del !%FUNCNAME%!

    ) else (
        echo INFO: File !%FUNCNAME%! not exist ...
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIParametr (AFileName, ASection, AParameter)
rem --------------------------------------------------------------------------------
:GetINIParametr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set ASection=%~2
    rem echo ASection:!ASection!
    set AParameter=%~3
    rem echo AParameter:!AParameter!

    rem type !AFileName!

    if exist !AFileName! (
        for /f "eol=# delims== tokens=1,2" %%i in (!AFileName!) do (

            rem usebackq

            rem В переменной i - ключ
            rem echo i:%%i
            rem В переменной j - значение
            rem echo j:%%j
            
            rem set %%i=%%j

            set s=%%i
            set s=!s:~0,1!
            rem echo s:!s!

            if "!s!"=="[" (

                set s=%%i
                set Section=!s:~1,-1!
                echo Section:!Section!

            ) else (
                if defined AParameter (
                    set STRi=%%i
                    rem echo STRi:!STRi!
                    call :TrimRight !STRi! || exit /b 1
                    rem echo TrimRight:!TrimRight!

                    if "!TrimRight!"=="!AParameter!" (
                        rem echo i:%%i
                        rem echo j:%%j

                        set STRj=%%j
                        rem set STRj=!STRj:"=!
                        rem echo STRj:!STRj!

                        call :TrimLeft !STRj! || exit /b 1
                        rem echo TrimLeft:!TrimLeft!

                        !%TrimRight%!=!TrimLeft!
                        echo !TrimRight!=!TrimLeft!

                        exit /b 0
                    )
                ) else (
                    set STRi=%%i
                    rem echo STRi:!STRi!
                    call :TrimRight !STRi! || exit /b 1
                    rem echo TrimRight:!TrimRight!

                    set STRj=%%j
                    rem set STRj=!STRj:"=!
                    rem echo STRj:!STRj!

                    call :TrimLeft !STRj! || exit /b 1
                    rem echo TrimLeft:!TrimLeft!

                    !%TrimRight%!=!TrimLeft!
                    echo !TrimRight!=!TrimLeft!
                )
            )
        )
    ) else (
        echo INFO: File !LFileName! not exist ...
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFileParser (FileName delims tokens eol)
rem --------------------------------------------------------------------------------
:GetFileParser
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LFileName=%1
    if not defined LFileName (
        echo ERROR: File not set ...
        exit /b 1
    )
    echo FileName: !LFileName!

    set Ldelims=%~2
    if not defined Ldelims (
        set Ldelims=^=
    )
    echo delims: !Ldelims!

    set Ltokens=%~3
    if not defined Ltokens (
        set Ltokens=1,2
    )
    echo tokens: !Ltokens!

    set Leol=%~4
    if not defined Leol (
        set Leol=#
    )
    echo eol: !Leol!
    
    if exist !LFileName! (
        for /f "eol=%Leol% delims=%Ldelims% tokens=%Ltokens%" %%i in (!LFileName!) do (
            rem 1 token i - значение
            rem 2 token j - значение
            rem 3 token k - значение

            rem Переменная %i объявлена явно в инструкции FOR, а %j и %k объявлены неявно с помощью tokens=.
            rem С помощью tokens= можно указать до 26 элементов,
            rem если это не вызовет попытки объявить переменную с именем, большим буквы "z" или "Z".

            rem set s=%%i
            rem set s=!s:~0,1!
            rem echo s: !s!

            rem echo %%i_%%j
            
            echo i:%%i
            set STR=%%i
            echo STR:!STR!
            call :TrimRight !STR! || exit /b 1
            echo STR:!STR!

            echo j:%%j
            set STR=%%j
            echo STR:!STR!
            call :TrimLeft !STR! || exit /b 1
            echo STR:!STR!
            call :TrimRight !STR! || exit /b 1
            echo STR:!STR!

            rem set token1=%%i
            rem set token2=%%j
            rem set token3=%%k
            rem set token4=%%l
            rem set token5=%%m
            rem echo !token1!!token2!!token3!!token4!!token5!

        )
    ) else (
        echo ERROR: File !LFileName! not exist ...
        exit /b 1
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetDir (SET, view, arg)
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
    echo SET: !LSET!
    set Lview=%2
    if not defined Lview (
        set Lview=~f
    )
    echo view: !Lview!
    set Larg=%3
    if not defined Larg (
        set Larg=
    )
    echo arg: !Larg!

    for %Larg% /d %%D in ( !LSET!  ) do  (
        set Directory=%%%Lview%D
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
    echo SET: !LSET!
    set Lview=%2
    if not defined Lview (
        set Lview=~f
    )
    echo view: !Lview!
    set Larg=%3
    if not defined Larg (
        set Larg=
    )
    echo arg: !Larg!
    for %Larg% %%F in ( !LSET!  ) do  (
        set File=%%%Lview%F
        echo !File!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FORCicle (start, step, end)
rem --------------------------------------------------------------------------------
:FORCicle
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Lstart=%1
    if not defined Lstart (
        set /a Lstart=1
    )
    echo start: !Lstart!
    set Lstep=%2
    if not defined Lstep (
        set Lstep=1
    )
    echo step: !Lstep!
    set Lend=%3
    if not defined Lend (
        set Lend=10
    )
    echo end: !Lend!
    for /L %%L in ( !Lstart!, !Lstep!, !Lend!  ) do  (
        echo %%L
    )

    exit /b 0
rem endfunction

rem =================================================
rem LYRStrUtils.bat
rem =================================================
:TrimLeft
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimRight
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Trim
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0

rem ===================================================================
