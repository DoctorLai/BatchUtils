@echo off
if [%1] == [] (
    echo pushd: no other directory
    goto :eof
)
set TMP=%cd%
if [%TMP%] == [] (
    for /f %%f in ('cd') do (
        set TMP=%%f
    )
)
cd /d "%1" 2> nul
if [%errorlevel%] == [1] (
    echo pushd: %1: No such file or directory
    goto :eof
)
if [%PUSHD_COUNT%] == [] (
    set PUSHD_COUNT=0
)
set PUSHD%PUSHD_COUNT%=%TMP%
set /a PUSHD_COUNT=%PUSHD_COUNT+1
