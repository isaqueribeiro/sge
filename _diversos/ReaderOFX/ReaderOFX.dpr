program ReaderOFX;

uses
  Vcl.Forms,
  View.ReaderOFX in 'View.ReaderOFX.pas' {ViewReaderOFX},
  Service.ReaderOFX in 'Service.ReaderOFX.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewReaderOFX, ViewReaderOFX);
  Application.Run;
end.
