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
rem procedure LYRPYINIT () -> None
rem --------------------------------------------------------------------------------
:LYRPYINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRPYINIT
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
rem function SET_project_dir (Aproject_dir) -> project_dir
rem --------------------------------------------------------------------------------
:SET_project_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=project_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem -------------------------------------------------------------------
    rem project_dir
    rem -------------------------------------------------------------------
    set Aproject_dir=%~1
    rem echo Aproject_dir:!Aproject_dir!

    if defined Aproject_dir (
        if not exist !Aproject_dir!\ (
            echo ERROR: Dir !Aproject_dir! not exist ...
            set SET_project_dir=
            exit /b 1
        ) else (
            if not exist !Aproject_dir!\PROJECT.ini (
                echo ERROR: Dir !Aproject_dir!\PROJECT.ini not exist ...
                set SET_project_dir=
                exit /b 1
            ) else (
                set project_dir=!Aproject_dir!
                cd /D !project_dir!
            )
        )
    ) else (
        echo ERROR: Aproject_dir not defined ...
        set SET_project_dir=
        exit /b 3
    )

    cd /D "!LSaveDirectory!"

    set SET_project_dir=project_dir

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_dir (Aproject_dir) -> project_dir
rem --------------------------------------------------------------------------------
:GET_project_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_dir
    rem -------------------------------------------------------------------
    set VarName=project_dir
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=project_dir_caption
    rem echo VarCaption:!VarCaption!

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!
    rem echo VarDefault:!VarDefault!

    rem if not defined VarValue (
    rem     call :CurrentDir || exit /b 1
    rem     set VarValue=!CurrentDir!
    rem )

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    if defined !VarName! (
        call :SET_project_dir !project_dir! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_project_dir=!project_dir!
    rem echo GET_project_dir:!GET_project_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_projects_dir (Aprojects_dir) -> projects_dir
rem --------------------------------------------------------------------------------
:SET_projects_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_projects_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem -------------------------------------------------------------------
    rem projects_dir
    rem -------------------------------------------------------------------
    set Aprojects_dir=%~1
    rem echo Aprojects_dir:!Aprojects_dir!

    if defined Aprojects_dir (
        if not exist !Aprojects_dir! (
            echo ERROR: Dir !Aprojects_dir! not exist ...
            set SET_projects_dir=
            exit /b 1
        ) else (
            set projects_dir=!Aprojects_dir!
            cd /D !projects_dir!
        )
    ) else (
        echo ERROR: Aprojects_dir not defined ...
        set SET_projects_dir=
        exit /b 3
    )

    cd /D "!LSaveDirectory!"

    set SET_projects_dir=!projects_dir!

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

    rem -------------------------------------------------------------------
    rem projects_dir
    rem -------------------------------------------------------------------
    set VarName=projects_dir
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=projects_dir_caption
    rem echo VarCaption:!VarCaption!

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!
    rem echo VarDefault:!VarDefault!

    rem if not defined VarValue (
    rem     call :CurrentDir || exit /b 1
    rem     set VarValue=!CurrentDir!
    rem )

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_projects_dir !projects_dir! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_projects_dir=!projects_dir!
    rem echo GET_projects_dir:!GET_projects_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_project_name (Aproject_name) -> project_name
rem --------------------------------------------------------------------------------
:SET_project_name
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_project_name
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_name
    rem -------------------------------------------------------------------
    set Aproject_name=%~1
    rem echo Aproject_name:!Aproject_name!

    if defined Aproject_name (
        set project_name=!Aproject_name!
    ) else (
        echo ERROR: project_name not defined ...
        exit /b 3
    )

    set SET_project_name=!project_name!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_name (Aproject_name) -> project_name
rem --------------------------------------------------------------------------------
:GET_project_name
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_project_name
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_name
    rem -------------------------------------------------------------------
    set VarName=project_name
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=project_name_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=project_name
    rem echo VarDefault:!VarDefault!

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_project_name !project_name! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_project_name=!project_name!
    rem echo GET_project_name:!GET_project_name!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script_dir (Ascript_dir) -> script_dir
rem --------------------------------------------------------------------------------
:SET_script_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_script_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem -------------------------------------------------------------------
    rem script_dir
    rem -------------------------------------------------------------------
    set Ascript_dir=%~1
    rem echo Ascript_dir:!Ascript_dir!

    if defined Ascript_dir (
        if not exist !Ascript_dir! (
            echo ERROR: Dir !Ascript_dir! not exist ...
            set SET_script_dir=
            exit /b 1
        ) else (
            set script_dir=!Ascript_dir!
            cd /D !script_dir!
        )
    ) else (
        echo ERROR: Ascript_dir not defined ...
        set SET_script_dir=
        exit /b 3
    )

    cd /D "!LSaveDirectory!"

    set SET_script_dir=!script_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script_dir (Ascript_dir) -> script_dir
rem --------------------------------------------------------------------------------
:GET_script_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_script_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem script_dir
    rem -------------------------------------------------------------------
    set VarName=script_dir
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=script_dir_caption
    rem echo VarCaption:!VarCaption!

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!
    rem echo VarDefault:!VarDefault!

    rem if not defined VarValue (
    rem     call :CurrentDir || exit /b 1
    rem     set VarValue=!CurrentDir!
    rem )

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    if defined !VarName! (
        call :SET_script_dir !script_dir! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_script_dir=!script_dir!
    rem echo GET_script_dir:!GET_script_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script (Ascript) -> script
rem --------------------------------------------------------------------------------
:SET_script
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_script
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem script
    rem -------------------------------------------------------------------
    set Ascript=%~1
    rem echo Ascript:!Ascript!

    if defined Ascript (
        set script=!Ascript!
        call :ExtractFileDir !script! || exit /b 1
        set script_dir=!ExtractFileDir!

        call :ExtractFileName !script! || exit /b 1
        set script_name=!ExtractFileName!

        call :ExtractFileExt !script! || exit /b 1
        set script_ext=!ExtractFileExt!
    ) else (
        echo ERROR: Ascript not defined ...
        exit /b 3
    )

    set SET_script=!script!

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

    rem -------------------------------------------------------------------
    rem script
    rem -------------------------------------------------------------------
    set VarName=script
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=script_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=script.py
    rem echo VarDefault:!VarDefault!

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_script !script! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_script=!script!
    rem echo GET_script:!GET_script!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_venv_dir (Aproject_dir Avenv_dir) -> venv_dir
rem --------------------------------------------------------------------------------
:SET_venv_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_venv_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Aproject_dir=%~1
    rem echo Aproject_dir:!Aproject_dir!

    set Avenv_dir=%~2
    rem echo Avenv_dir:!Avenv_dir!

    if defined Aproject_dir (

        if not exist !Aproject_dir! (
            set venv_dir=
            echo ERROR: Dir !Aproject_dir! not exist ...
            set SET_venv_dir=
            exit /b 1
        )

    ) else (
        set venv_dir=
        echo ERROR: Dir project_dir not defined ...
        set SET_venv_dir=
        exit /b 1
    )

    set SET_venv_dir=

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    if defined Avenv_dir (
        if !Avenv_dir!==P313 (
            set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
        ) else (
            if !Avenv_dir!==P314 (
                set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\
            ) else (
                if exist !Avenv_dir! (
                    set venv_dir=!Avenv_dir!
                ) else (
                    set venv_dir=
                )
            )
        )
    ) else (
        if exist !Aproject_dir!.venv\ (
            set venv_dir=!Aproject_dir!.venv\
        ) else (
            set venv_dir=
        )
    )

    if defined venv_dir (
        rem echo venv_dir:!venv_dir!
        if not exist !venv_dir! (
            set venv_dir=
            echo ERROR: Dir !venv_dir! not exist ...
            set SET_venv_dir=
            exit /b 1
        )
    ) else (
        echo ERROR: Dir !venv_dir! not defined ...
        set SET_venv_dir=
        exit /b 1
    )

    set SET_venv_dir=!venv_dir!
    rem echo SET_venv_dir:!SET_venv_dir!

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

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set Aproject_dir=%~1
    rem echo Aproject_dir:!Aproject_dir!
    set Avenv_dir=%~2
    rem echo Avenv_dir:!Avenv_dir!
    if defined Aproject_dir (
        if not exist !Aproject_dir! (
            set venv_dir=
            echo ERROR: Dir !Aproject_dir! not exist ...
            set GET_venv_dir=
            exit /b 1
        )
    ) else (
        set venv_dir=
        echo ERROR: Dir project_dir not defined ...
        set GET_venv_dir=
        exit /b 1
    )

    if not defined Avenv_dir (
        if exist !project_dir!.venv\ (
            set venv_dir=!Aproject_dir!.venv\
        ) else (
            set venv_dir=
        )
    )

    set VarName=venv_dir
    rem echo VarName:!VarName!
    
    set VarValue=!venv_dir!
    rem echo VarValue:!VarValue!
    
    set VarCaption=venv_dir_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
    rem echo VarDefault:!VarDefault!

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_venv_dir !project_dir! !venv_dir! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_venv_dir=!venv_dir!
    rem echo GET_venv_dir:!GET_venv_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_python_dir (Apython_dir) -> python_dir
rem --------------------------------------------------------------------------------
:SET_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Apython_dir=%~1
    rem echo Apython_dir:!Apython_dir!

    rem -------------------------------------------------------------------
    rem python_dir
    rem -------------------------------------------------------------------
    if defined Apython_dir (

        if !Apython_dir!==3.13 (
            set python_dir=C:\Users\lyr\AppData\Local\Programs\Python\Python313\
        ) else (
            if !Apython_dir!==3.14 (
                set python_dir=C:\Users\lyr\AppData\Local\Programs\Python\Python314\
            ) else (
                if not exist !python_dir! (
                    set python_dir=
                )
            )
        )
        
        if defined python_dir (
            rem echo python_dir:!python_dir!
            if not exist !python_dir! (
                echo ERROR: Dir !python_dir! not exist ...
                set python_dir=
                exit /b 1
            )
        ) else (
            echo ERROR: Dir python_dir not defined ...
            exit /b 1
        )

    ) else (
        echo ERROR: Apython_dir not defined ...
        exit /b 3
    )

    set SET_python_dir=!python_dir!

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

    set VarName=python_dir
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=python_dir_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=3.13
    rem echo VarDefault:!VarDefault!

    rem -------------------------------------------------------------------
    rem python_dir
    rem -------------------------------------------------------------------
    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_python_dir !python_dir! || exit /b 1
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_python_dir=!python_dir!
    rem echo GET_python_dir:!GET_python_dir!

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

    rem -------------------------------------------------------------------
    rem requirements_file
    rem -------------------------------------------------------------------
    set VarName=requirements_file
    rem echo VarName:!VarName!
    
    set VarValue=%~1
    rem echo VarValue:!VarValue!
    
    set VarCaption=requirements_file_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=
    rem echo VarDefault:!VarDefault!

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        if exist !requirements_file! (
            set requirements_file=-r !requirements_file!
        ) else (
            set requirements_file=
            echo INFO: File !requirements_file! not exist ...
        )
    ) else (
        echo INFO: !VarName! not defined ...
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

    rem -------------------------------------------------------------------
    rem package_names
    rem -------------------------------------------------------------------
    set VarName=package_names
    rem echo VarName:!VarName!
    
    set VarValue=%*
    rem echo VarValue:!VarValue!
    
    set VarCaption=package_names_caption
    rem echo VarCaption:!VarCaption!

    set VarDefault=
    rem echo VarDefault:!VarDefault!

    if not defined VarValue (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        set package_names=!package_names!
    ) else (
        echo INFO: !VarName! not defined ...
    )

    set GET_package_names=!package_names!
    rem echo GET_package_name:!GET_package_name!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_START (Avenv_dir) -> None
rem -----------------------------------------------
:VENV_START
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_START
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Avenv_dir=%~1
    rem echo Avenv_dir:!Avenv_dir!

    set VENV_START=

    if defined Avenv_dir (

        if not exist !Avenv_dir! (
            echo ERROR: Dir !Avenv_dir! not exist ...
            exit /b 1
        )
        
        if not exist !Avenv_dir!Scripts\activate.bat (
            echo ERROR: File !Avenv_dir!Scripts\activate.bat not exist ...
            exit /b 2
        )
        
        call !Avenv_dir!Scripts\activate.bat
        set VENV_START=!Avenv_dir!

    ) else (
        echo ERROR: Avenv_dir not defined ... VENV_START
        exit /b 3
    )
 
    exit /b 0
rem endfunction


rem -----------------------------------------------
rem procedure VENV_STOP (Avenv_dir) -> None
rem -----------------------------------------------
:VENV_STOP
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_STOP
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Avenv_dir=%~1
    rem echo Avenv_dir:!Avenv_dir!

    set VENV_STOP=

    if defined Avenv_dir (
        if not exist !Avenv_dir! (
            echo ERROR: Dir !Avenv_dir! not exist ...
            exit /b 1
        )
        if not exist !Avenv_dir!Scripts\activate.bat (
            echo ERROR: File !Avenv_dir!Scripts\deactivate.bat ...
            exit /b 2
        )
        call !Avenv_dir!Scripts\deactivate.bat
        set VENV_STOP=!Avenv_dir!

    ) else (
        echo ERROR: Avenv_dir not defined ... VENV_STOP
        exit /b 3
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_UPDATE (Avenv_dir) -> None
rem -----------------------------------------------
:VENV_UPDATE
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=VENV_UPDATE
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set Avenv_dir=%~1
    rem echo Avenv_dir:!Avenv_dir!

    set VENV_UPDATE=

    if defined Avenv_dir (
        if not exist !Avenv_dir! (
            echo ERROR: Dir !Avenv_dir! not exist ...
            exit /b 1
        )

        set VENV_UPDATE=!Avenv_dir!

        echo Install packeges requirements.txt ...
        rem pip freeze > !Avenv_dir!\requirements.txt
        pip freeze > requirements.txt
        call :CHANGE_STR requirements.txt "==" ">=" || exit /b 1
        rem echo cd:!cd!
        if exist LOG\ (
            pip install -r requirements.txt > LOG\install.log
        ) else (
            pip install -r requirements.txt
            rem pip install -r !Avenv_dir!\requirements.txt
        )

    ) else (
         echo ERROR: Avenv_dir not defined ... VENV_UPDATE
         exit /b 3
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
:GET_Ox
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GET_Oxxx
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
