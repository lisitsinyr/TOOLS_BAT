@echo off
rem -------------------------------------------------------------------
rem LYRSupport.bat
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
rem procedure LYRSupport () -> None
rem --------------------------------------------------------------------------------
:LYRSupport
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
rem procedure Pause (APause) -> None
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
rem procedure Read_P (P_Name, P_Value) -> None
rem --------------------------------------------------------------------------------
:Read_P
rem beginfunction

rem setlocal enabledelayedexpansion

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

    rem !P_Value! - значение переменной
    rem set P_Value=%2
    rem echo P_Value:!P_Value!

    set P_Value=%~2
    rem echo P_Value:!P_Value!

    rem !PN_CAPTION! - PN_CAPTION
    rem [!P_Name!]   - имя переменной
    rem [!%P_Name%!] - значение переменной по умолчанию

    set Input=
    if not defined P_Value (
        if defined PN_CAPTION (
            set /p Input=!PN_CAPTION![!P_Name!][!%P_Name%!]:
        ) else (
            set /p Input=[!P_Name!][!%P_Name%!]:
        )
    ) else (
        set %P_Name%=!P_Value!
        exit /b 0
    )
    rem echo Input:!Input!

    if not defined Input (
        set %P_Name%=!%P_Name%!
    ) else (
        set %P_Name%=!Input!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_F (P_Name, P_List, Atimeout) -> None
rem procedure Read_F (P_Name, P_List, ADefault, ACaption, Atimeout) -> None
rem --------------------------------------------------------------------------------
:Read_F
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Read_F
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem P_Name      - Имя переменной
    rem P_List      - список создаваемых вариантов
    rem ADefault    - Значение по умолчанию 
    rem ACaption    - CAPTION
    rem Atimeout    - timeout

    rem P_Value     - Значение переменной
    rem !%P_Name%!  - Значение переменной по умолчанию
    rem !P_Name!    - имя переменной

    set P_Name=%1
    rem echo P_Name:!P_Name!
    set P_List=%~2
    rem echo P_List:!P_List!
    set ADefault=%~3
    rem echo ADefault:!ADefault!
    set ACaption=%~4
    if not defined ACaption (
        set ACaption=!PN_CAPTION!
    )
    rem echo ACaption:!ACaption!
    set Atimeout=%5
    set Atimeout=!TIMEOUT!
    if not defined Atimeout (
        set Atimeout=5
    )
    rem echo Atimeout:!Atimeout!

    rem set %P_Name%=!%P_Name%!
    set %P_Name%=!ADefault!

    if defined P_List (
        choice /C !P_List! /D !%P_Name%! /T !Atimeout! /M "!ACaption!"
        rem echo ERRORLEVEL:!ERRORLEVEL!
        set %P_Name%=!ERRORLEVEL!
        rem if !ERRORLEVEL!==1 (
        rem     set %P_Name%=!ERRORLEVEL!
        rem ) else (
        rem     set %P_Name%=!ERRORLEVEL!
        rem )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Read_N () -> Read_N
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
rem procedure GetDir (ASET, Aview, Aarg) -> None
rem --------------------------------------------------------------------------------
:GetDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASET=%1
    if not defined ASET (
        set ASET=*.*
    )
    echo ASET:!ASET!
    set Aview=%2
    if not defined Aview (
        set Aview=~f
    )
    echo Aview:!Aview!
    set Aarg=%3
    if not defined Aarg (
        set Aarg=
    )
    echo Aarg:!Aarg!

    for %Aarg% /d %%D in ( !ASET!  ) do  (
        set Directory=%%%Aview%D
        echo !Directory!
    )

    set GetDir=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFile (ASET, Aview, Aarg) -> None
rem --------------------------------------------------------------------------------
:GetFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASET=%1
    if not defined ASET (
        set ASET=*.*
    )
    echo ASET:!ASET!
    set Aview=%2
    if not defined Aview (
        set Aview=~f
    )
    echo Aview:!Aview!
    set Aarg=%3
    if not defined Aarg (
        set Aarg=
    )
    echo Aarg:!Aarg!

    for %Aarg% %%F in ( !ASET!  ) do  (
        set File=%%%Aview%F
        echo !File!
    )

    set GetFile=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FORCicle (Astart, Astep, Aend) -> None
rem --------------------------------------------------------------------------------
:FORCicle
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FORCicle
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Astart=%1
    if not defined Astart (
        set /a Astart=1
    )
    echo Astart:!Astart!
    set Astep=%2
    if not defined Astep (
        set Astep=1
    )
    echo Astep:!Astep!
    set Aend=%3
    if not defined Aend (
        set Aend=10
    )
    echo Aend:!Aend!

    for /L %%L in ( !Astart!, !Astep!, !Aend!  ) do  (
        echo %%L
    )

    set FORCicle=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetSET (ASET Adelims Atokens) -> None
rem --------------------------------------------------------------------------------
:GetSET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetSET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASET=%1
    if not defined ASET (
        set ASET=`set`
    )
    echo ASET:!ASET!
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

    for /F "usebackq tokens=%Atokens% delims=%Adelims%" %%i IN ( !ASET!  ) do  (
        echo %%i=%%j
    )

    set GetSET=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetCMD (ASET Adelims Atokens) -> None
rem --------------------------------------------------------------------------------
:GetCMD
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GetCMD
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ASET=%1
    if not defined ASET (
        set ASET=`dir`
    )
    echo ASET:!ASET!
    set Adelims=%~2
    if not defined Adelims (
        set Adelims=^=
    )
    echo Adelims: !Adelims!
    set Atokens=%~3
    if not defined Atokens (
        set Atokens=1-26
    )
    echo Atokens: !Atokens!

    for /F "usebackq tokens=%Atokens% delims=%Adelims%" %%i IN ( !ASET!  ) do  (
        echo %%i^|%%j^|%%k^|%%k^|%%m^|%%n^|%%o^|%%p^|%%r^|%%s^|%%t^|
    )

    set GetCMD=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CheckErrorlevel (ATEXT, AERRORLEVEL, APAUSE) -> None
rem --------------------------------------------------------------------------------
:CheckErrorlevel
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Check_P
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ATEXT=%1
    set GERRORLEVEL=%2
    set APAUSE=%3

    if not !GERRORLEVEL!==0 (
        rem echo ERROR: !ATEXT!-!GERRORLEVEL!
        call :WriteLOG !lERROR! !ATEXT!-!GERRORLEVEL!
        if defined APAUSE (
            call :PressAnyKey
        )
    )

    set CheckErrorlevel=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_Ox (Aname Acaption Adefault) -> script
rem --------------------------------------------------------------------------------
:GET_Ox
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_Ox
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aname=%~1
    rem echo Aname:!Aname!
    set Acaption=%~2
    rem echo Acaption:!Acaption!
    set Adefault=%~3
    rem echo Adefault:!Adefault!

    rem -------------------------------------------------------------------
    rem Ox
    rem -------------------------------------------------------------------
    
    set Ox=!%Aname%!
    rem echo Ox:!%Aname%!

    set Ox_Name=!Aname!
    set Ox_Caption=!Acaption!
    set Ox_Default=!Adefault!
    set Ox=!Ox_Default!
    set PN_CAPTION=!Ox_Caption!

    if not defined Ox (
        call :Read_P Ox || exit /b 1
        set !Aname!=!Ox!
    ) else (
        rem call :Read_P Ox || exit /b 1
        set !Aname!=!Ox!
    )
    if defined Ox (
        rem set !Aname!=!%Aname%!
        set !Aname!=!Ox!
    ) else (
        set !Aname!=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        rem echo INFO: Ox [Ox_Name:!Aname! Ox_Caption:!Acaption!] not defined ...
    )

    rem echo !Aname!=!%Aname%!
    
    set GET_Ox=!Ox!
    echo GET_Ox:!GET_Ox!

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
