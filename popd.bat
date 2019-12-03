@echo off
if "%PUSHD_COUNT%" == "" (
    echo popd: directory stack empty
    goto :eof
)
set /a PUSHD_COUNT=%PUSHD_COUNT-1
set TMP=PUSHD%PUSHD_COUNT%

set TMPFILE=%RANDOM%.tmp

setlocal enabledelayedexpansion
if "!%TMP%!" == "" (
    echo popd: directory stack empty
    goto :eof
)
set TMPDIR=!%TMP%!
rem endlocal will erase the chdir and therefore 
rem saving the file in a temp file
echo %TMPDIR% > %TMPFILE%
endlocal

rem reading the directory from a file
set /p TMP=<%TMPFILE%
del /f %TMPFILE%
chdir /d "%TMP%"

set PUSHD%PUSHD_COUNT%=
