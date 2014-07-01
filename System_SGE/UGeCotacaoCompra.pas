unit UGeCotacaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, IBTable, RXDBCtrl, Menus;

type
  TfrmGeCotacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    RdgStatusCotacao: TRadioGroup;
    lblCotacaoAberta: TLabel;
    lblCotacaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBDateEdit;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    btnAutorizarCotacao: TBitBtn;
    btnCancelarCotacao: TBitBtn;
    Bevel12: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirCotacao: TMenuItem;
    qryProduto: TIBDataSet;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsFormaPagto: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    tblTipoCotacao: TIBTable;
    dtsTipoCotacao: TDataSource;
    lblDataValidade: TLabel;
    dbDataValidade: TDBDateEdit;
    GrpBxPagamento: TGroupBox;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    btnFinalizarCotacao: TBitBtn;
    tbsEventoLOG: TTabSheet;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
    cdsTransportador: TIBDataSet;
    dtsTransportador: TDataSource;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    lblCotacaoEmEdicao: TLabel;
    PgcTextoCotacao: TPageControl;
    TbsCotacaoMotivo: TTabSheet;
    TbsCotacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    dbMotivo: TDBMemo;
    TbsCotacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaDESCRICAO_RESUMO: TIBStringField;
    IbDtstTabelaNOME_CONTATO_INT: TIBStringField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    IbDtstTabelaEMISSAO_DATA: TDateField;
    IbDtstTabelaEMISSAO_USUARIO: TIBStringField;
    IbDtstTabelaVALIDADE: TDateField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaMOVITO: TMemoField;
    IbDtstTabelaOBSERVACAO: TMemoField;
    IbDtstTabelaLOG_EVENTO: TMemoField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaNUMERO_MINIMO_FORNECEDOR: TSmallintField;
    IbDtstTabelaAUTORIZADA_DATA: TDateField;
    IbDtstTabelaAUTORIZADA_USUARIO: TIBStringField;
    IbDtstTabelaENCERRADA_DATA: TDateField;
    IbDtstTabelaENCERRADA_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_DATA: TDateField;
    IbDtstTabelaCANCELADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_MOTIVO: TMemoField;
    IbDtstTabelaVALOR_REF_TOTAL: TIBBCDField;
    IbDtstTabelaVALOR_MAX_BRUTO: TIBBCDField;
    IbDtstTabelaVALOR_MAX_DESCONTO: TIBBCDField;
    IbDtstTabelaVALOR_MAX_TOTAL: TIBBCDField;
    IbDtstTabelaVALOR_MIN_BRUTO: TIBBCDField;
    IbDtstTabelaVALOR_MIN_DESCONTO: TIBBCDField;
    IbDtstTabelaVALOR_MIN_TOTAL: TIBBCDField;
    IbDtstTabelaVALOR_MEDIA_BRUTO: TIBBCDField;
    IbDtstTabelaVALOR_MEDIA_DESCONTO: TIBBCDField;
    IbDtstTabelaVALOR_MEDIA_TOTAL: TIBBCDField;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensEMPRESA: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensVALOR_UNITARIO_REF: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL_REF: TIBBCDField;
    cdsTabelaItensVALOR_UNITARIO_MIN: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL_MIN: TIBBCDField;
    cdsTabelaItensVALOR_UNITARIO_MAX: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL_MAX: TIBBCDField;
    cdsTabelaItensVALOR_UNITARIO_MEDIA: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL_MEDIA: TIBBCDField;
    cdsTabelaItensUSUARIO: TIBStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    dbEventoLOG: TDBMemo;
    lblNumeroFornecedor: TLabel;
    dbNumeroFornecedor: TDBEdit;
    nmImprimirCotacaoMapa: TMenuItem;
    lblTotalReferencia: TLabel;
    dbTotalReferencia: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaINSERCAO_DATAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btnAutorizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirCotacaoClick(Sender: TObject);
    procedure btnCancelarCotacaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iFornecedor : Integer;
    procedure AbrirTabelaItens(const AnoAutorizacao : Smallint; const CodigoAutorizacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarCotacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarCotacaoID : String read GetRotinaCancelarCotacaoID;
  end;

var
  frmGeCotacaoCompra: TfrmGeCotacaoCompra;

  procedure MostrarControleCotacao(const AOwner : TComponent);

  function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeProduto, UGeCotacaoCompraCancelar;

{$R *.dfm}

procedure MostrarControleCotacao(const AOwner : TComponent);
var
  frm : TfrmGeCotacaoCompra;
  whr : String;
begin
  frm := TfrmGeCotacaoCompra.Create(AOwner);
  try
    whr := 'cast(c.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusCotacao.ItemIndex > 0) then
      whr := whr + ' and (c.status = ' + IntToStr(frm.RdgStatusCotacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeCotacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeCotacaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible        := False;
    frm.btnFinalizarCotacao.Visible := False;
    frm.btnAutorizarCotacao.Visible := False;
    frm.btnCancelarCotacao.Visible  := False;

    frm.RdgStatusCotacao.ItemIndex := STATUS_COTACAO_AUT + 1;

    for I := 0 to frm.RdgStatusCotacao.Items.Count - 1 do
      frm.RdgStatusCotacao.Controls[I].Enabled := False;

    frm.iFornecedor := 0; //Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := //'(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(c.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusCotacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (c.status = ' + IntToStr(frm.RdgStatusCotacao.ItemIndex - 1) + ')';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.IbDtstTabelaANO.AsInteger;
      Codigo  := frm.IbDtstTabelaCODIGO.AsInteger;
      Empresa := frm.IbDtstTabelaEMPRESA.AsString;
    end;
  finally
    frm.Destroy;
  end;

end;

procedure GetToTais(var Total_Referencia : Currency);
var
  Item : Integer;
begin
  with frmGeCotacaoCompra do
  begin
    Item := cdsTabelaItensSEQ.AsInteger;

    Total_Referencia := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Referencia := Total_Referencia + cdsTabelaItensVALOR_TOTAL_REF.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;
end;

procedure TfrmGeCotacaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_COTACAO_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'codigo';

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iFornecedor      := 0;

  tblEmpresa.Open;
  tblTipoCotacao.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  cdsTransportador.Open;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_COTACAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBCOTACAO_COMPRA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'c.descricao_resumo';
  CampoOrdenacao := 'c.emissao_data, c.descricao_resumo';

  WhereAdditional :=  'cast(c.emissao_data as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value          := GetEmpresaIDDefault;
  IbDtstTabelaTIPO.Value             := TIPO_COTACAO_COMPRA;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateTimeDB;
  IbDtstTabelaEMISSAO_DATA.Value     := GetDateDB;
  IbDtstTabelaEMISSAO_USUARIO.Value  := GetUserApp;
  IbDtstTabelaVALIDADE.Value         := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeCotacaoCompra(IbDtstTabelaEMPRESA.AsString);
  IbDtstTabelaSTATUS.AsInteger       := STATUS_COTACAO_EDC;

  IbDtstTabelaVALOR_REF_TOTAL.AsCurrency    := 0.0;

  IbDtstTabelaVALOR_MAX_BRUTO.AsCurrency    := 0.0;
  IbDtstTabelaVALOR_MAX_DESCONTO.AsCurrency := 0.0;
  IbDtstTabelaVALOR_MAX_TOTAL.AsCurrency    := 0.0;

  IbDtstTabelaVALOR_MIN_BRUTO.AsCurrency    := 0.0;
  IbDtstTabelaVALOR_MIN_DESCONTO.AsCurrency := 0.0;
  IbDtstTabelaVALOR_MIN_TOTAL.AsCurrency    := 0.0;

  IbDtstTabelaVALOR_MEDIA_BRUTO.AsCurrency    := 0.0;
  IbDtstTabelaVALOR_MEDIA_DESCONTO.AsCurrency := 0.0;
  IbDtstTabelaVALOR_MEDIA_TOTAL.AsCurrency    := 0.0;

  IbDtstTabelaDESCRICAO_RESUMO.Clear;
  IbDtstTabelaNOME_CONTATO_INT.Clear;
  IbDtstTabelaAUTORIZADA_DATA.Clear;
  IbDtstTabelaAUTORIZADA_USUARIO.Clear;
  IbDtstTabelaCANCELADO_DATA.Clear;
  IbDtstTabelaCANCELADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_MOTIVO.Clear;
end;

procedure TfrmGeCotacaoCompra.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger    := iAno;
    IbDtstTabelaCODIGO.AsInteger := iNum;
    IbDtstTabelaNUMERO.AsString  := FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  end;
end;

procedure TfrmGeCotacaoCompra.AbrirTabelaItens(
  const AnoAutorizacao: Smallint; const CodigoAutorizacao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoAutorizacao));
    Add('  and i.codigo = ' + IntToStr(CodigoAutorizacao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarCotacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_EDC) and (not cdsTabelaItens.IsEmpty);
    btnAutorizarCotacao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarCotacao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_AUT);

    nmImprimirCotacao.Enabled     := (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_AUT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ENC);
    nmImprimirCotacaoMapa.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ENC);
  end
  else
  begin
    btnFinalizarCotacao.Enabled := False;
    btnAutorizarCotacao.Enabled      := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarCotacao.Enabled  := False;

    nmImprimirCotacao.Enabled     := (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_AUT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ENC);
    nmImprimirCotacaoMapa.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_COT) or (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ENC);
  end;
