@echo off
rem -------------------------------------------------------------------
rem rard.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    call :Check_P1 %1 || exit /b 1
    call :Check_P2 %2 || exit /b 1
    call :ExtractFileName %P1% || exit /b 1
    rem echo ExtractFileName: %ExtractFileName%
    call :ExtractFileNameWithoutExt %P1% || exit /b 1
    rem echo ExtractFileNameWithoutExt: %ExtractFileNameWithoutExt%

    rem P1 - каталог
    if exist %P1%\ (
        set RARName=%ExtractFileName%.rar
    ) else (
        rem P1 - файл
        if exist %P1% (
            set RARName=%ExtractFileNameWithoutExt%.rar
        ) else (
            rem P1 - архив
            set RARName=%P1%.rar
        )
    )
    rem echo RARName: %RARName%

    rem P1 - каталог
    if exist %P1%\ (
        set RARCMD=rar a -r %RARName% %ExtractFileName%\*.* 
    ) else (
        rem P1 - файл
        if exist %P1% (
            set RARCMD=rar a "%RARName%" "%P1%"
        ) else (
            rem P1 - архив
            set RARCMD=rar a -r "%RARName%" "%P2%"
        )
    )
    echo RARCMD: %RARCMD%

    %RARCMD%
    
:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem Check_P1 [P1_Value]
rem --------------------------------------------------------------------------------
:Check_P1
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    if "%1"=="" (
        set P1=
    ) else (
        set P1=%1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem Check_P2 [P2_Value]
rem --------------------------------------------------------------------------------
:Check_P2
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    if "%1"=="" (
        set P2=
    ) else (
        set P2=%1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileName (Filename)
rem --------------------------------------------------------------------------------
:ExtractFileName
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem echo _: %~nx1

    set ExtractFileName=%~nx1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileNameWithoutExt (FileName)
rem --------------------------------------------------------------------------------
:ExtractFileNameWithoutExt
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set ExtractFileNameWithoutExt=%~n1

    exit /b 0
rem endfunction
