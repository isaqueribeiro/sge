program Atualizar;

uses
  MidasLIB,
  Forms,
  UPD_Main in 'UPD_Main.pas' {FrmMain},
  UPD_Functions in 'UPD_Functions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Local Update';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