end;

procedure TfrmGeCotacaoCompra.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCODIGO.AsInteger;

    if ( not IbDtstTabelaEMISSAO_DATA.IsNull ) then
    begin
      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;

      if ( IbDtstTabelaEMISSAO_DATA.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaEMISSAO_DATA.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_AUTORIZACAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_COTACAO_AUT : sMsg := 'Esta cotação não pode ser alterada porque já está autorizada.';
      STATUS_COTACAO_COT : sMsg := 'Esta cotação não pode ser alterada porque já está aguardando encerramento.';
      STATUS_COTACAO_CAN : sMsg := 'Esta cotação não pode ser alterada porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ABR) then
      if not ShowConfirm('A edição da cotação selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.Value := STATUS_COTACAO_EDC;
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_AUTORIZACAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_COTACAO_AUT : sMsg := 'Esta cotação não pode ser alterada porque já está autorizada.';
      STATUS_COTACAO_COT : sMsg := 'Esta cotação não pode ser alterada porque já está aguardando encerramento.';
      STATUS_COTACAO_CAN : sMsg := 'Esta cotação não pode ser alterada porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeCotacaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    if ( cdsTabelaItens.Locate('SEQ', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( Trim(IbDtstTabelaDESCRICAO_RESUMO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descrição resumo para a cotação!');
    dbDescricao.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeCotacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeCotacaoCompra.btnProdutoExcluirClick(Sender: TObject);
var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;
*)
    end;
