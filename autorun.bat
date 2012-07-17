@echo off
rem A Batch Script to Create Folder 'autorun.inf'
rem This can prevent autorun.inf virus.
rem Free to use, put at startup recommended.
rem by Zhihua Lai, 2 - Dec - 2008
 
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do call :sub %%i
goto end
 
:sub
    echo Checking %1: ...
    if not exist %1:\nul goto notfound
    if exist %1:\autorun.inf\nul goto already
    if exist %1:\autorun.inf goto clean
    goto done
    
:clean
    echo removing File %1:\autorun.inf ...
    attrib -r -a -s -h %1:\autorun.inf
    del %1:\autorun.inf
 
:done
    echo Making directory '%1:\autorun.inf' ...
    mkdir %1:\autorun.inf
 
:already
    echo Attributing directory '%1:\autorun.inf' ...
    attrib +r +a +s +h %1:\autorun.inf
    goto end
 
:notfound
    echo Skipping %1: ...
 
:end