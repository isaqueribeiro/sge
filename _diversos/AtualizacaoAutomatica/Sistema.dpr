program Sistema;

uses
  Vcl.Forms,
  uAtualizadorAutomatico in 'uAtualizadorAutomatico.pas' {fAtualizadorAutomatico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfAtualizadorAutomatico, fAtualizadorAutomatico);
  Application.Run;
end.
