@call:DateTime

@for %%? in (
    "Year   :Y"
    "Month  :M"
    "Day    :D"
    "Hour   :H"
    "Minutes:I"
    "Seconds:S"
) do @for /f "tokens=1-2 delims=:" %%# in (%%?) do @for /f "delims=" %%_ in ('echo %%_DT_%%$_%%') do @echo %%# : _DT_%%$_ : %%_

:: OUTPUT
:: Year    : _DT_Y_ : 2014
:: Month   : _DT_M_ : 12
:: Day     : _DT_D_ : 17
:: Hour    : _DT_H_ : 09
:: Minutes : _DT_I_ : 04
:: Seconds : _DT_S_ : 35

@pause>nul

@goto:eof

:DateTime
    @verify errorlevel 2>nul & @wmics Alias /? >nul 2>&1
    @if not errorlevel 1 (
        @for /f "skip=1 tokens=1-6" %%a in ('wmic path win32_localtime get day^,hour^,minute^,month^,second^,year /format:table') do @if not "%%f"=="" ( set "_DT_D_=%%a" & set "_DT_H_=%%b" & set "_DT_I_=%%c" & set "_DT_M_=%%d" & set "_DT_S_=%%e" & set "_DT_Y_=%%f" )
    ) else (
        @set "_DT_T_=1234567890 "
    )
    @if errorlevel 1 (
        @for %%? in ("iDate" "sDate" "iTime" "sTime" "F" "Y" "M" "D" "H" "I" "S") do @set "_DT_%%~?_=%%~?"
        @for %%? in ("Date" "Time") do @for /f "skip=2 tokens=1,3" %%a in ('reg query "HKCU\Control Panel\International" /v ?%%~? 2^>nul') do @for /f %%x in ('echo:%%_DT_%%a_%%') do @if "%%x"=="%%a" set "_DT_%%a_=%%b"
        @for /f "tokens=1-3 delims=%_DT_T_%" %%a in ("%time%") do @set "_DT_T_=%%a%%b%%c"
    )
    @if errorlevel 1 (
        @if "%_DT_iDate_%"=="0" (set "_DT_F_=_DT_D_ _DT_Y_ _DT_M_") else if "%_DT_iDate_%"=="1" (set "_DT_F_=_DT_D_ _DT_M_ _DT_Y_") else if "%_DT_iDate_%"=="2" (set "_DT_F_=_DT_Y_ _DT_M_ _DT_D_")
        @for /f "tokens=1-4* delims=%_DT_sDate_%" %%a in ('date/t') do @for /f "tokens=1-3" %%x in ('echo:%%_DT_F_%%') do @set "%%x=%%a" & set "%%y=%%b" & set "%%z=%%c"
        @for /f "tokens=1-3 delims=%_DT_T_%" %%a in ("%time%") do @set "_DT_H_=%%a" & set "_DT_I_=%%b" & set "_DT_S_=%%c"
        @for %%? in ("iDate" "sDate" "iTime" "sTime" "F" "T") do @set "_DT_%%~?_="
    )
    @for %%i in ("Y"                ) do @for /f %%j in ('echo:"%%_DT_%%~i_%%"') do @set /a _DT_%%~i_+=  0 & @for /f %%k in ('echo:"%%_DT_%%~i_:~-4%%"') do @set "_DT_%%~i_=%%~k"
    @for %%i in ("M" "D" "H" "I" "S") do @for /f %%j in ('echo:"%%_DT_%%~i_%%"') do @set /a _DT_%%~i_+=100 & @for /f %%k in ('echo:"%%_DT_%%~i_:~-2%%"') do @set "_DT_%%~i_=%%~k"
@exit/b
