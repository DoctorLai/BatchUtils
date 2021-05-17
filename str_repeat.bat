@echo off
rem https://helloacm.com/str-repeat-implementation-using-windows-batch-script/

setlocal enableDelayedExpansion
 
if [%1]==[] goto help
if [%2]==[] goto help
 
set s=
for /L %%v in (1,1,%1) do (
        set s=!s!%~2
)
echo !s!
 
goto :eof
 
:help
        echo Usage %0 count pattern
