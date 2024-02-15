@echo off
rem -------------------------------------------------------------------
rem LYRFileUtils.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem ФУНКЦИИ
rem     :LYRFileUtils
rem -------------------------------------------------------------------

:begin
rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem :LYRFileUtils
rem --------------------------------------------------------------------------------
:LYRFileUtils
rem beginfunction
echo ---------------------------------------------------------------
echo LYRFileUtils ...
echo ---------------------------------------------------------------
exit /b 0
rem endfunction

rem ===================================================================
#--------------------------------------------------------------------------------
# ExtractFileDir (APath: str) -> str:
#--------------------------------------------------------------------------------
function ExtractFileDir { # (APath: str) -> str:
#beginfunction
    LPath=$1
    LDir=${LPath%/*}
    # echo $(( $LDir ))
    echo $LDir
}
#endfunction

#--------------------------------------------------------------------------------
# ExtractFileName (APath: str) -> str:
#--------------------------------------------------------------------------------
function ExtractFileName { #(APath: str) -> str:
#beginfunction
    LPath=$1
    LFileName=${LPath##*/}
    # echo $(( $LFileName ))
    echo $LFileName
}
#endfunction

#-------------------------------------------------------------------------------
# ExtractFileNameWithoutExt (AFileName: str) -> str:
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt { #(AFileName: str) -> str:
#beginfunction
    LFileName=$1
    LResult=${LFileName%%.*}
    # echo $(( $LResult ))
    echo $LResult
}
#endfunction

#--------------------------------------------------------------------------------
# ExtractFileExt (AFileName: str) -> str:
#--------------------------------------------------------------------------------
function ExtractFileExt { #(AFileName: str) -> str:
#beginfunction
    LFileName=$1
    LFileExt=${LFileName#*.}
    # echo $(( $LFileExt ))
    echo $LFileExt
}
#endfunction

#:Exit
