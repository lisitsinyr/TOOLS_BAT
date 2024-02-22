@echo off
rem -------------------------------------------------------------------
rem LYRFileUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRFileUtils
rem     :ExtractFileDir
rem     :ExtractFileName
rem     :ExtractFileNameWithoutExt
rem     :ExtractFileExt
rem -------------------------------------------------------------------
rem d -- drive
rem p -- path
rem n -- file name
rem x -- extension
rem f -- full path
rem -------------------------------------------------------------------
rem Use the special %0 variable to get the path to the current file.
rem в двойных кавычках
rem BATFilename1="D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\test.bat"
rem set BATFilename1=%0
rem echo BATFilename1=%BATFilename1%

rem Use the special %0 variable to get the path to the current file.
rem без кавычек
rem f -- full path
rem BATFilename2=D:\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\test.bat
rem set BATFilename2=%~f0
rem echo BATFilename2=%BATFilename2%

rem Use the special %0 variable to get the path to the current file.
rem p -- path
rem Pathname=\PROJECTS_LYR\CHECK_LIST\01_OS\03_UNIX\PROJECTS_UNIX\BAT\
rem set Pathname=%~p0
rem echo Pathname=%Pathname%

rem Use the special %0 variable to get the path to the current file.
rem d -- drive
rem Drive=D:
rem set Drive=%~d0
rem echo Drive=%Drive%

rem Use the special %0 variable to get the path to the current file.
rem n -- file name
rem FilenameWithoutExt=test
rem set FilenameWithoutExt=%~n0
rem echo FilenameWithoutExt=%FilenameWithoutExt%

rem Use the special %0 variable to get the path to the current file.
rem x -- extension
rem FileExt=.bat
rem set FileExt=%~x0
rem echo FileExt=%FileExt%

rem Write %~n0%~x0 to get the filename and extension.
rem %~n0%~x0
rem FilenameWithExt1=test.bat
rem set FilenameWithExt1=%~n0%~x0
rem echo FilenameWithExt1=%FilenameWithExt1%

rem Also possible to write %~nx0 to get the filename and extension.
rem %~nx0
rem FilenameWithExt2=test.bat
rem set FilenameWithExt2=%~nx0
rem echo FilenameWithExt2=%FilenameWithExt2%

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :LYRFileUtils [%1]
rem --------------------------------------------------------------------------------
:LYRFileUtilsLIB
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set LYRFileUtils=%~f1
    set LYRFileUtils=LYRFileUtils
    echo %LYRFileUtils%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :LYRFileUtils [%1]
rem --------------------------------------------------------------------------------
:ExtractFileDir
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set ExtractFileDir=%~d1%~p1
    echo %ExtractFileDir%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :ExtractFileName [%1]
rem --------------------------------------------------------------------------------
:ExtractFileName
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set ExtractFileName=%~nx1
    echo %ExtractFileName%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :ExtractFileNameWithoutExt [%1]
rem --------------------------------------------------------------------------------
:ExtractFileNameWithoutExt
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set ExtractFileNameWithoutExt=%~n1
    echo %ExtractFileNameWithoutExt%
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :ExtractFileExt [%1]
rem --------------------------------------------------------------------------------
:ExtractFileExt
rem beginfunction
    set FNAME=procedure %0
    if "%DEBUG%"=="1" (
        echo DEBUG: %FNAME% ...
    )
    set ExtractFileExt=%~x1
    echo %ExtractFileExt%
    exit /b 0
rem endfunction

rem ===================================================================