end;

procedure TfrmGeCotacaoCompra.btnProdutoSalvarClick(Sender: TObject);
var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
//    else
//    if ( (cdsTabelaItensIPI_PERCENTUAL.AsCurrency < 0) or (cdsTabelaItensIPI_PERCENTUAL.AsCurrency > 100) ) then
//    begin
//      ShowWarning('Percentual do IPI inválido.');
//      dbPercentualIPI.SetFocus;
//    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalReferencia);

      IbDtstTabelaVALOR_REF_TOTAL.AsCurrency := cTotalReferencia;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeCotacaoCompra.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODIGO.Value     := IbDtstTabelaCODIGO.Value;
  cdsTabelaItensEMPRESA.Value    := IbDtstTabelaEMPRESA.Value;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency := 0.0;
  cdsTabelaItensUSUARIO.Value                 := GetUserApp;
  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
end;

procedure TfrmGeCotacaoCompra.btnAutorizarCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( ShowConfirm('Confirma a autorização do cotação selecionada?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value             := STATUS_COTACAO_AUT;
    IbDtstTabelaAUTORIZADA_DATA.Value    := GetDateDB;
    IbDtstTabelaAUTORIZADA_USUARIO.Value := GetUserApp;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Autorização realizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusCotacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeCotacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  PgcTextoCotacao.ActivePage   := TbsCotacaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_COTACAO_AUT );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeCotacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeCotacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  pgcMaisDados.ActivePage := tbsFormaPagto;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iFornecedor = 0, '', '(a.fornecedor = ' + IntToStr(iFornecedor) + ') and ') + 
    'cast(c.emissao_data as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusCotacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (c.status = ' + IntToStr(RdgStatusCotacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeCotacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensPRODUTO.AsString             := FieldByName('cod').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGeCotacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autorização.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da cotação!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger);

    if GetExisteNumeroCotacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('Número de cotação já existe!');
      Abort;
    end;

    IbDtstTabelaMOVITO.AsString     := Trim(AnsiUpperCase(IbDtstTabelaMOVITO.AsString));
    IbDtstTabelaOBSERVACAO.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACAO.AsString));

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCODIGO.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCotacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      IbDtstTabelaVALIDADE.Value := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeCotacaoCompra(IbDtstTabelaEMPRESA.AsString);

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_TOTAL_REF.AsCurrency := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency;
      
    end;

  if ( Sender = dbValorTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeCotacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;                            
  if ( Sender = dbgDados ) then
  begin
    // Destacar cotação em edição
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblCotacaoEmEdicao.Color
    else
    // Destacar cotação aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblCotacaoAberta.Font.Color
    else
    // Destacar cotação cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblCotacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos já em cotação
  if ( Sender = dbgProdutos ) then
  begin
//    if ( (IbDtstTabelaSTATUS.AsInteger = STATUS_AUTORIZACAO_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
//      dbgProdutos.Canvas.Font.Color := lblAutorizacaoCancelada.Font.Color;
//
//    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeCotacaoCompra.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo    ,
  iCFOP_CNAE ,
  iUnidade   : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorCusto   ,
  cValorVenda   ,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    : Currency;
begin
  if ( Trim(IbDtstTabelaDESCRICAO_RESUMO.AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descrição resumo para a cotação!');
    dbDescricao.SetFocus;
  end
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case IbDtstTabelaTIPO.AsInteger of
      TIPO_AUTORIZACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_AUTORIZACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString              := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString  := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString            := sUnidade;
      cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency := cValorCusto;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;
    
  end;
end;

procedure TfrmGeCotacaoCompra.nmImprimirCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetEmailEmpresa(GetEmpresaIDDefault), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;
(*
    with qryFornecedorDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaFORNECEDOR.AsInteger;
      Open;
    end;

    with qryAutorizacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCODIGO.AsInteger;
      Open;
    end;

    frrAutorizacaoCompra.ShowReport;
*)    
  end;
end;

procedure TfrmGeCotacaoCompra.btnCancelarCotacaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_AUTORIZACAO_AUT ) then
    ShowInformation('Apenas registros autorizados podem ser cancelados!')
  else
  if ( CancelarCOT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODIGO.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Cotação cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_COTACAO_EDC : Text := 'Em Edição';
    STATUS_COTACAO_ABR : Text := 'Aberta';
    STATUS_COTACAO_AUT : Text := 'Autorizada';
    STATUS_COTACAO_COT : Text := 'Em Cotação';
    STATUS_COTACAO_ENC : Text := 'Encerrada';
    STATUS_COTACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeCotacaoCompra.btnFinalizarCotacaoClick(
  Sender: TObject);
(*
  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    Return := False;

    cdsTabelaItens.First;
    while not cdsTabelaItens.Eof do
    begin
      Return := ( (cdsTabelaItensQUANTIDADE.AsInteger > cdsTabelaItensESTOQUE_SATELITE.AsInteger) or (cdsTabelaItensESTOQUE_SATELITE.AsInteger <= 0) );
      if ( Return ) then
        Break;
      cdsTabelaItens.Next;
    end;

    Result := Return;
  end;
*)
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( ShowConfirm('Confirma a finalização da edição do cotação?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value := STATUS_COTACAO_ABR;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Cotação finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusCotacao.ItemIndex := 0;
  end;
end;

procedure TfrmGeCotacaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQUANTIDADE) or (Field = cdsTabelaItensVALOR_UNITARIO_REF) ) then
    begin
      cdsTabelaItensVALOR_TOTAL_REF.AsCurrency := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency;
      
    end;
end;

procedure TfrmGeCotacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    if (IbDtstTabela.State in [dsEdit, dsInsert])  then
    begin

      if dbNumero.Focused then
        if ( Length(Trim(dbNumero.Text)) > 0 ) then
          if GetExisteNumeroCotacao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('Número de cotaçaõ já existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emissão da Autorização }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emissão da cotação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  inherited;
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_COTACAO_COMPRA :
        Text := 'Compra';

      TIPO_COTACAO_SERVICO:
        Text := 'Serviço';

      TIPO_COTACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

function TfrmGeCotacaoCompra.GetRotinaAutorizarID: String;
begin
  Result := GetRotinaInternaID(btnAutorizarCotacao);
end;

function TfrmGeCotacaoCompra.GetRotinaCancelarCotacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarCotacao);
end;

function TfrmGeCotacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarCotacao);
end;

procedure TfrmGeCotacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarCotacao.Caption, RotinaID);

    if btnAutorizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAutorizarID, btnAutorizarCotacao.Caption, RotinaID);

    if btnCancelarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarCotacaoID, btnCancelarCotacao.Caption, RotinaID);
  end;
end;

procedure TfrmGeCotacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeCotacaoCompra.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsCotacaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_COTACAO_CAN);
end;

initialization
  FormFunction.RegisterForm('frmGeCotacaoCompra', TfrmGeCotacaoCompra);

end.
