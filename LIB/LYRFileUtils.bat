@echo off
rem -------------------------------------------------------------------
rem LYRFileUtils.bat
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
rem procedure LYRFileUtils ()
rem --------------------------------------------------------------------------------
:LYRFileUtils
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRFileUtils
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
rem function ExtractFileDir (AFullFilename) -> ExtractFileDir
rem --------------------------------------------------------------------------------
:ExtractFileDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFullFilename=%1

    set ExtractFileDir=%~d1%~p1
    set !FUNCNAME!=%~d1%~p1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FullFileName (AFilename) -> FullFileName
rem --------------------------------------------------------------------------------
:FullFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FullFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set FullFileName=%~f1
    set !FUNCNAME!=%~f1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction
  
rem --------------------------------------------------------------------------------
rem function ExtractFileName (AFilename) -> ExtractFileName
rem --------------------------------------------------------------------------------
:ExtractFileName
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileName
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileName=%~nx1
    set !FUNCNAME!=%~nx1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileNameWithoutExt (AFileName) -> ExtractFileNameWithoutExt
rem --------------------------------------------------------------------------------
:ExtractFileNameWithoutExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileNameWithoutExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileNameWithoutExt=%~n1
    set !FUNCNAME!=%~n1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileExt (AFileName) -> ExtractFileExt
rem --------------------------------------------------------------------------------
:ExtractFileExt
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ExtractFileExt
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set ExtractFileExt=%~x1
    set !FUNCNAME!=%~x1
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FileAttr (AFileName) -> FileAttr
rem --------------------------------------------------------------------------------
:FileAttr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileAttr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    set FOLDER=
    if exist "!FILENAME!" (
        set FileAttr=%~a1
        set !FUNCNAME!=%~a1
        if defined FUNCNAME (
            if /i "!FUNCNAME:~0,1!"=="d" (
                set FOLDER=D
            ) else (
                set FOLDER=F
            )
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!
    rem echo FOLDER: !FOLDER!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FileSize (AFileName) -> FileSize
rem --------------------------------------------------------------------------------
:FileSize
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FileSize
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFilename=%1

    set FILENAME=%~1
    rem echo FILENAME: !FILENAME!

    set /a !FUNCNAME!=0
    if defined FILENAME (
        if exist "!FILENAME!" (
            set /a !FUNCNAME!=%~z1
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function CreateDir (ADIRECTORY) -> CreateDir
rem --------------------------------------------------------------------------------
:CreateDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIRECTORY=%~1
    rem echo ADIRECTORY: !ADIRECTORY!

    if defined ADIRECTORY (
        if not exist "!ADIRECTORY!\" (
            mkdir "!ADIRECTORY!"
            if not !ERRORLEVEL! EQU 0 (
                echo ERROR: Directory !ADIRECTORY! not created...
                exit /b 1
            )
        )
        set CreateDir=!ADIRECTORY!
        set !FUNCNAME!=!ADIRECTORY!
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function CreateFile (AFILENAME) -> CreateFile
rem --------------------------------------------------------------------------------
:CreateFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CreateFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFILENAME=%~1
    rem echo AFILENAME: !AFILENAME!

    if defined AFILENAME (
        if not exist "!AFILENAME!" (
            rem set touchRUN=touch -f "!AFILENAME!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!AFILENAME!"
            rem echo !touchRUN!
            rem %touchRUN%
            D:\TOOLS\EXE\touch.exe "!AFILENAME!"
        )
        set CreateFile="!AFILENAME!"
        set !FUNCNAME!="!AFILENAME!"
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function CheckFile (FILENAME) -> CheckFile
rem --------------------------------------------------------------------------------
:CheckFile
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CheckFile
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
    rem echo !FUNCNAME!: !%FUNCNAME%!

    set AFILENAME=%~1
    rem echo AFILENAME: !AFILENAME!

    if defined AFILENAME (
        if exist "!AFILENAME!" (
            set CheckFile="!AFILENAME!"
            set !FUNCNAME!="!AFILENAME!"
        )
    )
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function CurrentDir () -> CurrentDir
rem --------------------------------------------------------------------------------
:CurrentDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CurrentDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem set CurrentDir="!cd!"
    rem echo CurrentDir: !CurrentDir!

    set !FUNCNAME!="!cd!"
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
rem --------------------------------------------------------------------------------
:COPY_FILES
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=COPY_FILES
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIR_FROM=%~1
    rem echo ADIR_FROM:!ADIR_FROM!
    set ADIR_TO=%~2
    rem echo ADIR_TO:!ADIR_TO!
    set AMASK=%~3
    rem echo AMASK:!AMASK!
    set AARG=%~4
    rem echo AARG:!AARG!

    call :CurrentDir || exit /b 1

    if defined AARG if "!AARG!"=="/R" (
        set AARG=/R !ADIR_FROM!
    ) else (
        set AARG=
    )
    rem echo AARG:!AARG!

    echo --------------------------->> %LOG_FULLFILENAME%
    echo COPY_FILES:                >> %LOG_FULLFILENAME%
    echo     !ADIR_FROM!            >> %LOG_FULLFILENAME%
    echo     !ADIR_TO!              >> %LOG_FULLFILENAME%
    echo     !AMASK!                >> %LOG_FULLFILENAME%
    echo --------------------------->> %LOG_FULLFILENAME%

    if exist "!ADIR_TO!" (
        rem del /F /S /Q "!ADIR_TO!"\*.*   >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
    )

    cd /D "!ADIR_FROM!"
    
    for %AARG% %%f in (!AMASK!) do (
        rem echo %%~nf%%~xf
        copy "%%f" !ADIR_TO!\        >  NUL
        
        echo !FUNCNAME! !errorlevel!
        
        call :PressAnyKey

        call :CheckErrorlevel !FUNCNAME! !errorlevel! 1
        echo File %%f copied ...     >> %LOG_FULLFILENAME%
    )

    cd /D "!CurrentDir!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
rem --------------------------------------------------------------------------------
:XCOPY_FILES
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=XCOPY_FILES
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIR_FROM=%~1
    rem echo ADIR_FROM:!ADIR_FROM!
    set ADIR_TO=%~2
    rem echo ADIR_TO:!ADIR_TO!
    set AMASK=%~3
    rem echo AMASK:!AMASK!
    set AARG=%~4
    rem echo AARG:!AARG!
    if not defined AARG (
        set AARG=/O
        set AARG=/D /S /E /V /F /H /R /K /Y /O
    )
    echo ---------------------------   >> %LOG_FULLFILENAME%
    echo XCOPY_FILES:                  >> %LOG_FULLFILENAME%
    echo     !ADIR_FROM!               >> %LOG_FULLFILENAME%
    echo     !ADIR_TO!                 >> %LOG_FULLFILENAME%
    echo     !AMASK!                   >> %LOG_FULLFILENAME%
    echo ---------------------------   >> %LOG_FULLFILENAME%
    if exist "!ADIR_TO!"\ (
        rem echo ---------------------------
        del /F /S /Q "!ADIR_TO!"\*.*   >> %LOG_FULLFILENAME%
    ) else (
        rem echo ===========================
        mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
    )
    xcopy !ADIR_FROM! !ADIR_TO! !AARG! >> %LOG_FULLFILENAME%
    call :CheckErrorlevel !FUNCNAME! !errorlevel! 1
    rem set GERRORLEVEL=!errorlevel!
    rem echo GERRORLEVEL:!GERRORLEVEL!

    exit /b 0
rem endfunction

rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================

