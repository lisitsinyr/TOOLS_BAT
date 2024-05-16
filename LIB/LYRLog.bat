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
    set FUNCNAME=%0
    set FUNCNAME=LYRLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure SETVarLog ()
rem --------------------------------------------------------------------------------
:SETVarLog
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SETVarLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    set S01=------------------------------------------------------
    rem --------------------------------
    set /a loStandard=0
    set /a loTextFile=1
    set /a loAll=2
    rem --------------------------------
    set /a NOTSET=0
    set /a DEBUGT=1
    set /a INFO=2
    set /a WARNING=3
    set /a ERROR=4
    set /a CRITICAL=5
    set /a DEBUGTEXT=11
    set /a BEGIN=21
    set /a END=22
    set /a PROCESS=23
    set /a TEXT=24
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
    set FUNCNAME=%0
    set FUNCNAME=SHORTLevel
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set SHORTLevel=SHORTLevel
    rem echo SHORTLevel: !SHORTLevel!

    set /a Llevel=%1
    rem echo Llevel: !Llevel!

    set SHORTLevelName=

    if !Llevel! EQU !INFO! (
        set SHORTLevelName=!ctlsINFO!
    )
    if !Llevel! EQU !WARNING! (
        set SHORTLevelName=!ctlsWARNING!
    )
    if !Llevel! EQU !ERROR! (
        set SHORTLevelName=!ctlsERROR!
    )
    if !Llevel! EQU !CRITICAL! (
        set SHORTLevelName=!ctlsCRITICAL!
    )
    if !Llevel! EQU !DEBUGT! (
        set SHORTLevelName=!ctlsDEBUG!
    )
    if !Llevel! EQU !TEXT! (
        set SHORTLevelName=!ctlsTEXT!
    )
    if !Llevel! EQU !DEBUGTEXT! (
        set SHORTLevelName=!ctlsDEBUGTEXT!
    )
    if !Llevel! EQU !BEGIN! (
        set SHORTLevelName=!ctlsBEGIN!
    )
    if !Llevel! EQU !END! (
        set SHORTLevelName=!ctlsEND!
    )
    if !Llevel! EQU !PROCESS! (
        set SHORTLevelName=!ctlsPROCESS!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FormatStr (Alevel, Amessage)
rem --------------------------------------------------------------------------------
:FormatStr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FormatStr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set FormatStr=FormatStr
    rem echo FormatStr: !FormatStr!

    set /a Llevel=%1
    rem echo Llevel: !Llevel!

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

    call :SHORTLevel !Llevel! || exit /b 1
    rem echo SHORTLevelName: %SHORTLevelName%

    set asctime=!FORMAT!
    set LOG_STR=set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!

    if !Llevel! EQU !INFO! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !WARNING! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !ERROR! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !CRITICAL! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !DEBUGT! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !TEXT! (
        set LOG_STR=!Lmessage!
    )
    if !Llevel! EQU !DEBUGTEXT! (
        set LOG_STR=%SHORTLevelName% %Lmessage%
    )
    if !Llevel! EQU !BEGIN! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !END! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )
    if !Llevel! EQU !PROCESS! (
        set LOG_STR=!asctime! !SHORTLevelName! !Lmessage!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLog (Aout, Alevel, Value)
rem --------------------------------------------------------------------------------
:AddLog
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=AddLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Lout=%1
    rem echo Lout: !Lout!

    set Llevel=%2
    rem echo Llevel: !Llevel!

    call :FormatStr !Llevel! %3 %4 %5 %6 %7 %8 %9 || exit /b 1
    if !Lout! EQU 0 (
        echo %LOG_STR%
    )
    if !Lout! EQU 1 (
        echo %LOG_STR% >> "%LOG_FULLFILENAME%"
    )
    if !Lout! EQU 2 (
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
    set FUNCNAME=%0
    set FUNCNAME=AddLogFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Lout=%1
    rem echo Lout: !Lout!

    set LFileName=%2
    rem echo LFileName: %LFileName%

    if defined LFileName (
        if exist "!LFileName!" (
            for /f %%s in (!LFileName!) do (
                if !Lout! EQU 0 (
                    echo %%s
                )
                if !Lout! EQU 1 (
                    echo %%s >> "!LOG_FULLFILENAME!"
                )
                if !Lout! EQU 2 (
                    echo %%s
                    echo %%s >> "!LOG_FULLFILENAME!"
                )
            )
        ) else (
            call :AddLog !loAll! !ERROR! FileName: !LFileName! || exit /b 1
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StartLogFile (AFileName)
rem --------------------------------------------------------------------------------
:StartLogFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StartLogFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SETVarLog || exit /b 1

    set LOG_FILESCRIPT=!SCRIPT_FILENAME!

    rem ------------------------------------------------------
    rem Открытие файла журнала
    rem ------------------------------------------------------
    set LFileName=!LOG_FULLFILENAME!
    if LOG_FILE_ADD==0 (
        if exist "!LFileName!" (
            del "!LFileName!"
        )
        rem set touchRUN=touch -f "!LFileName!"
        rem set touchRUN=D:\TOOLS\EXE\touch.exe "!LFileName!"
        echo !touchRUN!
        %touchRUN% "!LFileName!"
    ) else (
        if not exist "!LFileName!" (
            rem set touchRUN=touch -f "!LFileName!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!LFileName!"
            echo !touchRUN!
            %touchRUN% "!LFileName!"
        )
    )
    rem -------------------------------------------------------------------
    call :AddLog !loAll! !TEXT! !S01! || exit /b 1
    call :AddLog !loAll! !INFO! Start: !SCRIPT_BASEFILENAME! ... || exit /b 1
    call :AddLog !loAll! !TEXT! !S01! || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StopLogFile ()
rem --------------------------------------------------------------------------------
:StopLogFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StopLogFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem if not "!LOG_FILESCRIPT!"=="!SCRIPT_FILENAME!" (exit /b 0)

    rem -------------------------------------------------------------------
    call :AddLog !loAll! !TEXT! !S01! || exit /b 1
    call :AddLog !loAll! !INFO! Stop: !SCRIPT_BASEFILENAME! ... || exit /b 1
    call :AddLog !loAll! !TEXT! !S01! || exit /b 1
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction
