program GerarLicenca;

uses
  Forms,
  UGrGerarLicenca in 'UGrGerarLicenca.pas' {FrmGrGerarLicenca},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerar Licença de Uso';
  Application.CreateForm(TFrmGrGerarLicenca, FrmGrGerarLicenca);
  Application.Run;
end.
