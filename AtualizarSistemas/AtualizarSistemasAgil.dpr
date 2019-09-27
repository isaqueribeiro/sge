program AtualizarSistemasAgil;

uses
  Vcl.Forms,
  UGrAtualizarSistemas in 'UGrAtualizarSistemas.pas' {FrmAtualizarSistemas},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  UFuncoes in '..\Sys\lib\UFuncoes.pas',
  UInfoVersao in '..\Sys\lib\UInfoVersao.pas',
  UPersonalizaEmpresa in '..\Sys\lib\UPersonalizaEmpresa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Atualizar Sistemas Ágil';
  Application.CreateForm(TFrmAtualizarSistemas, FrmAtualizarSistemas);
  Application.Run;
end.
