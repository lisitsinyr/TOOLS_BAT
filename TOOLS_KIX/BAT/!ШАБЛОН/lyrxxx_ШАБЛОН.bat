@echo off
rem -------------------------------------------------------------------
chcp 1251

if "%KXLDIR%" == "" goto Begin
goto Stop

:Begin
echo Значение переменной среды KXLDIR не установлено
if "%COMPUTERNAME%" == "%USERDOMAIN%" goto Local

:Network
set KXLDIR=\\S73FS01\APPInfo\tools
goto Stop

:Local
set KXLDIR=D:\TOOLS
set KXLDIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
goto Stop

:Stop
echo Значение переменной среды KXLDIR=%KXLDIR%

kix32.exe %KXLDIR%\APP\GITKIX.kix "$BATFILENAME=%~n0" "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$KxlDir=%KXLDIR%"

exit :eof
:Exit

#====================================================================
PROJECTS='PROJECTS_UNIX'
# -------------------------------------------------------------------
CURRENT_SYSTEM=$(uname -a)
UNAME=$(uname -n)
USERNAME=$(whoami)
# -------------------------------------------------------------------
# БИБЛИОТЕКА LYR
# -------------------------------------------------------------------
UNAME=$(uname -n)
if [[ -z "$LIB_SH" ]] ; then
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            ;;
        *)
            echo "Компьютер не определен...!"
            exit 1
            ;;
    esac
    PROJECTS_DIR="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS"
    LIB_SH="$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/$PROJECTS/LIB"
fi
# echo "Каталог проектов LYR: $PROJECTS_DIR"
# echo "Каталог библиотеки LYR: $LIB_SH"
if [[ ! -d "$LIB_SH" ]] ; then
    echo 'Каталог библиотеки LYR'"$LIB_SH"' не существует...'
    exit 1
fi
# -------------------------------------------------------------------
# запуск скриптов БИБЛИОТЕКИ LYR
# -------------------------------------------------------------------
source "$LIB_SH/LYRFileUtils.sh"
source "$LIB_SH/LYRLog.sh"
source "$LIB_SH/LYRConst.sh"
source "$LIB_SH/LYRDateTime.sh"
source "$LIB_SH/LYRDateTime.txt"
source "$LIB_SH/LYRSupport.sh"
#====================================================================

# -------------------------------------------------------------------
# StartLogFile
# -------------------------------------------------------------------
StartLogFile "$0" "" ""
# -------------------------------------------------------------------
