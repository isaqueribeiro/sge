program Firebase;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {Form1},
  Firebase.Auth in 'Firebase\Firebase.Auth.pas',
  Firebase.Interfaces in 'Firebase\Firebase.Interfaces.pas',
  Firebase.Request in 'Firebase\Firebase.Request.pas',
  Firebase.Response in 'Firebase\Firebase.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
