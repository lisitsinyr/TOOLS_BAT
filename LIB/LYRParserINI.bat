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
rem procedure LYRParserINIINIT () -> None
rem --------------------------------------------------------------------------------
:LYRParserINIINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRParserINIINIT
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
rem procedure SetINI (AFileName, ASection, AKeyName, AKeyValue) -> None
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
    set AKeyName=%~3
    rem echo AKeyName:!AKeyName!
    set AKeyValue=%~4
    rem echo AKeyValue:!AKeyValue!

    %SetINIAPP% "!AFileName!" !ASection! !AKeyName! "!AKeyValue!"

    set SetINI=!AKeyValue!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINI (AFileName, ASection, AKeyName) -> None
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
    set AKeyName=%~3
    rem echo AKeyName:!AKeyName!

    set __GetINI=!TEMP_DIR!\%random%.tmp
    rem echo __GetINI:!__GetINI!

    rem echo %GetINIAPP%
    %GetINIAPP% !AFileName! !ASection! !AKeyName! > !__GetINI!

    rem type !__GetINI!

    set KeyValue=

    set n=0
    set k=0
    if exist !__GetINI! (
        if not defined ASection (
            for /f %%i in (!__GetINI!) do (
                set Sections[!n!]=%%i
                rem echo !Sections[%n%]!
                set /A n+=1
            )
            set GetINI=!AFileName!
        ) else (
            for /f "eol=# delims== tokens=1,2" %%i in (!__GetINI!) do (
                rem В переменной i - ключ
                rem В переменной j - значение

                set %%i=%%j
                rem echo %%i:!%%i!

                set KeyNames[!k!]=%%i
                set /A k+=1

                set STRi=%%i
                rem echo STRi:!STRi!
                call :TrimRight !STRi! || exit /b 1
                rem echo TrimRight:!TrimRight!

                set STRj=%%j
                rem echo STRj:!STRj!
                call :TrimLeft !STRj! || exit /b 1
                rem echo TrimLeft:!TrimLeft!

                set KeyValue=!TrimLeft!
                rem echo KeyValue:!KeyValue!

                set GetINI=!TrimLeft!
            )
        )

        del !__GetINI!

    ) else (
        echo INFO: File !__GetINI! not exist ...
    )
    set /a SectionsCount=n-1
    set /a KeyNamesCount=k-1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIPY (AFileName, ASection, AKeyName) -> None
rem --------------------------------------------------------------------------------
:GetINIPY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINIPY
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set ASection=%~2
    rem echo ASection:!ASection!
    set AKeyName=%~3
    rem echo AKeyName:!AKeyName!

    set __GetINI=!TEMP_DIR!\%random%.tmp
    rem echo __GetINI:!__GetINI!

    echo %GetINIAPPPY%

    call %GetINIAPPPY% !AFileName! !ASection! !AKeyName!

    rem type !__GetINI!

    set KeyValue=

    set n=0
    set k=0
    if exist !__GetINI! (
        if not defined ASection (
            for /f %%i in (!__GetINI!) do (
                set Sections[!n!]=%%i
                rem echo !Sections[%n%]!
                set /A n+=1
            )
            set GetINIPY=!AFileName!
        ) else (
            for /f "eol=# delims== tokens=1,2" %%i in (!__GetINI!) do (
                rem В переменной i - ключ
                rem В переменной j - значение

                set %%i=%%j
                rem echo %%i:!%%i!

                set KeyNames[!k!]=%%i
                set /A k+=1

                set STRi=%%i
                rem echo STRi:!STRi!
                call :TrimRight !STRi! || exit /b 1
                rem echo TrimRight:!TrimRight!

                set STRj=%%j
                rem echo STRj:!STRj!
                call :TrimLeft !STRj! || exit /b 1
                rem echo TrimLeft:!TrimLeft!

                set KeyValue=!TrimLeft!
                rem echo KeyValue:!KeyValue!

                set GetINIPY=!TrimLeft!
            )
        )

        del !__GetINI!

    ) else (
        echo INFO: File !__GetINI! not exist ...
    )
    set /a SectionsCount=n-1
    set /a KeyNamesCount=k-1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIParametr (AFileName, ASection, AKeyName) -> None
rem --------------------------------------------------------------------------------
:GetINIParametr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetINIParametr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set ASection=%~2
    rem echo ASection:!ASection!
    set AKeyName=%~3
    rem echo AKeyName:!AKeyName!

    rem type !AFileName!

    set Sections=
    set KeyNames=

    set KeyValue=
    set Section=
    set /A n=0
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
                set Sections[!n!]=!Section!
                set /A n+=1
                set /A k=0
            ) else (
                if defined AKeyName (
                    if "!TrimRight!"=="!AKeyName!" (
                        set !TrimRight!=!TrimLeft!
                        set GetINIParametr=!TrimLeft!
                        set KeyValue=!TrimLeft!
                    )
                ) else (
                    if defined ASection (
                        if "!ASection!"=="!Section!" (
                            set KeyNames[!k!]=%%i
                            set /A k+=1

                            set !TrimRight!=!TrimLeft!
                            set KeyValue=!TrimLeft!
                            set GetINIParametr=!TrimLeft!
                        )
                    ) else (
                        rem echo INFO: ASection not defined ...
                        rem set !TrimRight!=!TrimLeft!
                        rem set KeyValue=!TrimLeft!
                        rem set GetINIParametr=!TrimLeft!
                    )
                )
            )
        )
    ) else (
        echo INFO: File !AFileName! not exist ...
    )
    set /a SectionsCount=n-1
    set /a KeyNamesCount=k-1

rem Как удалить все переменные в cmd (только в одном окне)?
rem Совершенно верно, можно при помощи for с ключом /f обработать вывод команды set без параметров, получив имена всех (почти) определённых переменных среды (частей выводимых строк до знака =: delims==):
rem for /f "delims==" %v in ('set') do  set "%v="
rem (при использовании в командных файлах % перед переменной цикла надо удвоить).


    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFileParser (AFileName Adelims Atokens Aeol) -> None
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
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0

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
