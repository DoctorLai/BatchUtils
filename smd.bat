@echo off
rem Programmed by Zhihua Lai, long long time ago....
rem A Utility to make lots of directories!!

if "%1"=="" goto help

:work
  set supermd=%1
  if "%supermd%"=="(" goto error
  if "%supermd%"==")" goto error
  mkdir %supermd%
  echo Making %supermd%
  shift
  if "%1"=="" goto end
  if "%1"=="(" goto signin
  if "%1"==")" goto signout
  goto work
  
:signin
  cd %supermd%
  shift
  goto work
  
:signout
  cd ..
  shift
  goto work
  
:help
  echo.
  echo Usage:%0 a b ( c d e ) f g ( h i )
  echo Made by Zhihua Lai,2003.10.30
  echo.
  goto end
  
:error
  echo.
  echo Error!
  echo.
  
:end
  set supermd=
