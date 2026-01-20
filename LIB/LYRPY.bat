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

    rem echo INFO: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_project_dir (VarName VarValue) -> project_dir
rem --------------------------------------------------------------------------------
:SET_project_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=project_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_dir
    rem -------------------------------------------------------------------
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
           set !VarName!=!VarValue!
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )
    if not exist !%VarName%!\ (
        echo ERROR: Dir !VarName!=!%VarName%! not exist ...
        exit /b 1
    ) else (
        if not exist !%VarName%!\PROJECT.ini (
            echo ERROR: Dir !VarName!=!%VarName%!\PROJECT.ini not exist ...
            exit /b 1
        )
    )

    cd /D "!%VarName%!"

    set SET_project_dir=!%VarName%!
    rem echo ..L9.. SET_project_dir:!SET_project_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_dir (VarName VarCaption VarDefault) -> project_dir
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_project_dir !VarName! !%VarName%! || exit /b 1
    )

    set GET_project_dir=!%VarName%!
    rem echo ..L9.. GET_project_dir:!GET_project_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_projects_dir (VarName VarValue) -> projects_dir
rem --------------------------------------------------------------------------------
:SET_projects_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_projects_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem projects_dir
    rem -------------------------------------------------------------------
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
           set !VarName!=!VarValue!
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )
    if not exist !%VarName%!\ (
        echo ERROR: Dir !VarName!=!%VarName%! not exist ...
        exit /b 1
    )

    cd /D "!%VarName%!"

    set SET_projects_dir=!%VarName%!
    rem echo ..L9.. SET_projects_dir:!SET_projects_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_projects_dir (VarName VarCaption VarDefault) -> projects_dir
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_projects_dir !VarName! !%VarName%! || exit /b 1
    )

    set GET_projects_dir=!%VarName%!
    rem echo ..L9.. GET_projects_dir:!GET_projects_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_project_name (VarName VarValue) -> project_name
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
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
           set !VarName!=!VarValue!
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )

    set SET_project_name=!%VarName%!
    rem echo ..L9.. SET_project_name:!SET_project_name!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_name (VarName VarCaption VarDefault) -> project_name
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_project_name !VarName! !%VarName%! || exit /b 1
    )

    set GET_project_name=!%VarName%!
    rem echo ..L9.. GET_project_name:!GET_project_name!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script_dir (VarName VarValue) -> script_dir
rem --------------------------------------------------------------------------------
:SET_script_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_script_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem script_dir
    rem -------------------------------------------------------------------
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
           set !VarName!=!VarValue!
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )
    if not exist !%VarName%!\ (
        echo ERROR: Dir !VarName!=!%VarName%! not exist ...
        exit /b 1
    )

    cd /D "!%VarName%!"

    set SET_script_dir=!%VarName%!
    rem echo ..L9.. SET_script_dir:!SET_script_dir!

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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_script_dir !VarName! !%VarName%! || exit /b 1
    )

    set GET_script_dir=!%VarName%!
    rem echo ..L9.. GET_script_dir:!GET_script_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script (VarName VarValue) -> script
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
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
           set !VarName!=!VarValue!
           call :ExtractFileDir !%VarName%! || exit /b 1
           set script_dir=!ExtractFileDir!
           call :ExtractFileName !%VarName%! || exit /b 1
           set script_name=!ExtractFileName!
           call :ExtractFileExt !%VarName%! || exit /b 1
           set script_ext=!ExtractFileExt!
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )

    set SET_script=!%VarName%!
    rem echo ..L9.. SET_script:!SET_script!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script (VarName VarCaption VarDefault) -> script
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_script !VarName! !%VarName%! || exit /b 1
    )

    set GET_script=!%VarName%!
    rem echo ..L9.. GET_script:!GET_script!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_venv_dir (!project_dir! VarName VarValue) -> venv_dir
rem --------------------------------------------------------------------------------
:SET_venv_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_venv_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_dir
    rem -------------------------------------------------------------------
    set Aproject_dir=%~1
    rem echo ..L9.. Aproject_dir:!Aproject_dir!
    if defined Aproject_dir (
        if not exist !Aproject_dir! (
            set !VarName!=
            echo ERROR: Dir !Aproject_dir! not exist ...
            exit /b 1
        )
    ) else (
        set !VarName!=
        echo ERROR: Dir project_dir not defined ...
        exit /b 1
    )

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set VarName=%2
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~3
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
            set !VarName!=!VarValue!
            if !%VarName%!==P313 (
                set !VarName!=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
            ) else (
                if !%VarName%!==P314 (
                    set !VarName!=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\
                ) else (
                    if exist !%VarName%! (
                        set !VarName!=!%VarName%!
                    ) else (
                        set !VarName!=
                    )
                )
            )
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )

    if defined !VarName! (
        if not exist !%VarName%! (
            set !VarName!=
            echo ERROR: Dir !VarName!=!%VarName%! not exist ...
            exit /b 1
        )
    ) else (
        echo ERROR: Dir !VarName! not defined ...
        exit /b 1
    )

    set SET_venv_dir=!%VarName%!
    rem echo ..L9.. SET_venv_dir:!SET_venv_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_venv_dir (!project_dir! VarName VarCaption VarDefault) -> venv_dir
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
    rem project_dir
    rem -------------------------------------------------------------------
    set Aproject_dir=%~1
    rem echo ..L9.. Aproject_dir:!Aproject_dir!
    if defined Aproject_dir (
        if not exist !Aproject_dir! (
            set !VarName!=
            echo ERROR: Dir !Aproject_dir! not exist ...
            exit /b 1
        )
    ) else (
        set !VarName!=
        echo ERROR: Dir Aproject_dir not defined ...
        exit /b 1
    )
    
    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set VarName=%~2
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~3
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~4
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !VarName! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_venv_dir !Aproject_dir! !VarName! !%VarName%! || exit /b 1
    )

    set GET_venv_dir=!%VarName%!
    rem echo ..L9.. GET_venv_dir:!GET_venv_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_python_dir (VarName VarValue) -> python_dir
