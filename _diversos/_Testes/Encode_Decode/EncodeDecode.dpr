program EncodeDecode;

uses
  Vcl.Forms,
  UEncodeDecode in 'UEncodeDecode.pas' {FormEncodeDecode};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEncodeDecode, FormEncodeDecode);
  Application.Run;
end.
