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
rem procedure LYRSupport ()
rem --------------------------------------------------------------------------------
:LYRSupport
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRSupport
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo ERROR: function !FUNCNAME! not implemented! ...

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
rem procedure Pause (APause)
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
rem procedure Read_P (P_Name, P_Value)
rem --------------------------------------------------------------------------------
:Read_P
rem beginfunction
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
rem procedure Read_F (P_Name, P_List, Atimeout)
rem procedure Read_F (P_Name, P_List, ADefault, ACaption, Atimeout)
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
    echo P_Name:!P_Name!
    set P_List=%~2
    echo P_List:!P_List!
    set ADefault=%~3
    echo ADefault:!ADefault!
    set ACaption=%~4
    if "!ACaption!"=="" (
        set ACaption=!PN_CAPTION!
    )
    echo ACaption:!ACaption!
    set Atimeout=%5
    set Atimeout=!TIMEOUT!
    if not defined Atimeout (
        set Atimeout=5
    )
    echo Atimeout:!Atimeout!

    set %P_Name%=!%P_Name%!
    set %P_Name%=!ADefault!

    if not "!P_List!"=="" (
        choice /C !P_List! /D !%P_Name%! /T !Atimeout! /M "!ACaption!"
        if !ERRORLEVEL!==1 (
            set %P_Name%=!ERRORLEVEL!
        ) else (
            set %P_Name%=
        )
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
rem procedure GetDir (ASET, Aview, Aarg)
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFile (ASET, Aview, Aarg)
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FORCicle (Astart, Astep, Aend)
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetSET (ASET Adelims Atokens)
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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetCMD (ASET Adelims Atokens)
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
