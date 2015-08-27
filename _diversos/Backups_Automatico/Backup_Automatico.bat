for /F "tokens=1-3 delims=/" %%A in ('echo %date%') do (set ymd=%%A-%%B-%%C)
for /F "tokens=1-2 delims=:" %%a in ('time /t') do (set ymd=%ymd%_%%ah%%b)
rem pastabackuptmpsys
rem stringbancosys
rem nomearquivosys
rem pastabackupfinalsys
rem pastarelatoriossys
rem googledrivesys

set pastabackuptmpsys=D:\Projetos\ASS\SGE\_diversos\Backups_Automatico
set stringbancosys=localhost:DIMENSAO
set nomearquivosys=TESTE
set pastabackupfinalsys=D:\Projetos\ASS\SGE\_diversos\Backups_Automatico\Bkp
set pastarelatoriossys=D:\Projetos\ASS\SGE\_diversos\Backups_Automatico\Log
set pastafirebird=C:\Program Files (x86)\Firebird\Firebird_2_5\bin
set pastazip7=C:\Program Files\7-Zip
set googledrivesys=C:\Users\Isaque\Google Drive\_Masterdados

"%pastafirebird%\gbak.exe" -b -z -v "%stringbancosys%" "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.fbk" -Y "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log" -user SYSDBA -password masterkey

"%pastazip7%\7z.exe" a -t7z -mx9 "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7zAgil" "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.*"

copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7zAgil" "%pastabackupfinalsys%"
copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log" "%pastarelatoriossys%"

copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z" "%googledrivesys%"

del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log"
del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7zAgil"
