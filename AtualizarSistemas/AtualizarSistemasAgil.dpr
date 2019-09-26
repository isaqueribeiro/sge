program AtualizarSistemasAgil;

uses
  Vcl.Forms,
  UGrAtualizarSistemas in 'UGrAtualizarSistemas.pas' {FrmAtualizarSistemas},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Atualizar Sistemas Ágil';
  Application.CreateForm(TFrmAtualizarSistemas, FrmAtualizarSistemas);
  Application.Run;
end.
