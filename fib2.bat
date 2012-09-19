@echo off
:: Print Fibonacci Numbers
:: http://acm.zhihua-lai.com

title Fibonacci Numbers

setlocal enableextensions enabledelayedexpansion

set n=15
set a=1
set b=1

set s= %a% %b%

:loop
	if !n! equ 0 goto print
	set /a n-=1
	set /a c=a+b
	set s=!s! !c!
	set /a a=b
	set /a b=c
	goto loop

:print
	echo !s!
	echo.

endlocal

