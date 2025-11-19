@echo off
rem -------------------------------------------------------------------
rem LYRPY.bat
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
rem procedure LYRPY () -> None
rem --------------------------------------------------------------------------------
:LYRPY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRPY
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

    set LYRPY=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_START (APY_ENVDIR) -> None
rem -----------------------------------------------
:PY_ENV_START
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PY_ENV_START
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set APY_ENVDIR=%~1
    rem echo APY_ENVDIR:!APY_ENVDIR!

    if not exist !APY_ENVDIR!\ (
        echo ERROR: Dir !APY_ENVDIR! not exist ...
        exit /b 1
    )
    
    if not exist !APY_ENVDIR!\Scripts\activate.bat (
        echo ERROR: File !APY_ENVDIR!\Scripts\activate.bat not exist ...
        exit /b 2
    )

    call !APY_ENVDIR!\Scripts\activate.bat
 
    set PY_ENV_START=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_STOP (APY_ENVDIR) -> None
rem -----------------------------------------------
:PY_ENV_STOP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PY_ENV_STOP
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set APY_ENVDIR=%~1
    rem echo APY_ENVDIR:!APY_ENVDIR!

    if not exist !APY_ENVDIR! (
        echo ERROR: Dir !APY_ENVDIR! not exist ...
        exit /b 1
    )
    
    if not exist !APY_ENVDIR!\Scripts\activate.bat (
        echo ERROR: File !APY_ENVDIR!\Scripts\deactivate.bat ...
        exit /b 2
    )

    call !APY_ENVDIR!\Scripts\deactivate.bat

    set PY_ENV_STOP=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure PY_ENV_UPDATE (APY_ENVDIR) -> None
rem -----------------------------------------------
:PY_ENV_UPDATE
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PY_ENV_UPDATE
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set APY_ENVDIR=%~1
    rem echo APY_ENVDIR:!APY_ENVDIR!

    if not exist !APY_ENVDIR!\ (
        echo ERROR: Dir !APY_ENVDIR! not exist ...
        exit /b 1
    )

    echo Install packeges requirements.txt ...

    pip freeze > !APY_ENVDIR!\requirements.txt
    pip freeze > requirements.txt

    call :CHANGE_STR requirements.txt "==" ">=" || exit /b 1

    pause 

    rem pip install -r !APY_ENVDIR!\requirements.txt

    echo cd:!cd!

    if exist LOG\ (
        pip install -r requirements.txt > LOG\install.log
        )
    ) else (
        pip install -r requirements.txt
    )

    set PY_ENV_UPDATE=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function PROJECT_DIR (APROJECTDIR) -> None
