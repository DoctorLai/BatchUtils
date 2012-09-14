@echo off
:: Print Fibonacci Numbers
:: http://acm.zhihua-lai.com

title Fibonacci Numbers
setlocal enableextensions 
setlocal enabledelayedexpansion

set /a a=1
set /a maxn=17
(set s=)
for /l %%g in (1,1,%maxn%) do (
	call :fib a 1 %%g
	set s=!s! !a!
	set /a a=1
)
echo !s!
goto eof

:fib
set /a n1=%1
set /a n2=%2
set /a n3=n1+n2
set /a nn=%3-1

if %nn% gtr 0 (
	:: recursive call
	call :fib !n2! !n3! !nn!
)
:: return value to the first parameter
set %1=%n1%

:eof

endlocal