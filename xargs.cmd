@echo off
:: example:   git branch | grep -v "develop" | xargs git branch -D
:: https://helloacm.com/simple-xargs-batch-implementation-for-windows/
setlocal

set args=%1
shift
:start
    if [%1] == [] goto start1
    set args=%args% %1
    shift
    goto start

:start1
    for /F "tokens=*" %%a in ('more') do (
        %args% %%a
    )
