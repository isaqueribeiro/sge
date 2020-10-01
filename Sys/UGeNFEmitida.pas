unit UGeNFEmitida;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblNotaCancelada: TLabel;
    fdQryTabelaNFE_DESTINATARIO: TStringField;
    fdQryTabelaNFE_DESTINATARIO_CODIGO: TIntegerField;
    fdQryTabelaNFE_DESTINATARIO_RAZAO: TStringField;
    fdQryTabelaNFE_DESTINATARIO_CNPJ: TStringField;
    fdQryTabelaNFE_DESTINATARIO_INSCEST: TStringField;
    fdQryTabelaNFE_DESTINATARIO_UF: TStringField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaSERIE: TStringField;
    fdQryTabelaNUMERO: TIntegerField;
    fdQryTabelaMODELO: TSmallintField;
    fdQryTabelaDATAEMISSAO: TDateField;
    fdQryTabelaHORAEMISSAO: TTimeField;
    fdQryTabelaVERSAO: TSmallintField;
    fdQryTabelaRECIBO: TStringField;
    fdQryTabelaPROTOCOLO: TStringField;
    fdQryTabelaCHAVE: TStringField;
    fdQryTabelaANOVENDA: TSmallintField;
    fdQryTabelaNUMVENDA: TIntegerField;
    fdQryTabelaANOCOMPRA: TSmallintField;
    fdQryTabelaNUMCOMPRA: TIntegerField;
    fdQryTabelaXML_FILENAME: TStringField;
    fdQryTabelaXML_FILE: TMemoField;
    fdQryTabelaCANCELADA: TSmallintField;
    fdQryTabelaNFE_VALOR_TOTAL: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaNFE_DESTINATARIO_CNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    fSemNFComplementar : Boolean;
    fEmpresa : String;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBNFE_ENVIADA
  - TBVENDAS
  - TBCLIENTE
  - TBCOMPRAS
  - TBFORNECEDOR

  Views:

  Procedures:

*)

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
//        ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
        ' and ((coalesce(nf.anovenda, nf.anocompra, 0) > 0) or (nf.lote_ano = 0))' +  // Voltar ao código anterior em 12/2015
        ' and (coalesce(nf.cancelada, 0) = 0)';

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, pEmpresa);

    if Result then
      with AForm, DtSrcTabela.DataSet do
      begin
        pSerie  := FieldByName('SERIE').AsString;
        pChave  := FieldByName('CHAVE').AsString;
        pNumero := FieldByName('NUMERO').AsInteger;
        pModelo := FieldByName('MODELO').AsInteger;
        pDataEmissao := FieldByName('DATAEMISSAO').AsDateTime;

        pDestinatario.Codigo      := FieldByName('NFE_DESTINATARIO_CODIGO').AsInteger;
        pDestinatario.RazaoSocial := FieldByName('NFE_DESTINATARIO_RAZAO').AsString;
        pDestinatario.CpfCnpj     := FieldByName('NFE_DESTINATARIO_CNPJ').AsString;
        pDestinatario.InsEstadual := FieldByName('NFE_DESTINATARIO_INSCEST').AsString;
        pDestinatario.UF          := FieldByName('NFE_DESTINATARIO_UF').AsString;

        if (FieldByName('ANOVENDA').AsInteger > 0) then
        begin
          pDestinatario.Tipo := dtCliente;
          MovimentoAno       := FieldByName('ANOVENDA').AsInteger;
          MovimentoCodigo    := FieldByName('NUMVENDA').AsInteger;
        end
        else
        if (FieldByName('ANOCOMPRA').AsInteger > 0) then
        begin
          pDestinatario.Tipo := dtFornecedor;
          MovimentoAno       := FieldByName('ANOCOMPRA').AsInteger;
          MovimentoCodigo    := FieldByName('NUMCOMPRA').AsInteger;
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
    if ( DtSrcTabela.DataSet.FieldByName('CANCELADA').AsInteger = 1 ) then
      dbgDados.Canvas.Font.Color := lblNotaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeNFEmitida.fdQryTabelaNFE_DESTINATARIO_CNPJGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if StrIsCNPJ(Sender.AsString) then
      Text := StrFormatarCnpj(Sender.AsString)
    else
    if StrIsCPF(Sender.AsString) then
      Text := StrFormatarCpf(Sender.AsString);
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
  CampoOrdenacao  := 'nf.empresa, nf.numero, nf.serie';
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  tbsCadastro.TabVisible := False;

  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;

  // Configurar tabela de cadastro
  Tabela
    .Display('NUMERO', 'Número', '###0000000', TAlignment.taCenter)
    .Display('NFE_VALOR_TOTAL', 'Valor NF (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );
end;

procedure TfrmGeNFEmitida.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'nf.empresa = ' + QuotedStr(fEmpresa) + ' and ' +
    'nf.dataemissao between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if fSemNFComplementar then
    WhereAdditional := WhereAdditional +
//      ' and (coalesce(nf.anovenda, nf.anocompra, 0) > 0)' +
      ' and ((coalesce(nf.anovenda, nf.anocompra, 0) > 0) or (nf.lote_ano = 0))' +    // Voltar ao código anterior em 12/2015
      ' and (coalesce(nf.cancelada, 0) = 0)';

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeNFEmitida', TfrmGeNFEmitida);

end.
