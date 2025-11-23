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
rem procedure VENV_START (AVENV_DIR) -> None
rem -----------------------------------------------
:VENV_START
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_START
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVENV_DIR=%~1
    rem echo AVENV_DIR:!AVENV_DIR!

    set VENV_START=

    if not defined AVENV_DIR (
        echo ERROR: AVENV_DIR not defined ...
        exit /b 3
    )

    if not exist !AVENV_DIR!\ (
        echo ERROR: Dir !AVENV_DIR! not exist ...
        exit /b 1
    )

    if not exist !AVENV_DIR!\Scripts\activate.bat (
        echo ERROR: File !AVENV_DIR!\Scripts\activate.bat not exist ...
        exit /b 2
    )

    call !AVENV_DIR!\Scripts\activate.bat
 
    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_STOP (AVENV_DIR) -> None
rem -----------------------------------------------
:VENV_STOP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_STOP
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVENV_DIR=%~1
    rem echo AVENV_DIR:!AVENV_DIR!

    set VENV_STOP=

    if not defined AVENV_DIR (
        echo ERROR: AVENV_DIR not defined ...
        exit /b 3
    )

    if not exist !AVENV_DIR! (
        echo ERROR: Dir !AVENV_DIR! not exist ...
        exit /b 1
    )
    
    if not exist !AVENV_DIR!\Scripts\activate.bat (
        echo ERROR: File !AVENV_DIR!\Scripts\deactivate.bat ...
        exit /b 2
    )

    call !AVENV_DIR!\Scripts\deactivate.bat

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_UPDATE (AVENV_DIR) -> None
rem -----------------------------------------------
:VENV_UPDATE
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_UPDATE
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set AVENV_DIR=%~1
    rem echo AVENV_DIR:!AVENV_DIR!

    set VENV_UPDATE=

    if not defined AVENV_DIR (
        echo ERROR: AVENV_DIR not defined ...
        exit /b 3
    )

    if not exist !AVENV_DIR!\ (
        echo ERROR: Dir !AVENV_DIR! not exist ...
        exit /b 1
    )

    echo Install packeges requirements.txt ...

    rem pip freeze > !AVENV_DIR!\requirements.txt
    pip freeze > requirements.txt

    call :CHANGE_STR requirements.txt "==" ">=" || exit /b 1

    echo cd:!cd!

    if exist LOG\ (
        pip install -r requirements.txt > LOG\install.log
        )
    ) else (
        pip install -r requirements.txt
        rem pip install -r !AVENV_DIR!\requirements.txt
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_PROJECT_DIR (APROJECT_DIR) -> None
rem --------------------------------------------------------------------------------
:SET_PROJECT_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PROJECT_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECT_DIR=%~1
    rem echo APROJECT_DIR:!APROJECT_DIR!

    set SET_PROJECT_DIR=

    rem -------------------------------------------------------------------
    rem PROJECT_DIR
    rem -------------------------------------------------------------------
    if not defined APROJECT_DIR (
        echo ERROR: APROJECT_DIR not defined ...
        exit /b 3
    )

    if defined APROJECT_DIR (
        if not exist !APROJECT_DIR!\ (
            echo ERROR: Dir !APROJECT_DIR! not exist ...
            exit /b 1
        ) else (
            if not exist !APROJECTDIR!\PROJECT.ini (
                echo ERROR: Dir !APROJECT_DIR!\PROJECT.ini not exist ...
                exit /b 1
            ) else (
                cd /D !APROJECT_DIR!
            )
        )
    )

    exit /b 0

rem endfunction

rem --------------------------------------------------------------------------------
rem function VENV_DIR (Aproject_dir AVENV_DIR) -> !VENV_DIR!
rem --------------------------------------------------------------------------------
:SET_VENV_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_dir=%~1
    rem echo Aproject_dir:!Aproject_dir!

    set AVENV_DIR=%~2
    rem echo AVENV_DIR:!AVENV_DIR!

    if defined Aproject_dir (
        if not exist !Aproject_dir!\ (
            set VENV_DIR=
            echo ERROR: Dir !Aproject_dir! not exist ...
            exit /b 1
        )
    ) else (
        echo ERROR: Dir project_dir not defined ...
        exit /b 1
    )

    set SET_VENV_DIR=
    rem -------------------------------------------------------------------
    rem VENV_DIR 
    rem -------------------------------------------------------------------
    if defined AVENV_DIR (
        if !AVENV_DIR!==P313 (
            set VENV_DIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
        ) else (
            if !AVENV_DIR!==P314 (
                set VENV_DIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\
            ) else (
                if exist !AVENV_DIR!\ (
                    set VENV_DIR=!AVENV_DIR!
                ) else (
                    set VENV_DIR=
                )
            )
        )
    ) else (
        if exist !Aproject_dir!.venv (
            set VENV_DIR=!Aproject_dir!.venv
        ) else (
            set VENV_DIR=
        )
    )

    if defined VENV_DIR (
        rem echo VENV_DIR:!VENV_DIR!
        if not exist !VENV_DIR!\ (
            set VENV_DIR=
            echo ERROR: Dir !VENV_DIR! not exist ...
            exit /b 1
        )
    ) else (
        echo ERROR: Dir !VENV_DIR! not defined ...
        exit /b 1
    )

    set SET_VENV_DIR=!VENV_DIR!
    rem echo SET_VENV_DIR:!SET_VENV_DIR!

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
    rem echo Ox:!Ox!
    if defined Ox (
        if exist !Ox!\ (
            set project_dir=!Ox!\
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
    rem echo GET_project_dir:!GET_project_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_projects_dir (projects_dir) -> projects_dir
rem --------------------------------------------------------------------------------
:GET_projects_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_projects_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aprojects_dir=%~1

    rem -------------------------------------------------------------------
    rem projects_dir
    rem -------------------------------------------------------------------
    call :CurrentDir || exit /b 1
    if not defined Aprojects_dir (
        set Ox_Name=Ox
        set Ox_Caption=projects_dir
        set Ox_Default=!CurrentDir!
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        if exist !Ox!\ (
            set projects_dir=!Ox!\
        ) else (
            set projects_dir=
            echo ERROR: Dir !projects_dir! not exist ...
            exit /b 1
        )
    ) else (
        set projects_dir=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_projects_dir=!projects_dir!
    rem echo GET_projects_dir:!GET_projects_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_name (project_name) -> project_name
rem --------------------------------------------------------------------------------
:GET_project_name
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_name
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_name=%~1

    rem -------------------------------------------------------------------
    rem project_name
    rem -------------------------------------------------------------------
    if not defined Aproject_name (
        set Ox_Name=Ox
        set Ox_Caption=project_name
        set Ox_Default=
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        set project_name=!Ox!
    ) else (
        set project_name=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_project_name=!project_name!
    rem echo GET_project_name:!GET_project_name!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script_dir (script_dir) -> script_dir
rem --------------------------------------------------------------------------------
:GET_script_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_script_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Ascript_dir=%~1

    rem -------------------------------------------------------------------
    rem script_dir
    rem -------------------------------------------------------------------
    call :CurrentDir || exit /b 1
    if not defined Ascript_dir (
        set Ox_Name=Ox
        set Ox_Caption=script_dir
        set Ox_Default=!CurrentDir!
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        if exist !Ox!\ (
            set script_dir=!Ox!\
        ) else (
            set script_dir=
            echo ERROR: Dir !script_dir! not exist ...
            exit /b 1
        )
    ) else (
        set script_dir=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_script_dir=!script_dir!
    rem echo GET_script_dir:!GET_script_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script_name (script_name) -> script_name
rem --------------------------------------------------------------------------------
:GET_script_name
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_script_name
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Ascript_name=%~1

    rem -------------------------------------------------------------------
    rem script_name
    rem -------------------------------------------------------------------
    if not defined Ascript_name (
        set Ox_Name=Ox
        set Ox_Caption=script_name
        set Ox_Default=
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        set script_name=!Ox!
    ) else (
        set script_name=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_script_name=!script_name!
    rem echo GET_script_name:!GET_script_name!

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
    rem echo Ox:!Ox!
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
    rem echo GET_venv_dir:!GET_venv_dir!

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
    rem echo Ox:!Ox!
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
    rem echo GET_python_dir:!GET_python_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script (script) -> script
rem --------------------------------------------------------------------------------
:GET_script
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_script
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Ascript=%~1

    rem -------------------------------------------------------------------
    rem script
    rem -------------------------------------------------------------------
    call :CurrentDir || exit /b 1
    if not defined Ascript (
        set Ox_Name=Ox
        set Ox_Caption=script
        set Ox_Default=!Ascript!
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox !Ox! || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        call :ExtractFileDir !Ascript! || exit /b 1
        set scriptdir=!ExtractFileDir!
        call :ExtractFileName !Ascript! || exit /b 1
        set scriptname=!ExtractFileName!
        call :ExtractFileExt !Ascript! || exit /b 1
        set scriptext=!ExtractFileExt!
    ) else (
        set script=
        echo ERROR: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        exit /b 1
    )

    set GET_script=!script!
    rem echo GET_script:!GET_script!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_requirements_file (requirements_file) -> requirements_file
rem --------------------------------------------------------------------------------
:GET_requirements_file
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_requirements_file
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Arequirements_file=%~1

    rem -------------------------------------------------------------------
    rem requirements_file
    rem -------------------------------------------------------------------
    call :CurrentDir || exit /b 1
    if not defined Arequirements_file (
        set Ox_Name=Ox
        set Ox_Caption=requirements_file
        set Ox_Default=requirements.txt
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        if exist !Ox! (
            set requirements_file=-r !Ox!
        ) else (
            set requirements_file=
            echo INFO: File !Ox! not exist ...
        )
    ) else (
        set script_name=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_requirements_file=!requirements_file!
    rem echo GET_requirements_file:!GET_requirements_file!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package_names (package_names) -> package_names
rem --------------------------------------------------------------------------------
:GET_package_names
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_package_names
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Apackage_names=%*

    rem -------------------------------------------------------------------
    rem package_name
    rem -------------------------------------------------------------------
    if not defined Apackage_names (
        set Ox_Name=Ox
        set Ox_Caption=package_names[A B C] requests
        set Ox_Default=
        set Ox=!Ox_Default!
        set PN_CAPTION=!Ox_Caption!
        call :Read_P Ox || exit /b 1
    ) else (
        call :Read_P Ox || exit /b 1
    )
    rem echo Ox:!Ox!
    if defined Ox (
        set package_names=!Ox!
    ) else (
        set package_names=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
    )

    set GET_package_names=!package_names!
    rem echo GET_package_name:!GET_package_name!

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
