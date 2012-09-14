@echo off
:: Print Fibonacci Numbers
:: http://acm.zhihua-lai.com

title Fibonacci Numbers

setlocal enableextensions enabledelayedexpansion
set n=15

set a=1
set b=1

set s= %a% %b%
for /l %%g in (1,1,%n%) do (
	set /a c=a+b
	set s=!s! !c!
	set /a a=b
	set /a b=c
)

echo !s!
endlocal