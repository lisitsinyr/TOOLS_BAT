@echo off
rem -------------------------------------------------------------------
rem LYRParserINI.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRParserINI ()
rem --------------------------------------------------------------------------------
:LYRParserINI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRSupport
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo ERROR: function !FUNCNAME! not implemented! ...

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

    set Section=
    if exist !AFileName! (
        for /f "eol=# delims== tokens=1,2" %%i in (!AFileName!) do (

            rem usebackq

            rem В переменной i - ключ
            rem echo i:%%i
            rem В переменной j - значение
            rem echo j:%%j
           
            rem set %%i=%%j

            set STRi=%%i
            rem echo STRi:!STRi!
            call :TrimRight !STRi! || exit /b 1
            rem echo TrimRight:!TrimRight!

            set STRj=%%j
            rem echo STRj:!STRj!
            call :TrimLeft !STRj! || exit /b 1
            rem echo TrimLeft:!TrimLeft!

            set s=%%i
            set s=!s:~0,1!
            rem echo s:!s!
            if "!s!"=="[" (
                set s=%%i
                set Section=!s:~1,-1!
                rem echo Section:!Section!
            ) else (
                if defined AParameter (
                    if "!TrimRight!"=="!AParameter!" (
                        set !TrimRight!=!TrimLeft!
                        rem echo !TrimRight!=!TrimLeft!
                        set !FUNCNAME!=!TrimLeft!
                        exit /b 0
                    )
                ) else (
                    if defined ASection (
                        if "!ASection!"=="!Section!" (
                            set !TrimRight!=!TrimLeft!
                            rem echo !TrimRight!=!TrimLeft!
                            set !FUNCNAME!=!TrimLeft!
                        )
                    ) else (
                        set !TrimRight!=!TrimLeft!
                        rem echo !TrimRight!=!TrimLeft!
                        set !FUNCNAME!=!TrimLeft!
                    )
                )
            )
        )
    ) else (
        echo INFO: File !LFileName! not exist ...
    )
     
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFileParser (AFileName Adelims Atokens Aeol)
rem --------------------------------------------------------------------------------
:GetFileParser
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%1
    if not defined AFileName (
        echo ERROR: FileName not set ...
        exit /b 1
    )
    echo AFileName: !AFileName!

    set Adelims=%~2
    if not defined Adelims (
        set Adelims=^=
    )
    echo Adelims: !Adelims!

    set Atokens=%~3
    if not defined Atokens (
        set Atokens=1,2
    )
    echo Atokens: !Atokens!

    set Aeol=%~4
    if not defined Aeol (
        set Aeol=#
    )
    echo Aeol: !Aeol!
    
    if exist !LFileName! (
        for /f "eol=%Aeol% delims=%Adelims% tokens=%Atokens%" %%i in (!AFileName!) do (
            rem 1 token i - значение
            rem 2 token j - значение
            rem 3 token k - значение

            rem Переменная %i объявлена явно в инструкции FOR, а %j и %k объявлены неявно с помощью tokens=.
            rem С помощью tokens= можно указать до 26 элементов,
            rem если это не вызовет попытки объявить переменную с именем, большим буквы "z" или "Z".

            echo i:%%i
            set STRi=%%i
            echo STRi:!STRi!

            echo j:%%j
            set STRj=%%j
            echo STRj:!STRj!

            rem set token1=%%i
            rem set token2=%%j
            rem set token3=%%k
            rem set token4=%%l
            rem set token5=%%m
            rem echo !token1!!token2!!token3!!token4!!token5!

        )
    ) else (
        echo ERROR: File !AFileName! not exist ...
        exit /b 1
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
