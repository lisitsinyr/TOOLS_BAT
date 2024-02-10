rem -----------------------------------------------
rem LYRLog.bat
rem -----------------------------------------------

setlocal enableextensions
rem Not to be directly called
exit /b 9009

set LOG_OPT_DEFAULT=11
set LOG_FILE_ADD=0
set LOG_FILE_DT=0
rem LOG_DT_FORMAT_DEFAULT='%Y%m%d%H%M%S'
set LOG_DT_FORMAT_DEFAULT='%Y%m%d'

rem --------------------------------
set FORMAT='%Y-%m-%d %H:%M:%S %N'
rem --------------------------------
set loStandard=0
set loTextFile=1
set loAll=2
rem --------------------------------
set NOTSET=0
set DEBUG=1
set INFO=2
set WARNING=3
set ERROR=4
set CRITICAL=5
set DEBUGTEXT=11
set BEGIN=21
set END=22
set PROCESS=23
set TEXT=24
rem --------------------------------
set ctlsNOTSET=' '
set ctlsDEBUG='D'
set ctlsINFO='I'
set ctlsWARNING='W'
set ctlsERROR='E'
set ctlsCRITICAL='C'
set ctlsBEGIN='<'
set ctlsEND='>'
set ctlsPROCESS='P'
set ctlsDEBUGTEXT='T'
set ctlsTEXT=''

rem --------------------------------------------------------------------------------
rem FormatStr
rem --------------------------------------------------------------------------------
:FormatStr (Anamesh: str, Alevel: int, Amessage: str)
rem beginfunction
    echo тест test.............. [%*]
    goto :eof
rem endfunction

rem --------------------------------------------------
rem AddLog
rem --------------------------------------------------
:AddLog (Aout: int, Alevel: int, Value: str)
rem beginfunction
    echo тест test2............... [%*]
    goto :eof
rem endfunction

rem --------------------------------------------------
rem AddLogFile
rem --------------------------------------------------
:AddLogFile (Aout: int, AFileName: str)
rem beginfunction
    echo testErrorlevel............
    exit /b 1
rem endfunction

:test

:test2

:testErrorlevel

:Exit