rem --------------------------------------------------------------------------------
:SET_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem python_dir
    rem -------------------------------------------------------------------
    set VarName=%1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=%~2
    rem echo ..L9.. VarValue:!VarValue!

    if defined VarName (
        if defined VarValue (
            set !VarName!=!VarValue!
            if !%VarName%!==3.13 (
                set !VarName!=C:\Users\lyr\AppData\Local\Programs\Python\Python313\
            ) else (
                if !%VarName%!==3.14 (
                    set !VarName!=C:\Users\lyr\AppData\Local\Programs\Python\Python314\
                ) else (
                    if exist !%VarName%! (
                        set !VarName!=!%VarName%!
                    ) else (
                        set !VarName!=
                    )
                )
            )
        ) else (
            echo ERROR: !VarName! VarValue not defined ...
            exit /b 3
        )
    ) else (
        echo ERROR: VarName not defined ...
        exit /b 3
    )

    if defined !VarName! (
        if not exist !%VarName%! (
            set !VarName!=
            echo ERROR: Dir !VarName!=!%VarName%! not exist ...
            exit /b 1
        )
    ) else (
        echo ERROR: Dir !VarName! not defined ...
        exit /b 1
    )

    set SET_python_dir=!%VarName%!
    rem echo ..L9.. SET_python_dir:!SET_python_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_python_dir (VarName VarCaption VarDefault) -> python_dir
rem --------------------------------------------------------------------------------
:GET_python_dir
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=GET_python_dir
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem python_dir
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
        call :SET_python_dir !VarName! !%VarName%! || exit /b 1
    )

    set GET_python_dir=!%VarName%!
    rem echo ..L9.. GET_python_dir:!GET_python_dir!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_requirements_file (VarName VarCaption VarDefault) -> requirements_file
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    rem echo ..L9.. VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )

    if defined !VarName! (
    )

    set GET_requirements_file=!%VarName%!
    rem echo ..L9.. GET_requirements_file:!GET_requirements_file!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package_names (VarName VarCaption VarDefault) -> package_names
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
    set VarName=%~1
    rem echo ..L9.. VarName:!VarName!
    set VarValue=!%VarName%!
    echo VarValue:!VarValue!
    set VarCaption=%~2
    rem echo ..L9.. VarCaption:!VarCaption!
    set VarDefault=%~3
    rem echo ..L9.. VarDefault:!VarDefault!

    if not defined !%VarName%! (
        call :Read_P !VarName! "!VarValue!" "!VarCaption!" "!VarDefault!" || exit /b 1
    )
    
    if defined !VarName! (
    )

    set GET_package_names=!%VarName%!
    rem echo ..L9.. GET_package_name:!GET_package_name!

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

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set Avenv_dir=%~1
    rem echo ..L9.. Avenv_dir:!Avenv_dir!

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

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set Avenv_dir=%~1
    rem echo ..L9.. Avenv_dir:!Avenv_dir!

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

    rem -------------------------------------------------------------------
    rem venv_dir
    rem -------------------------------------------------------------------
    set Avenv_dir=%~1
    rem echo ..L9.. Avenv_dir:!Avenv_dir!

    if defined Avenv_dir (
        if not exist !Avenv_dir! (
            echo ERROR: Dir !Avenv_dir! not exist ...
            exit /b 1
        )
        echo Install packeges requirements.txt ...
        rem pip freeze > !Avenv_dir!\requirements.txt
        pip freeze > requirements.txt
        call :CHANGE_STR requirements.txt "==" ">=" || exit /b 1
        rem echo ..L9.. cd:!cd!
        if exist LOG\ (
            pip install -r requirements.txt > LOG\install.log
        ) else (
            pip install -r requirements.txt
            rem pip install -r !Avenv_dir!\requirements.txt
        )
        set VENV_UPDATE=!Avenv_dir!
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
