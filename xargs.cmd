@echo off
:: example:   git branch | grep -v "develop" | xargs git branch -D
:: example    xargs -a input.txt echo
:: https://helloacm.com/simple-xargs-batch-implementation-for-windows/
setlocal enabledelayedexpansion

set args=
set file='more'

:: read from file
if "%1" == "-a" (
    if "%2" == "" (
        echo Correct Usage: %0 -a Input.txt command
        goto end
    )
    set file=%2
    shift
    shift
    goto start
)

:: read from stdin
set args=%1
shift

:start
    if [%1] == [] goto start1
    set args=%args% %1
    shift
    goto start

:start1
    for /F "tokens=*" %%a in (!file!) do (
        %args% %%a
    )

:end
