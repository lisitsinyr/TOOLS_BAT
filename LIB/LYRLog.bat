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
rem :LYRLog [%1]
rem --------------------------------------------------------------------------------
:LYRLog
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo LYRLog ...
    rem echo ---------------------------------------------------------------
    set LYRLog=LYRLog
    rem echo %LYRLog%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :FormatStr [%1] Anamesh: str, Alevel: int, Amessage: str
rem --------------------------------------------------------------------------------
:FormatStr
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo FormatStr ...
    rem echo ---------------------------------------------------------------
    set FormatStr=FormatStr
    rem echo %FormatStr%
    set Lnamesh=%1
    rem echo Lnamesh: %Lnamesh%
    set Llevel=%2
    rem echo Llevel: %Llevel%
    set Lmessage=%3
    rem echo Lmessage: %Lmessage%

    set asctime=%date:~6,4%/%date:~3,2%/%date:~0,2% %TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%

    set LOG_STR=set LOG_STR=%asctime% %Lnamesh% %Llevel% NOTSET %Lmessage%
    if "%Llevel%"=="%INFO%" (
        set LOG_STR=%asctime% %Lnamesh% INFO %Lmessage%
    )
    if "%Llevel%"=="%WARNING%" (
        set LOG_STR=%asctime% %Lnamesh% WARNING %Lmessage%
    )
    if "%Llevel%"=="%ERROR%" (
        set LOG_STR=%asctime% %Lnamesh% ERROR %Lmessage%
    )
    if "%Llevel%"=="%CRITICAL%" (
        set LOG_STR=%asctime% %Lnamesh% CRITICAL %Lmessage%
    )
    if "%Llevel%"=="%DEBUG%" (
        set LOG_STR=%asctime% %Lnamesh% DEBUG_ %Lmessage%
    )
    if "%Llevel%"=="%TEXT%" (
        set LOG_STR=%Lmessage%
    )
    if "%Llevel%"=="%DEBUGTEXT%" (
        set LOG_STR=%Lmessage%
    )
    if "%Llevel%"=="%BEGIN%" (
        set LOG_STR=%Lmessage%
    )
    if "%Llevel%"=="%END%" (
        set LOG_STR=%Lmessage%
    )
    if "%Llevel%"=="%PROCESS%" (
        set LOG_STR=%Lmessage%
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :AddLog Aout: Alevel: Value:
rem --------------------------------------------------------------------------------
:AddLog
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo AddLog ...
    rem echo ---------------------------------------------------------------
    set AddLog=AddLog
    rem echo AddLog: %AddLog%
    set Lout=%1
    rem echo Lout: %Lout%
    set Llevel=%2
    rem echo Llevel: %Llevel%
    set LValue=%3
    rem echo LValue: %LValue%

    call :FormatStr %SCRIPT_BASEFILENAME% %Llevel% %LValue% || exit /b 1
    rem echo LOG_STR: %LOG_STR%

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
rem :AddLogFile Aout: AFileName:
rem --------------------------------------------------------------------------------
:AddLogFile
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo AddLogFile ...
    rem echo ---------------------------------------------------------------
    set AddLogFile=AddLogFile
    rem echo %AddLogFile%
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
        call :AddLog %loAll% %ERROR% "FileName: %LFileName%" || exit /b 1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :StartLogFile [%1] AFileName: str
rem --------------------------------------------------------------------------------
:StartLogFile
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo StartLogFile ...
    rem echo ---------------------------------------------------------------
    set StartLogFile=StartLogFile
    rem echo %StartLogFile%

    rem ------------------------------------------------------
    rem Открытие файла журнала
    rem ------------------------------------------------------
    set LFileName=%LOG_FULLFILENAME%
    if "%LOG_FILE_ADD%"=="1" (
        if exist "%LFileName%" (
            del "%LFileName%"
        )
    ) else (
        if not exist %LFileName% (
            touch "%LFileName%"
        )
    )

    if "%__START_LOG__%"=="1" (exit /b 0) else (set __START_LOG__=1)

    rem -------------------------------------------------------------------
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    call :AddLog %loAll% %INFO% "Start: LOG_FULLFILENAME: %LOG_FULLFILENAME%" || exit /b 1
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :StopLogFile [%1]
rem --------------------------------------------------------------------------------
:StopLogFile
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo StopLogFile ...
    rem echo ---------------------------------------------------------------
    set StopLogFile=StopLogFile
    rem echo %StopLogFile%

    rem -------------------------------------------------------------------
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    call :AddLog %loAll% %INFO% "Stop ..."
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction
