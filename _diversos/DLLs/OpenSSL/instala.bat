ECHO *** Copiando as DLLs ***
if NOT EXIST %windir%\System32\capicom.dll copy libeay32.dll %windir%\System32
if NOT EXIST %windir%\System32\msxml5.dll  copy ssleay32.dll  %windir%\System32
ECHO *** Registrando as DLLs ***
regsvr32 %windir%\System32\libeay32.dll /s
regsvr32 %windir%\System32\ssleay32.dll /s
pause
