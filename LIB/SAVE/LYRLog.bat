#!/bin/bash
# -----------------------------------------------
# LYRLog.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    LOG_DIR='
# echo '    LOG_FILE='
# echo '    LOG_OPT='
# echo '    LOG_FILE_DT_FORMAT'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

# -------------------------------------------------------------------
# Redirect stdout and stderr to the log file
# -------------------------------------------------------------------
#0, STDIN - стандартный поток ввода
#1, STDOUT - стандартный поток вывода
#2, STDERR - стандартный поток ошибок
#3, 3 - поток вывода
#4, 4 - поток вывода
#5, 5 - поток вывода
#6, 6 - поток вывода
#7, 7 - поток вывода
#8, 8 - поток вывода
#9, 9 - поток вывода

# -------------------------------------------------------------------
#   echo "This is normal output" >&1
#   echo "This is an error"      >&2
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   echo 1> data.txt  # STDOUT
#   echo 2> error.txt # STDERR

#   ls data 1> data.txt 2> error.txt # STDOUT STDERR

#Если надо, STDERR и STDOUT можно перенаправить в один и тот же файл, воспользовавшись &>:
#   ls data &> data-error.txt
#Устаревшая форма записи:
#   ls data > data-error.txt 2>&1
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   exec $> "$LOG_FILE"  # STDOUT и STDERR
#   exec 1> "$LOG_FILE"  # STDOUT
# -------------------------------------------------------------------

LOG_OPT_DEFAULT="11"
LOG_FILE_ADD=0
LOG_FILE_DT=0
#LOG_DT_FORMAT_DEFAULT='%Y%m%d%H%M%S'
LOG_DT_FORMAT_DEFAULT='%Y%m%d'

# --------------------------------
FORMAT='%Y-%m-%d %H:%M:%S %N'
# --------------------------------
loStandard=0
loTextFile=1
loAll=2
# --------------------------------
NOTSET=0
DEBUG=1
INFO=2
WARNING=3
ERROR=4
CRITICAL=5
DEBUGTEXT=11
BEGIN=21
END=22
PROCESS=23
TEXT=24
# --------------------------------
ctlsNOTSET=' '
ctlsDEBUG='D'
ctlsINFO='I'
ctlsWARNING='W'
ctlsERROR='E'
ctlsCRITICAL='C'
ctlsBEGIN='<'
ctlsEND='>'
ctlsPROCESS='P'
ctlsDEBUGTEXT='T'
ctlsTEXT=''

#-------------------------------------------------
# AddLog $loAll $NOTSET 'NOTSET'
# AddLog $loAll $DEBUG 'DEBUG'
# AddLog $loAll $INFO 'INFO'
# AddLog $loAll $WARNING 'WARNING'
# AddLog $loAll $ERROR 'ERROR'
# AddLog $loAll $CRITICAL 'CRITICAL'
# AddLog $loAll $DEBUGTEXT 'DEBUGTEXT'
# AddLog $loAll $BEGIN 'BEGIN'
# AddLog $loAll $END 'END'
# AddLog $loAll $PROCESS 'PROCESS'
# AddLog $loAll $TEXT 'TEXT'

#-------------------------------------------------
# AddLog $loAll $TEXT '--------------------------------------'
# str=''
# str=""
# result=$('')
# AddLog $loAll $TEXT 'str:'"$str"
# AddLog $loAll $TEXT 'result:'"$result"
# AddLog $loAll $TEXT '--------------------------------------'
#-------------------------------------------------

