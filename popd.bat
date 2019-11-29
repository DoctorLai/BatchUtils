@echo off
if "%PUSHD_COUNT%" == "" (
    echo popd: directory stack empty
    goto :eof
)
set /a PUSHD_COUNT=%PUSHD_COUNT-1
set TMP=PUSHD%PUSHD_COUNT%

setlocal enabledelayedexpansion
if "!%TMP%!" == "" (
    echo popd: directory stack empty
    goto :eof
)
set TMP="!%TMP%!"
cd /d %TMP%
endlocal

set PUSHD%PUSHD_COUNT%=
