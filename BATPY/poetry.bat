@echo off
rem -------------------------------------------------------------------
rem poetry.bat
rem     Запуск poetry из глобального виртуального пространства
rem Poetry (version 1.8.2)
rem 
rem Usage:
rem   command [options] [arguments]
rem 
rem Options:
rem   -h, --help                 Display help for the given command. When no command is given display help for the list command.
rem   -q, --quiet                Do not output any message.
rem   -V, --version              Display this application version.
rem       --ansi                 Force ANSI output.
rem       --no-ansi              Disable ANSI output.
rem   -n, --no-interaction       Do not ask any interactive question.
rem       --no-plugins           Disables plugins.
rem       --no-cache             Disables Poetry source caches.
rem   -C, --directory=DIRECTORY  The working directory for the Poetry command (defaults to the current working directory).
rem   -v|vv|vvv, --verbose       Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.
rem 
rem Available commands:
rem   build              Builds a package, as a tarball and a wheel by default.
rem   publish            Publishes a package to a remote repository.
rem   search             Searches for packages on remote repositories.
rem 
rem  cache
rem   cache clear        Clears a Poetry cache by name.
rem   cache list         List Poetry's caches.
rem 
rem  debug
rem   debug info         Shows debug information.
rem   debug resolve      Debugs dependency resolution.
rem 
rem  env
rem   env info           Displays information about the current environment.
rem   env list           Lists all virtualenvs associated with the current project.
rem   env remove         Remove virtual environments associated with the project.
rem   env use            Activates or creates a new virtualenv for the current project.
rem 
rem  self
rem   self add           Add additional packages to Poetry's runtime environment.
rem   self install       Install locked packages (incl. addons) required by this Poetry installation.
rem   self lock          Lock the Poetry installation's system requirements.
rem   self remove        Remove additional packages from Poetry's runtime environment.
rem   self show          Show packages from Poetry's runtime environment.
rem   self show plugins  Shows information about the currently installed plugins.
rem   self update        Updates Poetry to the latest version.
rem 
rem  source
rem   source add         Add source configuration for project.
rem   source remove      Remove source configured for the project.
rem   source show        Show information about sources configured for the project.
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт %BATNAME% ...

    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    set LIB_BAT=%SCRIPTS_DIR%\LIB
    call :CurrentDir || exit /b 1
    rem  echo CurrentDir: %CurrentDir%
    set PN_CAPTION=new,init,list,version,about,help,config,show,add,remove,update,install,lock,export,check,run,shell,...
    set COMMAND=list
    rem set COMMAND=
    call :Check_P COMMAND %1 || exit /b 1
    rem echo COMMAND: %COMMAND%

    if "%COMMAND%"=="" (
        echo ERROR: Параметр COMMAND не задан...
        echo Использование: %BATNAME% COMMAND [P2] [...]
    ) else (
        call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
    )
    rem echo Использование: %BATNAME% [P1] [P2] [...]
    rem call :MAIN_FUNC %1 %2 %3 %4 %5 %6 %7 %8 %9
:Exit
exit /b 0

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo COMMAND: %COMMAND%

    if "%COMMAND%"=="new" (
        call :poetry_new %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="init" (
        call :poetry_init %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="list" (
        call :poetry_list %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="version" (
        call :poetry_version %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="about" (
        call :poetry_about %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="help" (
        call :poetry_help %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="config" (
        call :poetry_config %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="show" (
        call :poetry_show %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="add" (
        call :poetry_add %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="remove" (
        call :poetry_remove %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="update" (
        call :poetry_update %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="install" (
        call :poetry_install %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="lock" (
        call :poetry_lock %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="export" (
        call :poetry_export %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="check" (
        call :poetry_check %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="run" (
        call :poetry_run %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
    if "%COMMAND%"=="shell" (
        call :poetry_shell %1 %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        echo ERROR: Параметр COMMAND не реализован...
        call :PressAnyKey || exit /b 1
    )))))))))))))))))
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_new ()
rem   new                Creates a new Python project at <path>.
rem --------------------------------------------------------------------------------
:poetry_new
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Creates a new Python project at path.
    set PN_CAPTION=Ввод значения
    set PROJECTpath=test
    call :Check_P PROJECTpath %2 || exit /b 1
    if "%PROJECTpath%"=="" (
        echo ERROR: Параметр PROJECTpath не задан...
        echo Использование: %BATNAME% new PROJECTpath
    ) else (
        echo PROJECTpath: %PROJECTpath%
    )
    rem call :run_poetry %COMMAND% %PROJECTpath% %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_init ()