#--------------------------------------------------------------------------------
# FormatStr
#--------------------------------------------------------------------------------
function FormatStr { # Anamesh: str, Alevel: int, Amessage: str
#beginfunction
    # echo 'FormatStr...'
    Lnamesh=$1
    Llevel=$2
    Lmessage=$3

    printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1

    case "$Llevel" in
    $NOTSET)
        Linfo='NOTSET'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $DEBUG)
        Linfo='DEBUG'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $INFO)
        Linfo='INFO'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $WARNING)
        Linfo='WARNING'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $ERROR)
        Linfo='ERROR'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $CRITICAL)
        Linfo='CRITICAL'
        printf -v LOG_STR "%-s [%-15s] %2d %-10s %-s" "$asctime" "$Lnamesh" "$Llevel" "$Linfo" "$Lmessage"
        ;;
    $DEBUGTEXT)
        Linfo='DEBUGTEXT'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    $BEGIN)
        Linfo='BEGIN'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    $END)
        Linfo='END'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    $PROCESS)
        Linfo='PROCESS'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    $TEXT)
        Linfo='TEXT'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    *)
        Linfo=''
        ;;
    esac

}
#endfunction

#--------------------------------------------------
#
#--------------------------------------------------
function AddLog { # Aout: int, Alevel: int, Value: str
#beginfunction
    # echo 'AddLog...'
    Lout=$1
    Llevel=$2
    LValue=$3
    FormatStr "$LOG_SHFILENAME" "$Llevel" "$LValue"
    if [ $Lout -eq 0 ] ; then
        echo "$LOG_STR"
    elif [ $Lout -eq 1 ] ; then
        # echo "$LOG_STR" >&3
        echo "$LOG_STR" >> "$LOG_FILE"
    elif [ $Lout -eq 2 ] ; then
        # echo "$LOG_STR"
        # echo "$LOG_STR" >&3
        echo "$LOG_STR" | tee -a "$LOG_FILE"
    else
        echo 'ERROR' $Lout
    fi
}
#endfunction

#--------------------------------------------------
#
#--------------------------------------------------
function AddLogFile { # Aout: int, AFileName: str
#beginfunction
    # echo 'AddLogFile...'
    Lout=$1
    LFileName="$2"
    if [ -r "$LFileName" ] ; then
        # чтения файла построчно
        # while IFS= read -r LValue; do
        #     AddLog $Lout $TEXT "$LValue"
        # done < "$LFileName"

        # Использование дескриптора файла
        # Вы также можете предоставить ввод в цикл, используя дескриптор файла:
        while IFS= read -r -u9 LValue; do
            AddLog $Lout $TEXT "$LValue"
        done 9< "$LFileName"
        exec 9>&-
    else
        echo 'ERROR' "$LFileName"
    fi
}
#endfunction

