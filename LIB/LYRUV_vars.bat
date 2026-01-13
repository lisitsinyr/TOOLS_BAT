@echo off
rem -------------------------------------------------------------------
rem LYRUV_vars.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem ¬˚ıÓ‰ ËÁ ÒˆÂÌ‡Ëˇ. ƒ‡Î¸¯Â - ÚÓÎ¸ÍÓ ÙÛÌÍˆËË.
    exit /b 0
:end

rem =================================================
rem ‘”Õ ÷»»
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRUV_vars_INIT () -> None
rem --------------------------------------------------------------------------------
:LYRUV_vars_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRUV_vars_INIT
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
    set UV_BREAK_SYSTEM_PACKAGES=
    set UV_BUILD_CONSTRAINT=
    set UV_CACHE_DIR added=
    set UV_COMPILE_BYTECODE=
    set UV_COMPILE_BYTECODE_TIMEOUT=
    set UV_CONCURRENT_BUILDS=
    set UV_CONCURRENT_DOWNLOADS=
    set UV_CONCURRENT_INSTALLS=
    set UV_CONFIG_FILE added=
    set UV_CONSTRAINT added=
    set UV_CREDENTIALS_DIR=
    set UV_CUSTOM_COMPILE_COMMAND=
    set UV_DEFAULT_INDEX=
    set UV_DEV=
    set UV_DOWNLOAD_URL=
    set UV_ENV_FILE=
    set UV_EXCLUDE=
    set UV_EXCLUDE_NEWER=
    set UV_EXTRA_INDEX_URL=
    set UV_FIND_LINKS=
    set UV_FORK_STRATEGY=
    set UV_FROZEN
    set UV_GITHUB_TOKEN=
    set UV_GIT_LFS=
    set UV_HIDE_BUILD_OUTPUT=
    set UV_HTTP_RETRIES=
    set UV_HTTP_TIMEOUT=
    set UV_INDEX=
    set UV_INDEX_STRATEGY=
    set UV_INDEX_URL=

    rem set UV_INDEX_{name}_PASSWORD=
    rem set UV_INDEX_{name}_USERNAME=

    set UV_INIT_BUILD_BACKEND=
    set UV_INSECURE_HOST=
    set UV_INSECURE_NO_ZIP_VALIDATION=
    set UV_INSTALLER_GHE_BASE_URL=
    set UV_INSTALLER_GITHUB_BASE_URL=
    set UV_INSTALL_DIR=
    set UV_ISOLATED=
    set UV_KEYRING_PROVIDER=
    set UV_LIBC=
    set UV_LINK_MODE=
    set UV_LOCKED=
    set UV_LOCK_TIMEOUT=
    set UV_LOG_CONTEXT=
    set UV_MANAGED_PYTHON=
    set UV_NATIVE_TLS=
    set UV_NO_BINARY=
    set UV_NO_BINARY_PACKAGE=
    set UV_NO_BUILD=
    set UV_NO_BUILD_ISOLATION=
    set UV_NO_BUILD_PACKAGE=
    set UV_NO_CACHE=
    set UV_NO_CONFIG=
    set UV_NO_DEFAULT_GROUPS=
    set UV_NO_DEV=
    set UV_NO_EDITABLE=
    set UV_NO_ENV_FILE=
    set UV_NO_GITHUB_FAST_PATH=
    set UV_NO_GROUP=
    set UV_NO_HF_TOKEN=
    set UV_NO_INSTALLER_METADATA=
    set UV_NO_MANAGED_PYTHON=
    set UV_NO_MODIFY_PATH=
    set UV_NO_PROGRESS=
    set UV_NO_SOURCES=
    set UV_NO_SYNC=
    set UV_NO_VERIFY_HASHES=
    set UV_NO_WRAP=
    set UV_OFFLINE=
    set UV_OVERRIDE=
    set UV_PRERELEASE=
    set UV_PREVIEW=
    set UV_PREVIEW_FEATURES=
    set UV_PROJECT=
    set UV_PROJECT_ENVIRONMENT=
    set UV_PUBLISH_CHECK_URL=
    set UV_PUBLISH_INDEX=
    set UV_PUBLISH_NO_ATTESTATIONS=
    set UV_PUBLISH_PASSWORD=
    set UV_PUBLISH_TOKEN=
    set UV_PUBLISH_URL=
    set UV_PUBLISH_USERNAME=
    set UV_PYPY_INSTALL_MIRROR=
    set UV_PYTHON=
    set UV_PYTHON_BIN_DIR=
    set UV_PYTHON_CACHE_DIR=
    set UV_PYTHON_CPYTHON_BUILD=
    set UV_PYTHON_DOWNLOADS=
    set UV_PYTHON_DOWNLOADS_JSON_URL=
    set UV_PYTHON_GRAALPY_BUILD=
    set UV_PYTHON_INSTALL_BIN=
    set UV_PYTHON_INSTALL_DIR=
    set UV_PYTHON_INSTALL_MIRROR=
    set UV_PYTHON_INSTALL_REGISTRY=
    set UV_PYTHON_PREFERENCE=
    set UV_PYTHON_PYODIDE_BUILD=
    set UV_PYTHON_PYPY_BUILD=
    set UV_REQUEST_TIMEOUT=
    set UV_REQUIRE_HASHES=
    set UV_RESOLUTION=
    set UV_S3_ENDPOINT_URL=
    set UV_SKIP_WHEEL_FILENAME_CHECK=
    set UV_STACK_SIZE=
    set UV_SYSTEM_PYTHON=
    set UV_TEST_NO_HTTP_RETRY_DELAY=
    set UV_TOOL_BIN_DIR=
    set UV_TOOL_DIR=
    set UV_TORCH_BACKEND=
    set UV_UNMANAGED_INSTALL=
    set UV_UPLOAD_HTTP_TIMEOUT=
    set UV_VENV_CLEAR=
    set UV_VENV_SEED=
    set UV_WORKING_DIR=

    set ALL_PROXY=
    set ANDROID_API_LEVEL=
    set AWS_ACCESS_KEY_ID=
    set AWS_CONFIG_FILE=
    set AWS_DEFAULT_REGION=
    set AWS_PROFILE=
    set AWS_REGION=
    set AWS_SECRET_ACCESS_KEY=
    set AWS_SESSION_TOKEN=
    set AWS_SHARED_CREDENTIALS_FILE=
    set BASH_VERSION=
    set CLICOLOR_FORCE=
    set COLUMNS=
    set CONDA_DEFAULT_ENV=
    set CONDA_PREFIX=
    set DEPENDABOT=
    set FISH_VERSION=
    set FORCE_COLOR=
    set GITHUB_ACTIONS=
    set GITLAB_CI=
    set HF_TOKEN=
    set HTTPS_PROXY=
    set HTTP_PROXY=
    set HTTP_TIMEOUT=
    set IPHONEOS_DEPLOYMENT_TARGET=
    set JPY_SESSION_NAME=
    set KSH_VERSION=
    set MACOSX_DEPLOYMENT_TARGET=
    set NETRC=
    set NO_COLOR=
    set NO_PROXY=
    set NU_VERSION=
    set PAGER=
    set PWD=
    set PYC_INVALIDATION_MODE=
    set PYX_API_KEY=
    set PYX_API_URL=
    set PYX_AUTH_TOKEN=
    set PYX_CDN_DOMAIN=
    set PYX_CREDENTIALS_DIR=
    set RUST_BACKTRACE=
    set RUST_LOG=
    set RUST_MIN_STACK=
    set SHELL=
    set SSL_CERT_DIR=
    set SSL_CERT_FILE=
    set SSL_CLIENT_CERT=
    set TRACING_DURATIONS_FILE=
    set UV=
    set VIRTUAL_ENV=
    set VIRTUAL_ENV_DISABLE_PROMPT=
    set XDG_BIN_HOME=
    set XDG_CACHE_HOME=
    set XDG_CONFIG_DIRS=
    set XDG_CONFIG_HOME=
    set XDG_DATA_HOME=
    set ZDOTDIR=
    set ZSH_VERSION=
    set _CONDA_ROOT=


    rem set APPDATA
    rem     APPDATA=C:\Users\lyr\AppData\Roaming
    rem set USERPROFILE
    rem     USERPROFILE=C:\Users\lyr
    rem set HOME
    rem     HOMEDRIVE=C:
    rem     HOMEPATH=\Users\lyr
    rem set LOCALAPPDATA
    rem     LOCALAPPDATA=C:\Users\lyr\AppData\Local
    rem set PATH
    rem     Path=C:\Program Files\Far Manager\;C:\Program Files (x86)\Embarcadero\Studio\23.0\bin;C:\Users\Public\Documents\Embarcadero\Studio\23.0\Bpl;C:\Program Files (x86)\Embarcadero\Studio\23.0\bin64;C:\Users\Public\Documents\Embarcadero\Studio\23.0\Bpl\Win64;C:\Program Files\Quarto\bin;D:\APPS\Borland\Delphi7\Bin;D:\APPS\Borland\Delphi7\Projects\Bpl;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\OpenSSH\;C:\windows\system32;C:\Program Files\Microsoft MPI\Bin\;C:\Program Files\WinRAR;C:\Program Files\WinMerge;C:\Program Files (x86)\VMware\VMware Workstation\bin\;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Program Files (x86)\ActiveState Komodo IDE 12\;C:\Program Files\MySQL\MySQL Server 8.0\bin;C:\Program Files (x86)\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\MySQL\MySQL Utilities 1.6\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files (x86)\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\PostgreSQL\15\bin;C:\Program Files\dotnet\;C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\;C:\Program Files\Java\jdk-19\bin;C:\Program Files\AdoptOpenJDK\jdk-8.0.242.08-hotspot\bin;C:\Program Files\WireGuard\;C:\Program Files (x86)\Compare It!;C:\Program Files\ExifTool;C:\Program Files\GitHub CLI\;C:\ProgramData\chocolatey\bin;C:\Program Files\Go\bin;D:\TOOLS\TOOLS_BAT\BAT;D:\TOOLS\TOOLS_PY\BAT;D:\TOOLS\TOOLS_GIT\BAT;D:\TOOLS\ffmpeg\bin;D:\TOOLS\yt-dlp;D:\APP\bin;C:\Users\lyr\AppData\Local\Programs\CLion\bin\mingw\bin;C:\Program Files\Tesseract-OCR;C:\Program Files\glzr.io\Zebar\;C:\Program Files (x86)\GnuWin32\bin;C:\FPC\3.2.2\bin\i386-win32;C:\gnu\glo6612wb\bin;C:\gnu\ctags58\ctags58;C:\Program Files (x86)\AOMEI\AOMEI Backupper\7.5.0;C:\Program Files\PowerShell\7\;C:\Program Files\Git\cmd;C:\Program Files\PowerToys\DSCModules\;C:\Program Files\Docker\Docker\resources\bin;____C:\Users\lyr\AppData\Local\Programs\Python\Python314;C:\Users\lyr\.local\bin;C:\Users\lyr\.pyenv\pyenv-win\bin;C:\Users\lyr\.pyenv\pyenv-win\shims;D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\Delphi_7\LIBRARY_D7\BPL\V70;C:\Users\lyr\AppData\Local\JetBrains\Toolbox\scripts;C:\Users\lyr\AppData\Local\Programs\Microsoft VS Code\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\lyr\AppData\Local\GitHubDesktop\bin;C:\Program Files\Advanced Renamer;C:\Users\lyr\AppData\Local\Microsoft\WindowsApps;C:\Users\lyr\go\bin;C:\Users\lyr\AppData\Local\Programs\oh-my-posh\bin;C:\Users\lyr\AppData\Local\Programs\Windsurf\bin;C:\Users\lyr\AppData\Local\Programs\Ollama;C:\Users\lyr\AppData\Local\Microsoft\WinGet\Links;C:\Users\lyr\AppData\Local\Programs\cursor\resources\app\bin;D:\UTILS\_Markdown\Markdown Monster Portable
    rem     PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC
    rem set PROMPT
    rem     PROMPT=$P$G
    rem set PYTHONPATH
    rem     PYTHONPATH=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\TOOLS_SRC_PY;D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\Lib\site-packages;
    rem set SYSTEMDRIVE
    rem     SystemDrive=C:

    rem echo INFO: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure LYRUV_vars_SHOW () -> None
