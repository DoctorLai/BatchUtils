@Echo Off
Rem http://acm.zhihua-lai.com, 25-May-2012

If [%1]==[] goto USAGE

:LOOP
  If [%1]==[] goto END

:CHECK
  SetLocal
    Set Paths=.;%PATH%
    For %%E In (%PATHEXT%) Do (                  
      For %%I In ("%~n1%%E") Do (
        If NOT "%%~$Paths:I"=="" Echo %%~$Paths:I
      )
    )
  EndLocal
  Shift
  goto LOOP

:USAGE
  echo which [Executable1] [Executable2] ..

:END