rem   init               Creates a basic pyproject.toml file in the current directory.
rem --------------------------------------------------------------------------------
:poetry_init
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Creates a basic pyproject.toml file in the current directory.
    rem call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_list ()
rem   list               Lists commands.
rem --------------------------------------------------------------------------------
:poetry_list
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Lists commands.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_version ()
rem   version            Shows the version of the project or bumps it when a valid bump rule is provided.
rem --------------------------------------------------------------------------------
:poetry_version
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Shows the version of the project or bumps it when a valid bump rule is provided.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_about ()
rem   about              Shows information about Poetry.
rem --------------------------------------------------------------------------------
:poetry_about
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Shows information about Poetry.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_help ()
rem   help               Displays help for a command.
rem --------------------------------------------------------------------------------
:poetry_help
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Displays help for a command.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_config ()
rem   config             Manages configuration settings.
rem --------------------------------------------------------------------------------
:poetry_config
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Manages configuration settings.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_show ()
rem   show               Shows information about packages.
rem --------------------------------------------------------------------------------
:poetry_show
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Shows information about packages.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_add ()
rem   add                Adds a new dependency to pyproject.toml.
rem --------------------------------------------------------------------------------
:poetry_add
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Adds a new dependency to pyproject.toml.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_remove ()
rem   remove             Removes a package from the project dependencies.
rem --------------------------------------------------------------------------------
:poetry_remove
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Removes a package from the project dependencies.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_remove ()
rem   update             Update the dependencies as according to the pyproject.toml file.
rem --------------------------------------------------------------------------------
:poetry_update
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Update the dependencies as according to the pyproject.toml file.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_install ()
rem   install            Installs the project dependencies.
rem --------------------------------------------------------------------------------
:poetry_install
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Installs the project dependencies.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_lock ()
rem   lock               Locks the project dependencies.
rem --------------------------------------------------------------------------------
:poetry_lock
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Locks the project dependencies.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_export ()
rem   export             Exports the lock file to alternative formats.
rem --------------------------------------------------------------------------------
:poetry_export
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Exports the lock file to alternative formats.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_check ()
rem   check              Validates the content of the pyproject.toml file and its consistency with the poetry.lock file.
rem --------------------------------------------------------------------------------
:poetry_check
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Validates the content of the pyproject.toml file and its consistency with the poetry.lock file.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_run ()
rem   run                Runs a command in the appropriate environment.
rem --------------------------------------------------------------------------------
:poetry_run
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Runs a command in the appropriate environment.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure poetry_shell ()
rem   shell              Spawns a shell within the virtual environment.
rem --------------------------------------------------------------------------------
:poetry_shell
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    echo Spawns a shell within the virtual environment.
    call :run_poetry %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure run_poetry ()
rem --------------------------------------------------------------------------------
:run_poetry
rem beginfunction
    set FUNCNAME=%0
    if "%DEBUG%"=="1" (
        echo DEBUG: procedure %FUNCNAME% ...
    )
    C:\Users\lyr\AppData\Local\Programs\Python\Python312\Scripts\poetry.exe %COMMAND% %2 %3 %4 %5 %6 %7 %8 %9
    call :PressAnyKey || exit /b 1
    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
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
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
