@echo off
:: print working directory

if "%cd%" == "" (
  cd
  goto :eof
)
cd
