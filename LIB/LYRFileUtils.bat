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
rem procedure LYRFileUtilsINIT () -> None
rem --------------------------------------------------------------------------------
:LYRFileUtilsINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRFileUtilsINIT
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
    rem echo AFullFilename:!AFullFilename!

    if exist AFullFilename (
        set ExtractFileDir=%~d1%~p1
    ) else (
        set ExtractFileDir=
    )

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

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FileAttr (AFileName) -> FOLDER
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

    set FileAttr=!FOLDER!

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

    set /a FileSize=0

    if defined FILENAME (
        if exist "!FILENAME!" (
            set /a FileSize=%~z1
        )
    )

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

    set CreateDir=

    if defined ADIRECTORY (
        if not exist "!ADIRECTORY!\" (
            mkdir "!ADIRECTORY!"
            if not !ERRORLEVEL! EQU 0 (
                echo ERROR: Directory !ADIRECTORY! not created...
                call :CheckErrorlevel CreateDir !errorlevel! 1
                exit /b 1
            )
        )
        set CreateDir=!ADIRECTORY!
    )

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function ClearDir (ADIRECTORY, AMASK) -> None
rem --------------------------------------------------------------------------------
:ClearDir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ClearDir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ADIRECTORY=%~1
    rem echo ADIRECTORY: !ADIRECTORY!
    set AMASK=%~2
    rem echo AMASK:!AMASK!

    if defined ADIRECTORY (
        if exist "!ADIRECTORY!\" (
            del /F /S /Q "!ADIRECTORY!"\!AMASK!   > NUL
        )
    )

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

    set CreateFile=
    if defined AFILENAME (
        if not exist "!AFILENAME!" (
            rem set touchRUN=touch -f "!AFILENAME!"
            rem set touchRUN=D:\TOOLS\EXE\touch.exe "!AFILENAME!"
            rem echo !touchRUN!
            rem %touchRUN%
            D:\TOOLS\EXE\touch.exe "!AFILENAME!"
        )
        set CreateFile="!AFILENAME!"
    )

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

    set CheckFile=

    if defined AFILENAME (
        if exist "!AFILENAME!" (
            set CheckFile="!AFILENAME!"
        )
    )

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

    set CurrentDir=!cd!
    rem echo CurrentDir: !CurrentDir!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_FILE (FileName, DIR_TO, /Y) -> None
rem --------------------------------------------------------------------------------
:COPY_FILE
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=COPY_FILE
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    rem echo AFileName:!AFileName!
    set LFileName=%~n1%~x1
    rem echo LFileName:!LFileName!
    set ADIR_TO=%~2
    rem echo ADIR_TO:!ADIR_TO!
    set AARG=%~3
    rem echo AARG:!AARG!

    if defined AARG if "!AARG!"=="/Y" (
        set LOverwrite=1
    ) else (
        set LOverwrite=
    )
    rem echo LOverwrite:!LOverwrite!

    if exist "!AFileName!" (
        if not exist "!ADIR_TO!" (
            mkdir "!ADIR_TO!"                   >> %LOG_FULLFILENAME%
        )
        echo COPY_FILE: !AFileName! !ADIR_TO!   >> %LOG_FULLFILENAME%
        if not exist !ADIR_TO!\!LFileName! (
            rem echo AFileName:!AFileName!
            copy !AFileName! !ADIR_TO! > NUL
            rem call :CheckErrorlevel COPY_FILES !errorlevel! 1
            rem echo File !AFileName! copied ...    >> %LOG_FULLFILENAME%
        ) else (
            if defined LOverwrite (
                rem echo Overide: LFileName:!LFileName!
                copy !AFileName! !ADIR_TO! > NUL
            )
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_FILES (DIR_FROM, DIR_TO, MASK, /R /Y) -> None
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
    set AARG1=%~4
    rem echo AARG1:!AARG1!
    set AARG2=%~5
    rem echo AARG2:!AARG2!

    set LR=
    set res=
    if "!AARG1!"=="/R" set res=true
    if "!AARG2!"=="/R" set res=true
    if defined res ( 
        set LR=/R !ADIR_FROM!
    )
    rem echo LR:!LR!

    set LOverwrite=
    set res=
    if "!AARG1!"=="/Y" set res=true
    if "!AARG2!"=="/Y" set res=true
    if defined res ( 
        set LOverwrite=1
    )
    rem echo LOverwrite:!LOverwrite!

    if exist "!ADIR_FROM!" (
        call :CurrentDir || exit /b 1

        echo COPY_FILES:                >> %LOG_FULLFILENAME%
        echo     !ADIR_FROM!            >> %LOG_FULLFILENAME%
        echo     !ADIR_TO!              >> %LOG_FULLFILENAME%
        echo     !AMASK!                >> %LOG_FULLFILENAME%

        if not exist "!ADIR_TO!" (
            mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
        )

        cd /D "!ADIR_FROM!"
    
        rem for %AARG1% %%f in (!AMASK!) do (
        for %LR% %%f in (!AMASK!) do (
            rem echo %%f
            rem echo %%~nf%%~xf
            set LFileName=%%~nf%%~xf
            rem echo LFileName:!LFileName!

            if not exist !ADIR_TO!\!LFileName! (
                copy "%%f" !ADIR_TO!        > NUL
                echo File %%f copied ...    >> %LOG_FULLFILENAME%
            ) else (
                if defined LOverwrite (
                    rem echo Overide: LFileName:!LFileName!
                    copy "%%f" !ADIR_TO!    > NUL
                )
            )

        )

        cd /D "!CurrentDir!"
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG) -> None
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
    if not exist "!ADIR_TO!"\ (
        mkdir "!ADIR_TO!"              >> %LOG_FULLFILENAME%
    )

    xcopy !ADIR_FROM! !ADIR_TO! !AARG! >> %LOG_FULLFILENAME%
    call :CheckErrorlevel XCOPY_FILES !errorlevel! 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CHANGE_STR (FileName, str_find, str_replace) -> None
rem --------------------------------------------------------------------------------
:CHANGE_STR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=CHANGE_STR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFileName=%~1
    echo AFileName:!AFileName!
    rem set LFileName=%~n1%~x1
    rem echo LFileName:!LFileName!
    set Astr_find=%2
    echo Astr_find:!Astr_find!
    set Astr_replace=%3
    echo Astr_replace:!Astr_replace!

    set FileNameOUT=test.txt

    if exist "!AFileName!" (

        D:\TOOLS\EXE\nhrt.exe -spt:!Astr_find! -t:!Astr_replace! "!AFileName!"
        
        rem del !FileNameOUT! > nul
        rem FOR /F "tokens=* delims=" %%i IN ("!AFileName!") DO (
        rem     SET VAR=%%i
        rem     ECHO! VAR:%Astr_find%=%Astr_replace%! >> !FileNameOUT!
        rem )
        
        rem touch FileNameOUT
        rem FOR /f "delims=" %%a IN (!AFileName!) DO (
        rem     SET line=%%a
        rem     echo line:!line! >> !FileNameOUT!
            rem SET "line=!line:‘!Astr_find!!"
            rem SET "line=!line:’!Astr_replace!!"
            rem ECHO (!line!
        rem )

    )

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
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================
