@echo off
rem -------------------------------------------------------------------
rem LYRLog.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRLog
rem     :FormatStr
rem     :AddLog
rem     :AddLogFile
rem     :StartLogFile
rem     :StopLogFile
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRLog ()
rem --------------------------------------------------------------------------------
:LYRLog
rem beginfunction
    set FUNCNAME=:LYRLog
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SETVarLog ()
rem --------------------------------------------------------------------------------
:SETVarLog
rem beginfunction
    rem -------------------------------------------------------------------
    set S01=------------------------------------------------------
    rem --------------------------------
    set loStandard=0
    set loTextFile=1
    set loAll=2
    rem --------------------------------
    set NOTSET=0
    set DEBUGT=1
    set INFO=2
    set WARNING=3
    set ERROR=4
    set CRITICAL=5
    set DEBUGTEXT=11
    set BEGIN=21
    set END=22
    set PROCESS=23
    set TEXT=24
    rem # --------------------------------
    set ctlsNOTSET=" "
    set ctlsDEBUGT=D
    set ctlsINFO=I
    set ctlsWARNING=W
    set ctlsERROR=E
    set ctlsCRITICAL=C
    set ctlsBEGIN="<"
    set ctlsEND=">"
    set ctlsPROCESS=P
    set ctlsDEBUGTEXT=T
    set ctlsTEXT=T

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SHORTLevel (Alevel)
rem --------------------------------------------------------------------------------
:SHORTLevel
rem beginfunction
    set FUNCNAME=:SHORTLevel
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set SHORTLevel=SHORTLevel
    rem echo SHORTLevel: %SHORTLevel%
    set Llevel=%1
    rem echo Llevel: %Llevel%
    set SHORTLevelName=
    if "%Llevel%"=="%INFO%" (
        set SHORTLevelName=%ctlsINFO%
    )
    if "%Llevel%"=="%WARNING%" (
        set SHORTLevelName=%ctlsWARNING%
    )
    if "%Llevel%"=="%ERROR%" (
        set SHORTLevelName=%ctlsERROR%
    )
    if "%Llevel%"=="%CRITICAL%" (
        set SHORTLevelName=%ctlsCRITICAL%
    )
    if "%Llevel%"=="%DEBUGT%" (
        set SHORTLevelName=%ctlsDEBUG%
    )
    if "%Llevel%"=="%TEXT%" (
        set SHORTLevelName=%ctlsTEXT%
    )
    if "%Llevel%"=="%DEBUGTEXT%" (
        set SHORTLevelName=%ctlsDEBUGTEXT%
    )
    if "%Llevel%"=="%BEGIN%" (
        set SHORTLevelName=%ctlsBEGIN%
    )
    if "%Llevel%"=="%END%" (
        set SHORTLevelName=%ctlsEND%
    )
    if "%Llevel%"=="%PROCESS%" (
        set SHORTLevelName=%ctlsPROCESS%
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FormatStr (Alevel, Amessage)
rem --------------------------------------------------------------------------------
:FormatStr
rem beginfunction
    set FUNCNAME=:FormatStr
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set FormatStr=FormatStr
    rem echo %FormatStr%
    set Llevel=%1
    rem echo Llevel: %Llevel%
    set Lmessage=%2 %3 %4 %5 %6 %7 %8 %9
    rem echo Lmessage: %Lmessage%
    set YYYY=%date:~6,4%
    set MM=%date:~3,2%
    set DD=%date:~0,2%
    set HH=%TIME:~0,2%
    set MM=%TIME:~3,2%
    set SS=%TIME:~6,2%
    rem --------------------------------
    set FORMAT=%YYYY%-%MM%-%DD% %HH%:%MM%:%SS%
    rem echo.%FORMAT%
    rem --------------------------------
    call :SHORTLevel %Llevel% || exit /b 1
    rem echo SHORTLevelName: %SHORTLevelName%
    set asctime=%FORMAT%
    set LOG_STR=set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%

    if "%Llevel%"=="%INFO%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%WARNING%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%ERROR%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%CRITICAL%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%DEBUGT%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%TEXT%" (
        set LOG_STR=%Lmessage%
    )
    if "%Llevel%"=="%DEBUGTEXT%" (
        set LOG_STR=%SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%BEGIN%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%END%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )
    if "%Llevel%"=="%PROCESS%" (
        set LOG_STR=%asctime% %SHORTLevelName% %Lmessage%
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLog (Aout, Alevel, Value)
rem --------------------------------------------------------------------------------
:AddLog
rem beginfunction
    set FUNCNAME=:AddLog
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set Lout=%1
    rem echo Lout: %Lout%
    set Llevel=%2
    rem echo Llevel: %Llevel%
    call :FormatStr %Llevel% %3 %4 %5 %6 %7 %8 %9 || exit /b 1
    if %Lout% EQU 0 (
        echo %LOG_STR%
    )
    if %Lout% EQU 1 (
        echo %LOG_STR% >> "%LOG_FULLFILENAME%"
    )
    if %Lout% EQU 2 (
        echo %LOG_STR%
        echo %LOG_STR% >> "%LOG_FULLFILENAME%"
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLogFile (Aout, AFileName)
rem --------------------------------------------------------------------------------
:AddLogFile
rem beginfunction
    set FUNCNAME=:AddLogFile
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set Lout=%1
    rem echo Lout: %Lout%
    set LFileName=%2
    rem echo LFileName: %LFileName%
    if exist %LFileName% (
        for /f %%s in (%LFileName%) do (
            if %Lout% EQU 0 (
                echo %%s
            )
            if %Lout% EQU 1 (
                echo %%s >> "%LOG_FULLFILENAME%"
            )
            if %Lout% EQU 2 (
                echo %%s
                echo %%s >> "%LOG_FULLFILENAME%"
            )
        )
    ) else (
        call :AddLog %loAll% %ERROR% FileName: %LFileName% || exit /b 1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StartLogFile (AFileName)
rem --------------------------------------------------------------------------------
:StartLogFile
rem beginfunction
    set FUNCNAME=:StartLogFile
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    call :SETVarLog

    set LOG_FILESCRIPT=%SCRIPT_FILENAME%

    rem ------------------------------------------------------
    rem Открытие файла журнала
    rem ------------------------------------------------------
    set LFileName=%LOG_FULLFILENAME%
    if "%LOG_FILE_ADD%"=="0" (
        if exist "%LFileName%" (
            del "%LFileName%"
        )
        touch "%LFileName%"
    ) else (
        if not exist %LFileName% (
            touch "%LFileName%"
        )
    )
    rem -------------------------------------------------------------------
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    call :AddLog %loAll% %INFO% Start: %SCRIPT_BASEFILENAME% ... || exit /b 1
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StopLogFile ()
rem --------------------------------------------------------------------------------
:StopLogFile
rem beginfunction
    set FUNCNAME=:StopLogFile
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem if not "%LOG_FILESCRIPT%"=="%SCRIPT_FILENAME%" (exit /b 0)

    rem -------------------------------------------------------------------
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    call :AddLog %loAll% %INFO% Stop: %SCRIPT_BASEFILENAME% || exit /b 1
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction
