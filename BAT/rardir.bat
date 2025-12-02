@echo off
rem -------------------------------------------------------------------
rem rardir.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem -------------------------------------------------------------------
rem SCRIPTS_DIR - Каталог скриптов
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR (
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
)

rem -------------------------------------------------------------------
rem LIB_BAT - каталог библиотеки скриптов
rem -------------------------------------------------------------------
set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB

rem -------------------------------------------------------------------
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
rem -------------------------------------------------------------------
if not defined SCRIPTS_DIR_KIX (
    set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX
)

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    call :SET_LIB %0 || exit /b 1

    rem -------------------------------------------------------------------
    rem rar - 
    rem -------------------------------------------------------------------
    set APP=rar
    set COMMAND=a
    set APPRUN=
    
    rem -------------------------------------
    rem OPTION
    rem -------------------------------------
    set OPTION= -r

    rem -------------------------------------------------------------------
    rem O1
    rem -------------------------------------------------------------------
    set VarName=O1
    rem echo VarName:!VarName!
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    set VarCaption=O1_caption
    rem echo VarCaption:!VarCaption!
    set VarDefault=O1_default
    rem echo VarDefault:!VarDefault!
    rem if not defined !%VarName%! (
    rem     call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    rem )
    rem if defined !VarName! (
    rem     set OPTION=!OPTION! -!VarName! "!%VarName%!"
    rem ) else (
    rem     echo INFO: !VarName! not defined ...
    rem )

    echo OPTION:!OPTION!

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    set ARGS=

    rem Проверка на обязательные аргументы
    rem set PN_CAPTION=Ввод значения directory
    rem set directory=
    rem call :Read_P directory %1 || exit /b 1
    rem echo directory: !directory!
    rem if defined directory (
    rem     set ARGS=!ARGS! "!directory!".rar "!directory!"
    rem ) else (
    rem     echo ERROR: directory not defined ...
    rem     echo Использование: !BATNAME! папка
    rem     set OK=
    rem )
    rem -------------------------------------------------------------------
    rem directory
    rem -------------------------------------------------------------------
    set VarName=directory
    rem echo VarName:!VarName!
    set VarValue=%1
    rem echo VarValue:!VarValue!
    set VarCaption=Ввод значения directory
    rem echo VarCaption:!VarCaption!
    set VarDefault=
    rem echo VarDefault:!VarDefault!
    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    if defined !VarName! (
        set ARGS=!ARGS! "!directory!".rar "!directory!"
    ) else (
        echo ERROR: directory not defined ...
        echo Использование: !BATNAME! папка
        echo INFO: !VarName! not defined ...
        set OK=
        exit /b 1
    )
    
    if not defined Read_N (
        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
        exit /b 0
    ) else (

        set APPRUN=!APP! !COMMAND!!OPTION!!ARGS!
    )
    echo APPRUN: !APPRUN!
    !APPRUN!

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRLIB.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0

rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0

rem =================================================
rem LYRFileUtils.bat
rem =================================================
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0

rem =================================================
rem LYRLog.bat
rem =================================================
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
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
:Left
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Mid
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimQuotes
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0

rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem =================================================
rem LYRParserINI.bat
rem =================================================
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0

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
