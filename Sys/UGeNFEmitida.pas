unit UGeNFEmitida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, RxDBComb, rxToolEdit;

type
  TDestinatarioNF = record
    RazaoSocial : String;
    CpfCnpj     : String;
  end;

  TfrmGeNFEmitida = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    IbDtstTabelaNFE_DESTINATARIO: TIBStringField;
    IbDtstTabelaNFE_DESTINATARIO_RAZAO: TIBStringField;
    IbDtstTabelaNFE_DESTINATARIO_CNPJ: TIBStringField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaMODELO: TSmallintField;
    IbDtstTabelaDATAEMISSAO: TDateField;
    IbDtstTabelaHORAEMISSAO: TTimeField;
    IbDtstTabelaVERSAO: TSmallintField;
    IbDtstTabelaRECIBO: TIBStringField;
    IbDtstTabelaPROTOCOLO: TIBStringField;
    IbDtstTabelaCHAVE: TIBStringField;
    IbDtstTabelaANOVENDA: TSmallintField;
    IbDtstTabelaNUMVENDA: TIntegerField;
    IbDtstTabelaANOCOMPRA: TSmallintField;
    IbDtstTabelaNUMCOMPRA: TIntegerField;
    IbDtstTabelaXML_FILENAME: TIBStringField;
    IbDtstTabelaXML_FILE: TMemoField;
    IbDtstTabelaNFE_VALOR_TOTAL: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNFE_DESTINATARIO_CNPJGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeNFEmitida: TfrmGeNFEmitida;

  function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie : String; var pNumero, pModelo : Integer;
    var pDestinatario : TDestinatarioNF) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie : String; var pNumero, pModelo : Integer;
  var pDestinatario : TDestinatarioNF) : Boolean;
var
  AForm : TfrmGeNFEmitida;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TfrmGeNFEmitida.Create(AOnwer);
  try
    AForm.WhereAdditional := 'nf.empresa = ' + QuotedStr(pEmpresa) + ' and ' +
      'nf.dataemissao between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date) );

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, pEmpresa);

    if Result then
    begin
      pSerie  := AForm.IbDtstTabelaSERIE.Value;
      pNumero := AForm.IbDtstTabelaNUMERO.Value;
      pModelo := AForm.IbDtstTabelaMODELO.Value;

      pDestinatario.RazaoSocial := AForm.IbDtstTabelaNFE_DESTINATARIO_RAZAO.Value;
      pDestinatario.CpfCnpj     := AForm.IbDtstTabelaNFE_DESTINATARIO_CNPJ.Value;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeNFEmitida.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := EmptyStr;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '###0000000';
  NomeTabela      := 'TBNFE_ENVIADA';
  CampoCodigo     := 'nf.numero';
  CampoDescricao  := 'nf.chave';
  CampoOrdenacao  := 'nf.empresa, nf.serie, nf.numero';
  WhereAdditional := 'nf.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  tbsCadastro.TabVisible := False;

  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
end;

procedure TfrmGeNFEmitida.IbDtstTabelaNFE_DESTINATARIO_CNPJGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if StrIsCNPJ(Sender.AsString) then
      Text := StrFormatarCnpj(Sender.AsString)
    else
    if StrIsCPF(Sender.AsString) then
      Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeNFEmitida.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'nf.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeNFEmitida', TfrmGeNFEmitida);

end.