rem --------------------------------------------------------------------------------
:LYRUV_vars_SHOW
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRUV_vars_SHOW
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------

    set UV_BREAK_SYSTEM_PACKAGES
    set UV_BUILD_CONSTRAINT
    set UV_CACHE_DIR added
    set UV_COMPILE_BYTECODE
    set UV_COMPILE_BYTECODE_TIMEOUT
    set UV_CONCURRENT_BUILDS
    set UV_CONCURRENT_DOWNLOADS
    set UV_CONCURRENT_INSTALLS
    set UV_CONFIG_FILE added
    set UV_CONSTRAINT added
    set UV_CREDENTIALS_DIR
    set UV_CUSTOM_COMPILE_COMMAND
    set UV_DEFAULT_INDEX
    set UV_DEV added
    set UV_DOWNLOAD_URL
    set UV_ENV_FILE
    set UV_EXCLUDE
    set UV_EXCLUDE_NEWER
    set UV_EXTRA_INDEX_URL
    set UV_FIND_LINKS
    set UV_FORK_STRATEGY
    set UV_FROZEN added
    set UV_GITHUB_TOKEN
    set UV_GIT_LFS
    set UV_HIDE_BUILD_OUTPUT
    set UV_HTTP_RETRIES
    set UV_HTTP_TIMEOUT
    set UV_INDEX added
    set UV_INDEX_STRATEGY
    set UV_INDEX_URL
    set UV_INDEX_{name}_PASSWORD
    set UV_INDEX_{name}_USERNAME
    set UV_INIT_BUILD_BACKEND
    set UV_INSECURE_HOST
    set UV_INSECURE_NO_ZIP_VALIDATION
    set UV_INSTALLER_GHE_BASE_URL
    set UV_INSTALLER_GITHUB_BASE_URL
    set UV_INSTALL_DIR
    set UV_ISOLATED
    set UV_KEYRING_PROVIDER
    set UV_LIBC
    set UV_LINK_MODE
    set UV_LOCKED
    set UV_LOCK_TIMEOUT
    set UV_LOG_CONTEXT
    set UV_MANAGED_PYTHON
    set UV_NATIVE_TLS
    set UV_NO_BINARY
    set UV_NO_BINARY_PACKAGE
    set UV_NO_BUILD
    set UV_NO_BUILD_ISOLATION
    set UV_NO_BUILD_PACKAGE
    set UV_NO_CACHE
    set UV_NO_CONFIG
    set UV_NO_DEFAULT_GROUPS
    set UV_NO_DEV
    set UV_NO_EDITABLE
    set UV_NO_ENV_FILE
    set UV_NO_GITHUB_FAST_PATH
    set UV_NO_GROUP
    set UV_NO_HF_TOKEN
    set UV_NO_INSTALLER_METADATA
    set UV_NO_MANAGED_PYTHON
    set UV_NO_MODIFY_PATH
    set UV_NO_PROGRESS
    set UV_NO_SOURCES
    set UV_NO_SYNC
    set UV_NO_VERIFY_HASHES
    set UV_NO_WRAP
    set UV_OFFLINE
    set UV_OVERRIDE
    set UV_PRERELEASE
    set UV_PREVIEW
    set UV_PREVIEW_FEATURES
    set UV_PROJECT
    set UV_PROJECT_ENVIRONMENT
    set UV_PUBLISH_CHECK_URL
    set UV_PUBLISH_INDEX
    set UV_PUBLISH_NO_ATTESTATIONS
    set UV_PUBLISH_PASSWORD
    set UV_PUBLISH_TOKEN
    set UV_PUBLISH_URL
    set UV_PUBLISH_USERNAME
    set UV_PYPY_INSTALL_MIRROR
    set UV_PYTHON
    set UV_PYTHON_BIN_DIR
    set UV_PYTHON_CACHE_DIR
    set UV_PYTHON_CPYTHON_BUILD
    set UV_PYTHON_DOWNLOADS
    set UV_PYTHON_DOWNLOADS_JSON_URL
    set UV_PYTHON_GRAALPY_BUILD
    set UV_PYTHON_INSTALL_BIN
    set UV_PYTHON_INSTALL_DIR
    set UV_PYTHON_INSTALL_MIRROR
    set UV_PYTHON_INSTALL_REGISTRY
    set UV_PYTHON_PREFERENCE
    set UV_PYTHON_PYODIDE_BUILD
    set UV_PYTHON_PYPY_BUILD
    set UV_REQUEST_TIMEOUT
    set UV_REQUIRE_HASHES
    set UV_RESOLUTION
    set UV_S3_ENDPOINT_URL
    set UV_SKIP_WHEEL_FILENAME_CHECK
    set UV_STACK_SIZE
    set UV_SYSTEM_PYTHON
    set UV_TEST_NO_HTTP_RETRY_DELAY
    set UV_TOOL_BIN_DIR
    set UV_TOOL_DIR
    set UV_TORCH_BACKEND
    set UV_UNMANAGED_INSTALL
    set UV_UPLOAD_HTTP_TIMEOUT
    set UV_VENV_CLEAR
    set UV_VENV_SEED
    set UV_WORKING_DIR

    set ALL_PROXY
    set ANDROID_API_LEVEL
    set AWS_ACCESS_KEY_ID
    set AWS_CONFIG_FILE
    set AWS_DEFAULT_REGION
    set AWS_PROFILE
    set AWS_REGION
    set AWS_SECRET_ACCESS_KEY
    set AWS_SESSION_TOKEN
    set AWS_SHARED_CREDENTIALS_FILE
    set BASH_VERSION
    set CLICOLOR_FORCE
    set COLUMNS
    set CONDA_DEFAULT_ENV
    set CONDA_PREFIX
    set DEPENDABOT
    set FISH_VERSION
    set FORCE_COLOR
    set GITHUB_ACTIONS
    set GITLAB_CI
    set HF_TOKEN
    set HTTPS_PROXY
    set HTTP_PROXY
    set HTTP_TIMEOUT
    set IPHONEOS_DEPLOYMENT_TARGET
    set JPY_SESSION_NAME
    set KSH_VERSION
    set MACOSX_DEPLOYMENT_TARGET
    set NETRC
    set NO_COLOR
    set NO_PROXY
    set NU_VERSION
    set PAGER
    set PWD
    set PYC_INVALIDATION_MODE
    set PYX_API_KEY
    set PYX_API_URL
    set PYX_AUTH_TOKEN
    set PYX_CDN_DOMAIN
    set PYX_CREDENTIALS_DIR
    set RUST_BACKTRACE
    set RUST_LOG
    set RUST_MIN_STACK
    set SHELL
    set SSL_CERT_DIR
    set SSL_CERT_FILE
    set SSL_CLIENT_CERT
    set TRACING_DURATIONS_FILE
    set UV
    set VIRTUAL_ENV
    set VIRTUAL_ENV_DISABLE_PROMPT
    set XDG_BIN_HOME
    set XDG_CACHE_HOME
    set XDG_CONFIG_DIRS
    set XDG_CONFIG_HOME
    set XDG_DATA_HOME
    set ZDOTDIR
    set ZSH_VERSION
    set _CONDA_ROOT


    rem set APPDATA
    rem     APPDATA=C:\Users\lyr\AppData\Roaming
    rem set USERPROFILE
    rem     USERPROFILE=C:\Users\lyr
    rem set HOME
    rem     HOMEDRIVE=C:
    rem     HOMEPATH=\Users\lyr
    rem set LOCALAPPDATA
    rem     LOCALAPPDATA=C:\Users\lyr\AppData\Local
    rem set PATH
    rem     Path=C:\Program Files\Far Manager\;C:\Program Files (x86)\Embarcadero\Studio\23.0\bin;C:\Users\Public\Documents\Embarcadero\Studio\23.0\Bpl;C:\Program Files (x86)\Embarcadero\Studio\23.0\bin64;C:\Users\Public\Documents\Embarcadero\Studio\23.0\Bpl\Win64;C:\Program Files\Quarto\bin;D:\APPS\Borland\Delphi7\Bin;D:\APPS\Borland\Delphi7\Projects\Bpl;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\OpenSSH\;C:\windows\system32;C:\Program Files\Microsoft MPI\Bin\;C:\Program Files\WinRAR;C:\Program Files\WinMerge;C:\Program Files (x86)\VMware\VMware Workstation\bin\;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Program Files (x86)\ActiveState Komodo IDE 12\;C:\Program Files\MySQL\MySQL Server 8.0\bin;C:\Program Files (x86)\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\MySQL\MySQL Utilities 1.6\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files (x86)\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\150\DTS\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\PostgreSQL\15\bin;C:\Program Files\dotnet\;C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit\;C:\Program Files\Java\jdk-19\bin;C:\Program Files\AdoptOpenJDK\jdk-8.0.242.08-hotspot\bin;C:\Program Files\WireGuard\;C:\Program Files (x86)\Compare It!;C:\Program Files\ExifTool;C:\Program Files\GitHub CLI\;C:\ProgramData\chocolatey\bin;C:\Program Files\Go\bin;D:\TOOLS\TOOLS_BAT\BAT;D:\TOOLS\TOOLS_PY\BAT;D:\TOOLS\TOOLS_GIT\BAT;D:\TOOLS\ffmpeg\bin;D:\TOOLS\yt-dlp;D:\APP\bin;C:\Users\lyr\AppData\Local\Programs\CLion\bin\mingw\bin;C:\Program Files\Tesseract-OCR;C:\Program Files\glzr.io\Zebar\;C:\Program Files (x86)\GnuWin32\bin;C:\FPC\3.2.2\bin\i386-win32;C:\gnu\glo6612wb\bin;C:\gnu\ctags58\ctags58;C:\Program Files (x86)\AOMEI\AOMEI Backupper\7.5.0;C:\Program Files\PowerShell\7\;C:\Program Files\Git\cmd;C:\Program Files\PowerToys\DSCModules\;C:\Program Files\Docker\Docker\resources\bin;____C:\Users\lyr\AppData\Local\Programs\Python\Python314;C:\Users\lyr\.local\bin;C:\Users\lyr\.pyenv\pyenv-win\bin;C:\Users\lyr\.pyenv\pyenv-win\shims;D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\Delphi_7\LIBRARY_D7\BPL\V70;C:\Users\lyr\AppData\Local\JetBrains\Toolbox\scripts;C:\Users\lyr\AppData\Local\Programs\Microsoft VS Code\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\lyr\AppData\Local\GitHubDesktop\bin;C:\Program Files\Advanced Renamer;C:\Users\lyr\AppData\Local\Microsoft\WindowsApps;C:\Users\lyr\go\bin;C:\Users\lyr\AppData\Local\Programs\oh-my-posh\bin;C:\Users\lyr\AppData\Local\Programs\Windsurf\bin;C:\Users\lyr\AppData\Local\Programs\Ollama;C:\Users\lyr\AppData\Local\Microsoft\WinGet\Links;C:\Users\lyr\AppData\Local\Programs\cursor\resources\app\bin;D:\UTILS\_Markdown\Markdown Monster Portable
    rem     PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC
    rem set PROMPT
    rem     PROMPT=$P$G
    rem set PYTHONPATH
    rem     PYTHONPATH=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\TOOLS_SRC_PY;D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P314\Lib\site-packages;
    rem set SYSTEMDRIVE
    rem     SystemDrive=C:

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo INFO: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __INIT_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__INIT_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo ..LD.. VarName:!VarName!

    set !VarName!_caption.1=1.app
    set !VarName!_caption.2=2.lib
    set !VarName!_caption.3=3.bare
    set !VarName!_caption.4=4.script
    set !VarName!_value.1=app
    set !VarName!_value.2=lib
    set !VarName!_value.3=bare
    set !VarName!_value.4=script

    rem set !VarName!_caption
    rem set !VarName!_value

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __DEL_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__DEL_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__DEL_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo ..LD.. VarName:!VarName!

    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_caption' ) do (
        set %%k=
    )
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        set %%k=
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __GET_project_type_str (VarName VarValue) -> None
rem --------------------------------------------------------------------------------
:__GET_project_type_str
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__GET_project_type_str
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    set VarValue=%~2

    set /a i=0
    set /a result=0
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        if !%%k!==!VarValue! set /a result=i
        set /a i=i+1
    )

    set !VarName!=!result!
    set __GET_project_type_str=!result!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __GET_project_type_number (VarName VarValue) -> None
rem --------------------------------------------------------------------------------
:__GET_project_type_number
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__GET_project_type
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    set /a VarValue=%~2

    set /a i=0
    set result=
    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_value' ) do (
        set /a i=i+1
        if !i! == !VarValue! set result=!%%k!
    )

    set !VarName!=!result!
    set __GET_project_type_number=!result!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function __SHOW_project_types (VarName) -> None
rem --------------------------------------------------------------------------------
:__SHOW_project_types
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SHOW_project_types
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem project_type
    rem -------------------------------------------------------------------
    set VarName=%~1
    rem echo ..LD.. VarName:!VarName!

    for /f "tokens=1,* delims==" %%k in ( 'set !VarName!_caption' ) do (
        echo !%%k!
    )

    exit /b 0
rem endfunction

rem =================================================
rem ‘”Õ ÷»» LIB
rem =================================================