#--------------------------------------------------------------------------------
# StartLogFile (AFileName: str):
#--------------------------------------------------------------------------------
function StartLogFile { # (AFileName: str):
#beginfunction
    # echo 'StartLogFile...'
    # Файл скрипта: каталог+имя+расширение
    SHFile="$1"
    # echo "SHFile=$SHFile"
    SHDir=$(ExtractFileDir "$SHFile")
    # echo "SHDir=$SHDir"
    SHFileName=$(ExtractFileName "$SHFile")
    # echo "SHFileName=$SHFileName"
    SHFileNameWithoutExt=$(ExtractFileNameWithoutExt "$SHFileName")
    # echo "SHFileNameWithoutExt=$SHFileNameWithoutExt"
    SHFileExt=$(ExtractFileExt "$SHFileName")
    # echo "SHFileExt=$SHFileExt"
    
    #------------------------------------------------------
    # Параметры журнала
    #------------------------------------------------------
    if [[ -z "$LOG_OPT" ]] ; then
        LOG_OPT=$2
        # echo "LOG_OPT=$LOG_OPT"
        if [[ -z "$LOG_OPT" ]] ; then
            LOG_OPT="$LOG_OPT_DEFAULT"
        fi
    fi
    # echo "LOG_OPT=$LOG_OPT"
    LOG_OPT_1=${LOG_OPT:0:1}
    # echo "LOG_OPT_1=$LOG_OPT_1"
    LOG_OPT_2=${LOG_OPT:1:1}
    # echo "LOG_OPT_2=$LOG_OPT_2"
    if [[ "$LOG_OPT_1" -eq '1' ]] ; then
        LOG_FILE_ADD=1
    else
        LOG_FILE_ADD=0
    fi
    if [[ "$LOG_OPT_2" -eq '1' ]] ; then
        LOG_FILE_DT=1
    else
        LOG_FILE_DT=0
    fi
    # echo "LOG_FILE_ADD=$LOG_FILE_ADD"
    # echo "LOG_FILE_DT=$LOG_FILE_DT"

    #------------------------------------------------------
    # Формат DT
    #------------------------------------------------------
    if [[ -z "$LOG_DT_FORMAT" ]] ; then
        LOG_DT_FORMAT=$3
        # echo "LOG_DT_FORMAT=$LOG_DT_FORMAT"
        if [[ -z "$LOG_DT_FORMAT" ]] ; then
            LOG_DT_FORMAT="$LOG_DT_FORMAT_DEFAULT"
        fi
    fi
    # echo "LOG_DT_FORMAT=$LOG_DT_FORMAT"

    #------------------------------------------------------
    # Файл скрипта: имя
    #------------------------------------------------------
    SHBASENAME=$(basename "$SHFile" .sh)
    # echo "LOG_SHBASENAME=$LOG_SHBASENAME"

    #------------------------------------------------------
    # Файл скрипта: имя+расширение
    #------------------------------------------------------
    SHFILENAME=$(basename "$SHFile")
    # echo "LOG_SHFILENAME=$LOG_SHFILENAME"
    #------------------------------------------------------

    #------------------------------------------------------
    # Каталог журналов
    #------------------------------------------------------
    if [[ -z "$LOG_DIR" ]] ; then
        LOG_DIR="$SHDir"
    fi
    # echo "LOG_DIR=$LOG_DIR"

    #------------------------------------------------------
    # Файл журнала: каталог+имя+расширение
    #------------------------------------------------------
    if [[ -z "$LOG_FILE" ]] ; then
        if [[ "$LOG_FILE_DT" -eq 1 ]] ; then
            DT=$(YYYYMMDDHHMMSS)
            DT=$(DateTime $LOG_DT_FORMAT)
            LOG_FILE="$LOG_DIR"/"$DT".log
        else
            LOG_FILE="$SHFile.log"
        fi
    else
        if [[ "$LOG_FILE_DT" -eq 1 ]] ; then
            DT=$(YYYYMMDDHHMMSS)
            LOG_FILE="$LOG_DIR"/"$DT"_"$LOG_FILE"
        else
            LOG_FILE="$LOG_DIR"/"$LOG_FILE"
        fi
    fi
    # echo "LOG_FILE=$LOG_FILE"
  
    #------------------------------------------------------
    # LOG_STR
    #------------------------------------------------------
    LOG_STR=""
    
    #------------------------------------------------------
    # Открытие файла журнала
    #------------------------------------------------------
    if [[ "$LOG_FILE_ADD" -eq 1 ]] ; then
        LFileName="$LOG_FILE"
        if [ -r "$LFileName" ] ; then
            # echo "$LFileName"
            rm "$LFileName"
        fi
        touch "$LFileName"
    fi
    exec 3>>"$LFileName"

    # -------------------------------------------------------------------
    AddLog $loAll $INFO "Старт: $(date +"$FORMAT")"
    # -------------------------------------------------------------------
}
#endfunction

#--------------------------------------------------------------------------------
# StopLogFile ():
#--------------------------------------------------------------------------------
function StopLogFile { # ():
#beginfunction
    # echo 'StopLogFile...'
    # -------------------------------------------------------------------
    AddLog $loAll $INFO "Стоп: $(date +"$FORMAT")"
    # -------------------------------------------------------------------
    exec 3>&-
}
#endfunction

#:Exit
