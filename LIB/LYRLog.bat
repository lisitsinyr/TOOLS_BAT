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
    rem echo %FormatStr%

    set Lnamesh=%1
    rem echo Lnamesh: %Lnamesh%
    set Llevel=%2
    rem echo Llevel: %Llevel%
    set Lmessage=%3
    rem echo Lmessage: %Lmessage%

    rem printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1

    set asctime=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    set Linfo=
    set S=
    if "%Llevel%"=="%INFO%" (
        set Linfo=INFO
    ) else (
    if "%Llevel%"=="%TEXT%" (
        set Linfo=TEXT
    ))
    set S_INFO=%asctime% %Lnamesh% %Linfo% %Lmessage%
    set S_TEXT=%Lmessage%

    if "%Llevel%"=="%INFO%" (
        set S=%S_INFO%
    ) else (
    if "%Llevel%"=="%TEXT%" (
        set S=%S_TEXT%
    ))

    echo S: %S%

    rem case "$Llevel" in
    rem $NOTSET)
    rem     Linfo='NOTSET'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $DEBUG)
    rem     Linfo='DEBUG'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $INFO)
    rem     Linfo='INFO'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $WARNING)
    rem     Linfo='WARNING'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $ERROR)
    rem     Linfo='ERROR'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $CRITICAL)
    rem     Linfo='CRITICAL'
    rem     printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
    rem     ;;
    rem $DEBUGTEXT)
    rem     Linfo='DEBUGTEXT'
    rem     printf -v LOG_STR "%-s" "$Lmessage"
    rem     ;;
    rem $BEGIN)
    rem     Linfo='BEGIN'
    rem     printf -v LOG_STR "%-s" "$Lmessage"
    rem     ;;
    rem $END)
    rem     Linfo='END'
    rem     printf -v LOG_STR "%-s" "$Lmessage"
    rem     ;;
    rem $PROCESS)
    rem     Linfo='PROCESS'
    rem     printf -v LOG_STR "%-s" "$Lmessage"
    rem     ;;
    rem $TEXT)
    rem     Linfo='TEXT'
    rem     printf -v LOG_STR "%-s" "$Lmessage"
    rem     ;;
    rem *)
    rem     Linfo=''
    rem     ;;
    rem esac

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
    rem echo %AddLog%

    set Lout=%1
    rem echo %Lout%
    set Llevel=%2
    rem echo %Llevel%
    set LValue=%3
    rem echo %LValue%

    rem FormatStr "$LOG_SHFILENAME" "$Llevel" "$LValue"
    call :FormatStr %SCRIPT_BASEFILENAME% %Llevel% %LValue% || exit /b 1

    rem if [ $Lout -eq 0 ] ; then
    rem     echo "$LOG_STR"
    rem elif [ $Lout -eq 1 ] ; then
    rem     # echo "$LOG_STR" >&3
    rem     echo "$LOG_STR" >> "$LOG_FILE"
    rem elif [ $Lout -eq 2 ] ; then
    rem     # echo "$LOG_STR"
    rem     # echo "$LOG_STR" >&3
    rem     echo "$LOG_STR" | tee -a "$LOG_FILE"
    rem else
    rem     echo 'ERROR' $Lout
    rem fi

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
    rem echo %AddLogFile%

    rem Lout=$1
    rem LFileName="$2"
    rem if [ -r "$LFileName" ] ; then
    rem     # чтения файла построчно
    rem     # while IFS= read -r LValue; do
    rem     #     AddLog $Lout $TEXT "$LValue"
    rem     # done < "$LFileName"

    rem     # Использование дескриптора файла
    rem     # Вы также можете предоставить ввод в цикл, используя дескриптор файла:
    rem     while IFS= read -r -u9 LValue; do
    rem         AddLog $Lout $TEXT "$LValue"
    rem     done 9< "$LFileName"
    rem     exec 9>&-
    rem else
    rem     echo 'ERROR' "$LFileName"
    rem fi

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
    rem if [[ "$LOG_FILE_ADD" -eq 1 ]] ; then
    rem     LFileName="$LOG_FILE"
    rem     if [ -r "$LFileName" ] ; then
    rem         # echo "$LFileName"
    rem         rm "$LFileName"
    rem     fi
    rem     touch "$LFileName"
    rem fi
    rem exec 3>>"$LFileName"

    if "%__START_LOG__%"=="1" (exit /b 0) else (set __START_LOG__=1)

    rem echo ================================================================= > %LOG_FULLFILENAME%
    rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%                              >> %LOG_FULLFILENAME%
    rem echo ================================================================= >> %LOG_FULLFILENAME%

    rem -------------------------------------------------------------------
    rem AddLog $loAll $INFO "Старт: $(date +"$FORMAT")"
    call :AddLog %loAll% %TEXT% %S01% || exit /b 1
    call :AddLog %loAll% %INFO% "Start: ..." || exit /b 1
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
    rem AddLog $loAll $INFO "Стоп: $(date +"$FORMAT")"
    rem -------------------------------------------------------------------

    exit /b 0
rem endfunction
