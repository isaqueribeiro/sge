program GerarLicenca;

uses
  Forms,
  UGrGerarLicenca in 'UGrGerarLicenca.pas' {FrmGrGerarLicenca},
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  Firebase.Auth in 'Firebase4Delphi\sources\Firebase.Auth.pas',
  Firebase.Database in 'Firebase4Delphi\sources\Firebase.Database.pas',
  Firebase.Interfaces in 'Firebase4Delphi\sources\Firebase.Interfaces.pas',
  Firebase.Request in 'Firebase4Delphi\sources\Firebase.Request.pas',
  Firebase.Response in 'Firebase4Delphi\sources\Firebase.Response.pas',
  Model.Usuario in 'Model\Model.Usuario.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller.Factory in 'Controller\Controller.Factory.pas',
  Controller.Usuario in 'Controller\Controller.Usuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerar Licença de Uso';
  Application.CreateForm(TFrmGrGerarLicenca, FrmGrGerarLicenca);
  Application.Run;
end.
