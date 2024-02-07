@echo off
    setlocal enableextensions disabledelayedexpansion

    call :test arg1 arg2 arg3
    call :test2 arg4 arg5 arg6
    call :testErrorlevel && echo no errorlevel || echo errorlevel raised

    goto :eof

:test
:test2
    echo calling function! %0
    library.cmd %*

:testErrorlevel
    echo calling function!!!! %0
    library.cmd
