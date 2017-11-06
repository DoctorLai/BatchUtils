@echo off
rem Example Msgbox "Hello World!"
rem https://helloacm.com/a-simple-msgbox-command-line-utility-in-windows-batch/

set TMPFILE="%~dp0%RANDOM%.vbs"
if not [%1]==[] (	
	echo MsgBox %1 > %TMPFILE%
	"cscript.exe" //Nologo %TMPFILE%
	del /f %TMPFILE%
)
