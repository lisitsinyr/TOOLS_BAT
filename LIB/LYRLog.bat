@echo off
rem -------------------------------------------------------------------
rem LYRLog.bat
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
rem procedure __SETVarLog ()
rem --------------------------------------------------------------------------------
:__SETVarLog
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SETVarLog
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
rem function __SHORTLevelName (Alevel) -> __SHORTLevelName
rem --------------------------------------------------------------------------------
:__SHORTLevelName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SHORTLevel
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set /a Alevel=%1
    rem echo Alevel: !Alevel!

    set __SHORTLevelName=

    if !Alevel! EQU !INFO! (
        set !FUNCNAME!=!ctlsINFO!
    )
    if !Alevel! EQU !WARNING! (
        set !FUNCNAME!=!ctlsWARNING!
    )
    if !Alevel! EQU !ERROR! (
        set !FUNCNAME!=!ctlsERROR!
    )
    if !Alevel! EQU !CRITICAL! (
        set !FUNCNAME!=!ctlsCRITICAL!
    )
    if !Alevel! EQU !DEBUGT! (
        set !FUNCNAME!=!ctlsDEBUG!
    )
    if !Alevel! EQU !TEXT! (
        set !FUNCNAME!=!ctlsTEXT!
    )
    if !Alevel! EQU !DEBUGTEXT! (
        set !FUNCNAME!=!ctlsDEBUGTEXT!
    )
    if !Alevel! EQU !BEGIN! (
        set !FUNCNAME!=!ctlsBEGIN!
    )
    if !Alevel! EQU !END! (
        set !FUNCNAME!=!ctlsEND!
    )
    if !Alevel! EQU !PROCESS! (
        set !FUNCNAME!=!ctlsPROCESS!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __LOG_STR (Alevel, Amessage) -> __LOG_STR
rem --------------------------------------------------------------------------------
:__LOG_STR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__LOG_STR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set /a Alevel=%1
    rem echo Alevel: !Alevel!

    set Amessage=%2 %3 %4 %5 %6 %7 %8 %9
    rem echo Amessage: %Amessage%

    set YYYY=%date:~6,4%
    set MM=%date:~3,2%
    set DD=%date:~0,2%
    set HH=%TIME:~0,2%
    set MIN=%TIME:~3,2%
    set SS=%TIME:~6,2%

    set FORMAT=!YYYY!-!MM!-!DD! !HH!:!MIN!:!SS!
    rem echo FORMAT:!FORMAT!

    call :__SHORTLevelName !Alevel! || exit /b 1
    rem echo __SHORTLevelName:!__SHORTLevelName!
    
    set FUNCNAME=__LOG_STR

    set asctime=!FORMAT!

    set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!

    if !Alevel! EQU !INFO! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !WARNING! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !ERROR! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !CRITICAL! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !DEBUGT! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !TEXT! (
        set !FUNCNAME!=!Amessage!
    )
    if !Alevel! EQU !DEBUGTEXT! (
        set !FUNCNAME!=!__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !BEGIN! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !END! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )
    if !Alevel! EQU !PROCESS! (
        set !FUNCNAME!=!asctime! !__SHORTLevelName! !Amessage!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLogConsole (s)
rem --------------------------------------------------------------------------------
:AddLogConsole
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=AddLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
    set s=%*

    if !GLevel! EQU !NOTSET! (
        call :WriteNOTSET !s!
    )
    if !GLevel! EQU !DEBUG! (
        call :WriteDEBUG !s!
    )
    if !GLevel! EQU !INFO! (
        call :WriteINFO !s!
    )
    if !GLevel! EQU !WARNING! (
        call :WriteWARNING !s!
    )
    if !GLevel! EQU !ERROR! (
        call :WriteERROR !s!
    )
    if !GLevel! EQU !CRITICAL! (
        call :WriteCRITICAL !s!
    )
    if !GLevel! EQU !BEGIN! (
        call :WriteBEGIN !s!
    )
    if !GLevel! EQU !END! (
        call :WriteEND !s!
    )
    if !GLevel! EQU !PROCESS! (
        call :WritePROCESS !s!
    )
    if !GLevel! EQU !DEBUGTEXT! (
        call :WriteDEBUGTEXT !s!
    )
    if !GLevel! EQU !TEXT! (
        call :WriteTEXT !s!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLog (Aout, Alevel, ...)
rem --------------------------------------------------------------------------------
:AddLog
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=AddLog
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set /a Aout=%1
    rem echo Aout: !Aout!
    set /a Glevel=%2
    rem echo Glevel: !Glevel!

    call :__LOG_STR !Glevel! %3 %4 %5 %6 %7 %8 %9 || exit /b 1
    if !Aout! EQU 0 (
        rem echo !__LOG_STR!
        call ::AddLogConsole !__LOG_STR!
    )
    if !Aout! EQU 1 (
        echo !__LOG_STR! >> "!LOG_FULLFILENAME!"
    )
    if !Aout! EQU 2 (
        rem echo !__LOG_STR!
        call ::AddLogConsole !__LOG_STR!
        echo !__LOG_STR! >> "!LOG_FULLFILENAME!"
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

    set /a Aout=%1
    rem echo Aout: !Aout!
    set AFileName=%2
    rem echo AFileName: !AFileName!

    if defined AFileName (
        if exist "!AFileName!" (
            for /f %%s in (!AFileName!) do (
                if !Aout! EQU 0 (
                    echo %%s
                )
                if !Aout! EQU 1 (
                    echo %%s >> "!LOG_FULLFILENAME!"
                )
                if !Aout! EQU 2 (
                    echo %%s
                    echo %%s >> "!LOG_FULLFILENAME!"
                )
            )
        ) else (
            call :AddLog !loAll! !ERROR! FileName: !AFileName! || exit /b 1
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StartLogFile ()
rem --------------------------------------------------------------------------------
:StartLogFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=StartLogFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :__SETVarLog || exit /b 1

    set LOG_FILESCRIPT=!SCRIPT_FILENAME!

    rem ------------------------------------------------------
    rem Открытие файла журнала
    rem ------------------------------------------------------
    set LFileName=!LOG_FULLFILENAME!
    rem echo LFileName: !LFileName!
    rem echo LOG_FILE_ADD:!LOG_FILE_ADD!

    if !LOG_FILE_ADD! EQU 0 (
        if exist "!LFileName!" (
            rem echo INFO: File !LFileName! exist ...
            del "!LFileName!"
        )
        rem set touchRUN=touch -f "!LFileName!"
        rem set touchRUN=D:\TOOLS\EXE\touch.exe "!LFileName!"
        rem echo touchRUN: !touchRUN!
        %touchRUN% "!LFileName!"
    ) else (
        if not exist "!LFileName!" (
            rem echo INFO: File !LFileName! not exist ...
            rem set touchRUN=touch -f "!LFileName!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!LFileName!"
            echo touchRUN: !touchRUN!
            %touchRUN% "!LFileName!"
        )
    )
    rem -------------------------------------------------------------------
    rem call :AddLog !loAll! !PROCESS! !S01! || exit /b 1
    call :AddLog !loAll! !PROCESS! Start: !SCRIPT_BASEFILENAME! ... || exit /b 1
    rem call :AddLog !loAll! !PROCESS! !S01! || exit /b 1
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

    rem -------------------------------------------------------------------
    rem call :AddLog !loAll! !PROCESS! !S01! || exit /b 1
    call :AddLog !loAll! !PROCESS! Stop: !SCRIPT_BASEFILENAME! ... || exit /b 1
    rem call :AddLog !loAll! !PROCESS! !S01! || exit /b 1
    rem -------------------------------------------------------------------

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