rem --------------------------------------------------------------------------------
:PROJECT_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PROJECT_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECTDIR=%~1
    rem echo APROJECTDIR:!APROJECTDIR!

    rem -------------------------------------------------------------------
    rem project_dir - 
    rem -------------------------------------------------------------------
    if defined APROJECTDIR (
        if not exist !APROJECTDIR!\ (
            echo ERROR: Dir !APROJECTDIR! not exist ...
            exit /b 1
        ) else (
            if not exist !APROJECTDIR!\PROJECT.ini (
                echo ERROR: Dir !APROJECTDIR!\PROJECT.ini not exist ...
                exit /b 1
            ) else (
                cd /D !APROJECTDIR!
            )
        )
    )

    set PROJECT_DIR=

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function VENV_DIR (AVENVDIR) -> !PY_ENVDIR!
rem --------------------------------------------------------------------------------
:VENV_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AVENVDIR=%~1
    rem echo AVENVDIR:!AVENVDIR!

    rem -------------------------------------------------------------------
    rem ENV - 
    rem -------------------------------------------------------------------
    if !AVENVDIR!==P313 (
        set PY_ENVDIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313
    ) else (
        if !AVENVDIR!==P314 (
            set PY_ENVDIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314
        ) else (
            if !AVENVDIR!==.venv (
                set PY_ENVDIR=!project_dir!\.venv
            ) else (
               set PY_ENVDIR=!AVENVDIR!
            )
        )
    )
    rem echo PY_ENVDIR:!PY_ENVDIR!
    if not exist !PY_ENVDIR!\ (
        echo INFO: Dir !PY_ENVDIR! not exist ...
        exit /b 1
    )

    set VENV_DIR=!PY_ENVDIR!

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_dir (project_dir) -> project_dir
rem --------------------------------------------------------------------------------
:GET_project_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_dir=%~1

    rem -------------------------------------------------------------------
    rem project_dir
    rem -------------------------------------------------------------------
    call :CurrentDir || exit /b 1
    if not defined Aproject_dir (
        set Ox_Name=Ox
        set Ox_Caption=project_dir
        set Ox_Default=!CurrentDir!
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    echo Ox:!Ox!
    if defined Ox (
        if exist !Ox!\ (
            set project_dir=!Ox!\
            rem set scriptdir=!project_dir!
            rem cd /D !project_dir!
        ) else (
            set project_dir=
            echo ERROR: Dir !project_dir! not exist ...
            exit /b 1
        )
    ) else (
        set project_dir=
        echo ERROR: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        exit /b 1
    )

    set GET_project_dir=!project_dir!
    echo GET_project_dir:!GET_project_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_venv_dir (project_dir venv_dir) -> venv_dir
rem --------------------------------------------------------------------------------
:GET_venv_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_venv_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_dir=%~1
    set Avenv_dir=%~2

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    cd /D !project_dir!
    if not defined Avenv_dir (
        if exist .venv\ (
            set venv_dir=!Aproject_dir!.venv
        ) else (
            set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313
        )
        set Ox_Name=Ox
        set Ox_Caption=VENV
        set Ox_Default=!venv_dir!
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )

    echo Ox:!Ox!

    if defined Ox (
        if exist !Ox!\ (
            set venv_dir=!Ox!\
        ) else (
            if !0x!==P313 (
                set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
            ) else (
                if !02!==P314 (
                    set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\
                ) else (
                    set venv_dir=
                )
            )
        )
        if defined venv_dir (
            rem echo venv_dir:!venv_dir!
            if not exist !venv_dir! (
                set venv_dir=
                echo ERROR: Dir !venv_dir! not exist ...
                exit /b 1
            )
        ) else (
            echo ERROR: Dir !venv_dir! not defined ...
            exit /b 1
        )
    ) else (
        set venv_dir=
        echo ERROR: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        exit /b 1
    )

    set GET_venv_dir=!venv_dir!
    echo GET_venv_dir:!GET_venv_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_python_dir (python_dir) -> python_dir
rem --------------------------------------------------------------------------------
:GET_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Apython_dir=%~1

    rem -------------------------------------------------------------------
    rem python_dir
    rem -------------------------------------------------------------------
    if not defined python_dir (
        set Ox_Name=Ox
        set Ox_Caption=python_dir
        set Ox_Default=3.13
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    echo Ox:!Ox!
    if defined Ox (
        if exist !Ox!\ (
            set python_dir=!Ox!\
        ) else (
            if !Ox!==3.13 (
                set python_dir=C:\Users\lyr\AppData\Local\Programs\Python\Python313\
            ) else (
                if !Ox!==3.14 (
                    set python_dir=C:\Users\lyr\AppData\Local\Programs\Python\Python314\
                ) else (
                    set python_dir=
                )
            )
        )

        if defined python_dir (
            rem echo python_dir:!python_dir!
            if not exist !python_dir! (
                set python_dir=
                echo ERROR: Dir !python_dir! not exist ...
                exit /b 1
            )
        ) else (
            echo ERROR: Dir !python_dir! not defined ...
            exit /b 1
        )

    ) else (
        echo ERROR: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        exit /b 1
    )

    set GET_python_dir=!python_dir!
    echo GET_python_dir:!GET_python_dir!

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
:CHANGE_STR
%LIB_BAT%\LYRFileUtils.bat %*
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
