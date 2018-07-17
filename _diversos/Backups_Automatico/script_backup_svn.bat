@echo on

rem ONDE OS BACKUPS SERAO ARMAZENADOS
set path_backup=C:\SVN_BACKUP

rem REPOSITORIO SVN - EXEMPLO: C:\svn\data\repositories\reponamehere
set path_to_repository=C:\SVN_HAB

rem GERAR DATA/HORA PARA O BACKUP
for /F "tokens=1-3 delims=/" %%A in ('echo %date%') do (set ano=%%C)
for /F "tokens=1-3 delims=/" %%A in ('echo %date%') do (set ymd=%%C-%%B-%%A)
for /F "tokens=1-2 delims=:" %%a in ('time /t') do (set ymd=%ymd%_%%ah%%b)

rem NOME DO BACKUP
set dump_name=bkpSVN_%ymd%

set folder_name_backup=%ano%
set path_backup=%path_backup%\%folder_name_backup%
set path_backup_dump=%path_backup%\
set steps=2

echo.
echo [Passo 1 de %steps%] Criando pastas de backup...
mkdir %path_backup%
mkdir %path_backup_dump%
echo [Passo 1 de %steps%] Pastas de backups criadas.

echo [Passo 2 de %steps%] Criando arquivo Dump...
svnadmin dump %path_to_repository% | "%ProgramFiles%\7-Zip\7z.exe" a %path_backup_dump%\%dump_name%.7z -si%dump_name%.svn
echo [Passo 2 de %steps%] Arquivo Dump criado.

echo.
echo Backup SVN finalizado com sucesso.
pause