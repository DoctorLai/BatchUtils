@echo off
:: http://www.zhihua-lai.com/acm

setlocal
if [%1] equ [] goto help

:work
  set supermd=%1
  if "%supermd%"=="(" goto error
  if "%supermd%"==")" goto error
  mkdir %supermd%
  echo Making "%supermd%"
  shift
  if "%1"=="" goto end
  if "%1"=="(" goto signin
  if "%1"==")" goto signout
  goto work
  
:signin
  cd "%supermd%"
  shift
  goto work
  
:signout
  cd ..
  shift
  goto work
  
:help
  echo.
  echo Usage:%0 a b ( c d e ) f g ( h i )
  echo.
  goto end
  
:error
  echo.
  echo Error!
  echo.
  
:end

endlocal