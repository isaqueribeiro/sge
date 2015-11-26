unit UPrinterCupom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBDatabase;

type
  TfrmPrinterCupom = class(TForm)
    lblEmpresa: TLabel;
    edEmpresa: TEdit;
    lblCliente: TLabel;
    edCliente: TEdit;
    lblDataHora: TLabel;
    edDataHora: TEdit;
    lblAno: TLabel;
    edAno: TEdit;
    lblControle: TLabel;
    edControle: TEdit;
    btnImprimirCupom: TButton;
    edBlocoImpressaoCupom: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirCupomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarParametros;
    procedure ImprimirEFechar;
  end;

var
  frmPrinterCupom: TfrmPrinterCupom;

  procedure ImprimiCupom;

implementation

{$R *.dfm}

uses UConstantesDGE, UDMBusiness, UDMRecursos, UFuncoes, UDMNFe;

procedure ImprimiCupom;
var
  AForm : TfrmPrinterCupom;
begin
  AForm := TfrmPrinterCupom.Create(Application);
  try
    AForm.CarregarParametros;
    AForm.ImprimirEFechar;
  finally
    AForm.Free;
  end;
end;
procedure TfrmPrinterCupom.btnImprimirCupomClick(Sender: TObject);
begin
  DMNFe.ImprimirCupomNaoFiscal(edEmpresa.Text
    , StrToIntDef(Trim(edCliente.Text), 0)
    , edDataHora.Text
    , StrToIntDef(Trim(edAno.Text), 0)
    , StrToIntDef(Trim(edControle.Text), 0)
    , TBlocoImpressaoCupom(edBlocoImpressaoCupom.ItemIndex));
  Self.Close;
end;

procedure TfrmPrinterCupom.CarregarParametros;
begin
  edEmpresa.Text  := StringReplace(Trim(ParamStr(1)), '"', '', [rfReplaceAll]);
  edCliente.Text  := StringReplace(Trim(ParamStr(2)), '"', '', [rfReplaceAll]);
  edAno.Text      := StringReplace(Trim(ParamStr(3)), '"', '', [rfReplaceAll]);
  edControle.Text := StringReplace(Trim(ParamStr(4)), '"', '', [rfReplaceAll]);
  edBlocoImpressaoCupom.ItemIndex := StrToIntDef(StringReplace(Trim(ParamStr(5)), '"', '', [rfReplaceAll]), 0);

  edEmpresa.Enabled  := (Trim(edEmpresa.Text) = EmptyStr);
  edCliente.Enabled  := (Trim(edCliente.Text) = EmptyStr);
  edAno.Enabled      := (Trim(edAno.Text) = EmptyStr);
  edControle.Enabled := (Trim(edControle.Text) = EmptyStr);
end;

procedure TfrmPrinterCupom.FormCreate(Sender: TObject);
begin
  Self.Tag := SISTEMA_PDV;

  gSistema.Codigo := Self.Tag;
  gSistema.Nome   := Self.Caption;

  Self.Caption    := Application.Title;
  edDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;

procedure TfrmPrinterCupom.ImprimirEFechar;
begin
  DMNFe.ImprimirCupomNaoFiscal(edEmpresa.Text
    , StrToIntDef(Trim(edCliente.Text), 0)
    , edDataHora.Text
    , StrToIntDef(Trim(edAno.Text), 0)
    , StrToIntDef(Trim(edControle.Text), 0)
    , TBlocoImpressaoCupom(edBlocoImpressaoCupom.ItemIndex));
end;

end.
