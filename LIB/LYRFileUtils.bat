#!/bin/bash
# -----------------------------------------------
# LYRFileUtils.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

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
