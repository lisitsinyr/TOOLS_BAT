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
    echo %LYRLog%
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
    echo %FormatStr%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :AddLog [%1] Aout: int, Alevel: int, Value: str
rem --------------------------------------------------------------------------------
:AddLog
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo AddLog ...
    rem echo ---------------------------------------------------------------
    set AddLog=AddLog
    echo %AddLog%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :AddLogFile [%1] Aout: int, AFileName: str
rem --------------------------------------------------------------------------------
:AddLogFile
rem beginfunction
    rem echo ---------------------------------------------------------------
    rem echo AddLogFile ...
    rem echo ---------------------------------------------------------------
    set AddLogFile=AddLogFile
    echo %AddLogFile%
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
    echo %StartLogFile%
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
    echo %StopLogFile%
    exit /b 0
rem endfunction
