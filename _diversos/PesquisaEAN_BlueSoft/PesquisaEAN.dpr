program PesquisaEAN;

uses
  Vcl.Forms,
  untPesquisaEAN in 'untPesquisaEAN.pas' {frmPesquisaEAN};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPesquisaEAN, frmPesquisaEAN);
  Application.Run;
end.
