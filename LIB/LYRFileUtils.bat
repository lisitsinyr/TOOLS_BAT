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
rem procedure LYRFileUtils ()
rem --------------------------------------------------------------------------------
:LYRFileUtils
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ExtractFileDir (FullFilename)
rem --------------------------------------------------------------------------------
:ExtractFileDir
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set ExtractFileDir=%~d1%~p1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FullFileName (Filename)
rem --------------------------------------------------------------------------------
:FullFileName
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set FullFileName=%~f1

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

    rem echo _1: %1

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

rem --------------------------------------------------------------------------------
rem procedure ExtractFileExt (FileName)
rem --------------------------------------------------------------------------------
:ExtractFileExt
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set ExtractFileExt=%~x1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FileAttr (FileName)
rem --------------------------------------------------------------------------------
:FileAttr
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    rem echo _1: %1

    set FileAttr=%~a1
    rem echo FileAttr: %FileAttr%

    if "%FileAttr%"=="" (
        set FOLDER=
    ) else (
        if /i "%FileAttr:~0,1%"=="d" (
           set FOLDER=D
        ) else (
           set FOLDER=F
        )
    )
    rem echo FOLDER: %FOLDER%

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CurrentDir ()
rem --------------------------------------------------------------------------------
:CurrentDir
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )

    set CurrentDir=%cd%

    exit /b 0
rem endfunction

rem ===================================================================

