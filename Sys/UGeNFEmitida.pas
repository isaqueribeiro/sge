unit UGeNFEmitida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TDestinatarioTipo = (dtNull = -1, dtFornecedor = 0, dtCliente = 1);

  TDestinatarioNF = record
    Codigo      : Integer;
    RazaoSocial : String;
    CpfCnpj     : String;
    InsEstadual : String;
    UF          : String;
    Tipo        : TDestinatarioTipo;
  end;

  TfrmGeNFEmitida = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
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
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    IbDtstTabelaNFE_DESTINATARIO_CODIGO: TIntegerField;
    IbDtstTabelaCANCELADA: TSmallintField;
    lblNotaCancelada: TLabel;
    IbDtstTabelaNFE_DESTINATARIO_INSCEST: TIBStringField;
    IbDtstTabelaNFE_DESTINATARIO_UF: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNFE_DESTINATARIO_CNPJGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    fSemNFComplementar : Boolean;
    fEmpresa : String;
  public
    { Public declarations }
  end;

var
  frmGeNFEmitida: TfrmGeNFEmitida;

  function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie, pChave : String;
    var pNumero, pModelo : Integer;
    var pDataEmissao : TDateTime;
    var pDestinatario : TDestinatarioNF;
    var MovimentoAno, MovimentoCodigo : Integer) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarNFe(const AOnwer : TComponent; var pEmpresa, pSerie, pChave : String;
  var pNumero, pModelo : Integer;
  var pDataEmissao  : TDateTime;
  var pDestinatario : TDestinatarioNF;
  var MovimentoAno, MovimentoCodigo : Integer) : Boolean;
var
  AForm : TfrmGeNFEmitida;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TfrmGeNFEmitida.Create(AOnwer);
  try
    AForm.tbsCadastro.TabVisible := False;
    AForm.fEmpresa               := pEmpresa;
    AForm.fSemNFComplementar     := True;

    AForm.WhereAdditional := 'nf.empresa = ' + QuotedStr(pEmpresa) + ' and ' +
      'nf.dataemissao between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date) );

    if AForm.fSemNFComplementar then
      AForm.WhereAdditional := AForm.WhereAdditional +
        ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
        ' and (coalesce(nf.cancelada, 0) = 0)';

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, pEmpresa);

    if Result then
    begin
      pSerie  := AForm.IbDtstTabelaSERIE.Value;
      pChave  := AForm.IbDtstTabelaCHAVE.AsString;
      pNumero := AForm.IbDtstTabelaNUMERO.Value;
      pModelo := AForm.IbDtstTabelaMODELO.Value;
      pDataEmissao := AForm.IbDtstTabelaDATAEMISSAO.AsDateTime;

      pDestinatario.Codigo      := AForm.IbDtstTabelaNFE_DESTINATARIO_CODIGO.Value;
      pDestinatario.RazaoSocial := AForm.IbDtstTabelaNFE_DESTINATARIO_RAZAO.Value;
      pDestinatario.CpfCnpj     := AForm.IbDtstTabelaNFE_DESTINATARIO_CNPJ.Value;
      pDestinatario.InsEstadual := AForm.IbDtstTabelaNFE_DESTINATARIO_INSCEST.Value;
      pDestinatario.UF          := AForm.IbDtstTabelaNFE_DESTINATARIO_UF.Value;

      if (AForm.IbDtstTabelaANOVENDA.AsInteger > 0) then
      begin
        pDestinatario.Tipo := dtCliente;
        MovimentoAno       := AForm.IbDtstTabelaANOVENDA.Value;
        MovimentoCodigo    := AForm.IbDtstTabelaNUMVENDA.Value;
      end
      else
      if (AForm.IbDtstTabelaANOCOMPRA.AsInteger > 0) then
      begin
        pDestinatario.Tipo := dtFornecedor;
        MovimentoAno       := AForm.IbDtstTabelaANOCOMPRA.Value;
        MovimentoCodigo    := AForm.IbDtstTabelaNUMCOMPRA.Value;
      end
      else
        pDestinatario.Tipo := dtNull;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeNFEmitida.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Notas Fiscais Canceladas
    if ( IbDtstTabelaCANCELADA.AsInteger = 1 ) then
      dbgDados.Canvas.Font.Color := lblNotaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeNFEmitida.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID           := EmptyStr;
  ControlFirstEdit   := dbCodigo;
  fEmpresa           := gUsuarioLogado.Empresa;
  fSemNFComplementar := False;

  DisplayFormatCodigo := '###0000000';
  NomeTabela      := 'TBNFE_ENVIADA';
  CampoCodigo     := 'nf.numero';
  CampoDescricao  := 'nf.chave';
  CampoOrdenacao  := 'nf.empresa, nf.serie, nf.numero';
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
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
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if fSemNFComplementar then
    WhereAdditional := WhereAdditional +
      ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
      ' and (coalesce(nf.cancelada, 0) = 0)';

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeNFEmitida', TfrmGeNFEmitida);

end.
