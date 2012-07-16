@echo off
  
REM An Example Batch Program to Calculate 355/113.
REM OS: 2000, XP, 7 and after
REM http://acm.zhihua-lai.com
   
    set /a a=355
    set /a b=113
    set /a c=100
  
    set /a d=a/b
    set o=%a%/%b%=%d%.
  
:work   
    set /a a=(a-d*b)*10
    if "%a%"=="0" goto clean_up
    set /a d=a/b
    set /a c=c-1
    if "%c%"=="0" goto clean_up
    set o=%o%%d%
 
    goto work
   
:clean_up
    echo %o%
    set o=
    set a=
    set b=
    set c=
    set d=