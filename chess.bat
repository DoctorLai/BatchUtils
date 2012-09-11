@echo off
:: chess.bat
:: acm.zhihua-lai.com
title Chess Board
mode con cols=40 lines=20
cls

setlocal enableextensions enabledelayedexpansion 
for %%i in (1 2 3 4 5 6 7 8) do (
	set row=
	for %%j in (1  2 3 4 5 6 7 8) do (
		set /a s=(%%i+%%j^)%%2
		if !s! EQU 0 (
			set row=!row!¨€
		) else (
			set row=!row! 
		)
	)
	echo !row!
)
endlocal
exit /b