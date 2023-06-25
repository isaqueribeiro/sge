unit View.ReaderOFX;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IOUtils,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TViewReaderOFX = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtArquivoOFX: TEdit;
    btnSelecionar: TButton;
    opdArquivoOFX: TOpenDialog;
    mmConteudo: TMemo;
    btnProcessar: TButton;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewReaderOFX: TViewReaderOFX;

implementation

uses
  Service.ReaderOFX;

{$R *.dfm}

procedure TViewReaderOFX.btnProcessarClick(Sender: TObject);
var
  aReader : TReaderOFX;
  I : Integer;
begin
  aReader := TReaderOFX.Create(Self);
  try
    if FileExists(Trim(edtArquivoOFX.Text)) then
    begin
      aReader.FileOFX := Trim(edtArquivoOFX.Text);
      aReader.Process;

      mmConteudo.Lines.BeginUpdate;
      mmConteudo.Lines.Clear;

      mmConteudo.Lines.Add('Banco : ' + aReader.BankID.ToString);
      mmConteudo.Lines.Add('Conta : ' + aReader.AccountID);
      mmConteudo.Lines.Add('Tipo  : ' + aReader.AccountType);
      mmConteudo.Lines.Add('======');
      mmConteudo.Lines.Add('Período  : ' + FormatDateTime('dd/mm/yyyy', aReader.InitialDate) + ' à ' + FormatDateTime('dd/mm/yyyy', aReader.FinalDate));
      mmConteudo.Lines.Add('======');
      mmConteudo.Lines.Add('Saldo Inicial  : ' + FormatFloat(',0.00', aReader.InitialBalance));
      mmConteudo.Lines.Add('Saldo Final    : ' + FormatFloat(',0.00', aReader.FinalBalance));
      mmConteudo.Lines.Add('------');

      for I := 0 to Pred(aReader.Count) do
      begin
        mmConteudo.Lines.Add(
          aReader.Get(i).Desc + ' ' +
          FloatToStr(aReader.Get(i).Value) + ' ' +
          aReader.Get(i).MovType + ' ' +
          dateToStr(aReader.Get(i).MovDate) + ' ' +
          aReader.Get(i).ID + ' ' +
          aReader.Get(i).Document + ' '
        );
      end;

      mmConteudo.Lines.EndUpdate;
    end;
  finally
    FreeAndNil(aReader);
  end;
end;

procedure TViewReaderOFX.btnSelecionarClick(Sender: TObject);
begin
  opdArquivoOFX.InitialDir := TPath.GetDownloadsPath;
  if opdArquivoOFX.Execute(Handle) then
    edtArquivoOFX.Text := opdArquivoOFX.FileName;
end;

end.
