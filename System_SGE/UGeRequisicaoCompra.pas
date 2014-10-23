unit UGeRequisicaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, IBTable, RXDBCtrl, Menus;

type
  TfrmGeRequisicaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblFornecedor: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBDateEdit;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    btnRequisitarCompra: TBitBtn;
    btnCancelarRequisicao: TBitBtn;
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
    nmImprimirRequisicao: TMenuItem;
    qryProduto: TIBDataSet;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsFormaPagto: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    tblTipoRequisicao: TIBTable;
    dtsTipoRequisicao: TDataSource;
    lblDataValidade: TLabel;
    dbDataValidade: TDBDateEdit;
    GrpBxPagamento: TGroupBox;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensEMPRESA: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensFORNECEDOR: TIntegerField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensVALOR_UNITARIO: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL: TIBBCDField;
    cdsTabelaItensCONFIRMADO_RECEBIMENTO: TSmallintField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    btnFinalizarRequisicao: TBitBtn;
    cdsTabelaItensUSUARIO: TIBStringField;
    lblTotalDesconto: TLabel;
    dbTotalDesconto: TDBEdit;
    dbTotalLiquido: TDBEdit;
    lblTotalLiquido: TLabel;
    lblTotalFrete: TLabel;
    dbTotalFrete: TDBEdit;
    lblTotalIPI: TLabel;
    dbTotalIPI: TDBEdit;
    lblValorTotalIPI: TLabel;
    dbValorTotalIPI: TDBEdit;
    cdsTabelaItensIPI_PERCENTUAL: TIBBCDField;
    cdsTabelaItensIPI_VALOR_TOTAL: TIBBCDField;
    lblPercentualIPI: TLabel;
    dbPercentualIPI: TDBEdit;
    lblTotalBruto: TLabel;
    dbTotalBruto: TDBEdit;
    tbsRetirada: TTabSheet;
    GrpBxRetirada: TGroupBox;
    lblRecebedorNome: TLabel;
    lblRecebedorCPF: TLabel;
    lblRecebedorFuncao: TLabel;
    lblTransportador: TLabel;
    dbRecebedorNome: TDBEdit;
    dbRecebedorCPF: TDBEdit;
    dbRecebedorFuncao: TDBEdit;
    dbTransportador: TDBLookupComboBox;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
    cdsTransportador: TIBDataSet;
    dtsTransportador: TDataSource;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    lblRequisicaoEmEdicao: TLabel;
    PgcTextoRequisicao: TPageControl;
    TbsRequisicaoMotivo: TTabSheet;
    TbsRequisicaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    dbMotivo: TDBMemo;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    TbsRequisicaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaNOME_CONTATO: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    IbDtstTabelaEMISSAO_DATA: TDateField;
    IbDtstTabelaEMISSAO_USUARIO: TIBStringField;
    IbDtstTabelaVALIDADE: TDateField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaMOVITO: TMemoField;
    IbDtstTabelaOBSERVACAO: TMemoField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaENDERECO_ENTREGA: TMemoField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaRECEBEDOR_NOME: TIBStringField;
    IbDtstTabelaRECEBEDOR_CPF: TIBStringField;
    IbDtstTabelaRECEBEDOR_FUNCAO: TIBStringField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaCONDICAO_PAGTO: TSmallintField;
    IbDtstTabelaTRANSPORTADOR: TIntegerField;
    IbDtstTabelaVALOR_BRUTO: TIBBCDField;
    IbDtstTabelaVALOR_DESCONTO: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL_FRETE: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL_IPI: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL: TIBBCDField;
    IbDtstTabelaREQUISITADO_DATA: TDateField;
    IbDtstTabelaDATA_FATURA: TDateField;
    IbDtstTabelaREQUISITADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_DATA: TDateField;
    IbDtstTabelaCANCELADO_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADO_MOTIVO: TMemoField;
    IbDtstTabelaITENS: TIntegerField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaTRANSPORTADOR_NOME: TIBStringField;
    IbDtstTabelaTRANSPORTADOR_CPF_CNPJ: TIBStringField;
    IbDtstTabelaNOMECLIENTE: TIBStringField;
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
    procedure btnRequisitarCompraClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirRequisicaoClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarRequisicaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iFornecedor : Integer;
    procedure AbrirTabelaItens(const AnoRequisicao : Smallint; const CodigoRequisicao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);

    function GetRotinaFinalizarID : String;
    function GetRotinaRequisitarID : String;
    function GetRotinaCancelarRequisicaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaRequisitarID : String read GetRotinaRequisitarID;
    property RotinaCancelarRequisicaoID : String read GetRotinaCancelarRequisicaoID;
  end;

var
  frmGeRequisicaoCompra: TfrmGeRequisicaoCompra;

  procedure MostrarControleRequisicao(const AOwner : TComponent);

  function SelecionarRequisicao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeFornecedor, UGeProduto, UGeRequisicaoCompraCancelar, UGeCliente;

{$R *.dfm}

procedure MostrarControleRequisicao(const AOwner : TComponent);
var
  frm : TfrmGeRequisicaoCompra;
  whr : String;
begin
  frm := TfrmGeRequisicaoCompra.Create(AOwner);
  try
    whr := 'cast(r.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusRequisicao.ItemIndex > 0) then
      whr := whr + ' and (r.status = ' + IntToStr(frm.RdgStatusRequisicao.ItemIndex - 1) + ')';

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

function SelecionarRequisicao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeRequisicaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeRequisicaoCompra.Create(AOwner);
  try
    frm.btbtnIncluir.Visible           := False;
    frm.btnFinalizarRequisicao.Visible := False;
    frm.btnRequisitarCompra.Visible    := False;
    frm.btnCancelarRequisicao.Visible  := False;

    frm.RdgStatusRequisicao.ItemIndex := STATUS_REQUISICAO_REQ + 1;

    for I := 0 to frm.RdgStatusRequisicao.Items.Count - 1 do
      frm.RdgStatusRequisicao.Controls[I].Enabled := False;

    frm.iFornecedor := Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := '(r.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(r.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusRequisicao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (r.status = ' + IntToStr(frm.RdgStatusRequisicao.ItemIndex - 1) + ')';

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

procedure TfrmGeRequisicaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_REQUISITA_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));
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
  tblTipoRequisicao.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  cdsTransportador.Open;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_REQUISICAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISITA_COMPRA';
  CampoCodigo    := 'r.codigo';
  CampoDescricao := 'f.nomeforn';
  CampoOrdenacao := 'r.emissao_data, f.nomeforn';

  WhereAdditional :=  'cast(r.emissao_data as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );

  lblCliente.Visible := GetAutorizacaoInformarCliente( GetEmpresaIDDefault );
  dbCliente.Visible  := lblCliente.Visible;
end;

procedure TfrmGeRequisicaoCompra.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeRequisicaoCompra.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value          := GetEmpresaIDDefault;
  IbDtstTabelaTIPO.Value             := TIPO_REQUISICAO_COMPRA;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateTimeDB;
  IbDtstTabelaEMISSAO_DATA.Value     := GetDateDB;
  IbDtstTabelaEMISSAO_USUARIO.Value  := GetUserApp;
  IbDtstTabelaVALIDADE.Value         := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(IbDtstTabelaEMPRESA.AsString);
  IbDtstTabelaSTATUS.AsInteger       := STATUS_REQUISICAO_EDC;

  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAO_PAGTO.Value := GetCondicaoPagtoIDDefault;

  IbDtstTabelaVALOR_TOTAL_FRETE.AsCurrency := 0.0;
  IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency   := 0.0;
  IbDtstTabelaVALOR_DESCONTO.AsCurrency    := 0.0;

  IbDtstTabelaFORNECEDOR.Clear;
  IbDtstTabelaNOMEFORN.Clear;
  IbDtstTabelaTRANSPORTADOR.Clear;
  IbDtstTabelaRECEBEDOR_NOME.Clear;
  IbDtstTabelaRECEBEDOR_FUNCAO.Clear;
  IbDtstTabelaRECEBEDOR_CPF.Clear;
  IbDtstTabelaREQUISITADO_DATA.Clear;
  IbDtstTabelaREQUISITADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_DATA.Clear;
  IbDtstTabelaCANCELADO_USUARIO.Clear;
  IbDtstTabelaCANCELADO_MOTIVO.Clear;
  IbDtstTabelaCLIENTE.Clear;
end;

procedure TfrmGeRequisicaoCompra.btbtnIncluirClick(Sender: TObject);
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

procedure TfrmGeRequisicaoCompra.AbrirTabelaItens(
  const AnoRequisicao: Smallint; const CodigoRequisicao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoRequisicao));
    Add('  and i.codigo = ' + IntToStr(CodigoRequisicao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCompra.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarRequisicao.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_EDC) and (not cdsTabelaItens.IsEmpty);
    btnRequisitarCompra.Enabled    := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarRequisicao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_REQ);

    nmImprimirRequisicao.Enabled   := (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_REQ) or (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_FAT);
  end
  else
  begin
    btnFinalizarRequisicao.Enabled := False;
    btnRequisitarCompra.Enabled    := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarRequisicao.Enabled  := False;

    nmImprimirRequisicao.Enabled   := (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_REQ) or (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_FAT);
  end;
end;

procedure TfrmGeRequisicaoCompra.RecarregarRegistro;
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

procedure TfrmGeRequisicaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_REQUISICAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_REQUISICAO_REQ : sMsg := 'Esta requisição não pode ser alterada porque já está autorizada.';
      STATUS_REQUISICAO_FAT : sMsg := 'Esta requisição não pode ser alterada porque já está faturada.';
      STATUS_REQUISICAO_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ABR) then
      if not ShowConfirm('A edição da requisição selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.Value := STATUS_REQUISICAO_EDC;
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
    end;
  end;
end;

procedure TfrmGeRequisicaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_REQUISICAO_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_REQUISICAO_REQ : sMsg := 'Esta requisição não pode ser alterada porque já está autorizada.';
      STATUS_REQUISICAO_FAT : sMsg := 'Esta requisição não pode ser alterada porque já está faturada.';
      STATUS_REQUISICAO_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
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

procedure TfrmGeRequisicaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeRequisicaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    if ( cdsTabelaItens.Locate('SEQ', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( IbDtstTabelaFORNECEDOR.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o fornecedor para a requisição!');
    dbFornecedor.SetFocus;
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

procedure TfrmGeRequisicaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoCompra.btnProdutoExcluirClick(Sender: TObject);
(*
  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;
*)
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cDescontos, cTotalLiquido);

      IbDtstTabelaDESCONTO.AsCurrency   := cDescontos;
      IbDtstTabelaTOTALVENDA.AsCurrency := cTotalLiquido;

      if ( IbDtstTabelaDESCONTO.AsCurrency < 0 ) then
        IbDtstTabelaDESCONTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTALVENDA.AsCurrency < 0 ) then
        IbDtstTabelaTOTALVENDA.AsCurrency := 0;
*)
    end;
end;

procedure TfrmGeRequisicaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensSEQ.AsInteger;

    Total_Bruto    := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    Total_Desconto := IbDtstTabelaVALOR_DESCONTO.AsCurrency;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto := Total_Bruto + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      Total_IPI   := Total_IPI   + cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalFrete   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
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
    else
    if ( cdsTabelaItensVALOR_UNITARIO.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor Unitário inválido.');
      dbValorUn.SetFocus;
    end
    else
    if ( (cdsTabelaItensIPI_PERCENTUAL.AsCurrency < 0) or (cdsTabelaItensIPI_PERCENTUAL.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual do IPI inválido.');
      dbPercentualIPI.Field.AsCurrency := 0.0;
      dbPercentualIPI.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      IbDtstTabelaVALOR_BRUTO.AsCurrency     := cTotalBruto;
      IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency := cTotalIPI;
      IbDtstTabelaVALOR_DESCONTO.AsCurrency  := cTotalDesconto;
      IbDtstTabelaVALOR_TOTAL.AsCurrency     := cTotalLiquido;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeRequisicaoCompra.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODIGO.Value     := IbDtstTabelaCODIGO.Value;
  cdsTabelaItensEMPRESA.Value    := IbDtstTabelaEMPRESA.Value;
  cdsTabelaItensFORNECEDOR.Value := IbDtstTabelaFORNECEDOR.Value;
  cdsTabelaItensQUANTIDADE.Value := 1;
  cdsTabelaItensCONFIRMADO_RECEBIMENTO.Value := 0;
  cdsTabelaItensVALOR_UNITARIO.AsCurrency    := 0.0;
  cdsTabelaItensIPI_PERCENTUAL.AsCurrency    := 0.0;
  cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency   := 0.0;
  cdsTabelaItensUSUARIO.Value                := GetUserApp;
  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
end;

procedure TfrmGeRequisicaoCompra.btnRequisitarCompraClick(
  Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

  if ( IbDtstTabelaVALOR_TOTAL.AsCurrency <> cTotalLiquido ) then
  begin
    ShowWarning('A soma dos valores totais dos itens (' +
      FormatFloat('"R$ ",0.00', cTotalLiquido) +
      ') não confere com o Valor Total da Requisição.' + #13#13 +
      'Favor excute os seguintes procedimentos:' + #13 +
      '1. Altere o registro para correção.'      + #13 +
      '2. Salve a alteração realizada.'          + #13 +
      '3. Finalize-o novamente.');
    Abort;
  end;

  if ( ShowConfirm('Confirma a autorização do registro selecionado?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value              := STATUS_REQUISICAO_REQ;
    IbDtstTabelaREQUISITADO_DATA.Value    := GetDateDB;
    IbDtstTabelaREQUISITADO_USUARIO.Value := GetUserApp;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Requisição realizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusRequisicao.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_REQUISICAO_REQ );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeRequisicaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (cdsTabelaItens.State in [dsEdit, dsInsert]);

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeRequisicaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

  pgcMaisDados.ActivePage := tbsFormaPagto;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCompra.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iFornecedor = 0, '', '(r.fornecedor = ' + IntToStr(iFornecedor) + ') and ') +
    'cast(r.emissao_data as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusRequisicao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (r.status = ' + IntToStr(RdgStatusRequisicao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeRequisicaoCompra.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaFORNECEDOR.AsInteger := iCodigo;
      IbDtstTabelaNOMEFORN.AsString    := sNome;
    end;
end;

procedure TfrmGeRequisicaoCompra.CarregarDadosProduto(Codigo: Integer);
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

procedure TfrmGeRequisicaoCompra.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );
end;

procedure TfrmGeRequisicaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da requisição.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da requisição!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger);

    if GetExisteNumeroRequisicao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('Número de requisição já existe!');
      Abort;
    end;

    IbDtstTabelaMOVITO.AsString     := Trim(AnsiUpperCase(IbDtstTabelaMOVITO.AsString));
    IbDtstTabelaOBSERVACAO.AsString := Trim(AnsiUpperCase(IbDtstTabelaOBSERVACAO.AsString));
    IbDtstTabelaENDERECO_ENTREGA.AsString := Trim(AnsiUpperCase(IbDtstTabelaENDERECO_ENTREGA.AsString));

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens da Base

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCODIGO.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(GetCampoCodigoLimpo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeRequisicaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      IbDtstTabelaVALIDADE.Value := IbDtstTabelaEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(IbDtstTabelaEMPRESA.AsString);

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) or (Sender = dbPercentualIPI) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_TOTAL.AsCurrency     := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO.AsCurrency;
      cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency := (cdsTabelaItensVALOR_TOTAL.AsCurrency * cdsTabelaItensIPI_PERCENTUAL.AsCurrency) / 100;
    end;

  if ( Sender = dbValorTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeRequisicaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;                            
  if ( Sender = dbgDados ) then
  begin
    // Destacar autorização em edição
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_Requisicao_EDC ) then
      dbgDados.Canvas.Brush.Color := lblRequisicaoEmEdicao.Color
    else
    // Destacar autorização aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_Requisicao_ABR ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
    else
    // Destacar autorização cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_Requisicao_CAN ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (IbDtstTabelaSTATUS.AsInteger = STATUS_Requisicao_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
      dbgProdutos.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeRequisicaoCompra.dbProdutoButtonClick(Sender: TObject);
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
  cValorVenda,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    : Currency;
begin
  if ( IbDtstTabelaFORNECEDOR.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o fornecedor para a requisição!');
    dbFornecedor.SetFocus;
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
      TIPO_Requisicao_COMPRA:
        bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_Requisicao_SERVICO:
        bSelecionado := SelecionarServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao);

      TIPO_Requisicao_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString             := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString           := sUnidade;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;
    
  end;
end;

procedure TfrmGeRequisicaoCompra.nmImprimirRequisicaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetFornecedorEmail(IbDtstTabelaFORNECEDOR.AsInteger), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryFornecedorDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaFORNECEDOR.AsInteger;
      Open;
    end;

    with qryRequisicaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCODIGO.AsInteger;
      Open;
    end;

    frrRequisicaoCompra.ShowReport;
  end;
end;

procedure TfrmGeRequisicaoCompra.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_REQUISICAO_REQ ) then
    ShowInformation('Apenas registros requisitados podem ser cancelados!')
  else
  if ( CancelarAUT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODIGO.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Requisição cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeRequisicaoCompra.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_REQUISICAO_EDC : Text := 'Em Edição';
    STATUS_REQUISICAO_ABR : Text := 'Aberta';
    STATUS_REQUISICAO_REQ : Text := 'Requisitada';
    STATUS_REQUISICAO_FAT : Text := 'Faturada';
    STATUS_REQUISICAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeRequisicaoCompra.btnFinalizarRequisicaoClick(
  Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger);

  if ShowConfirm('Confirma a finalização da edição do requisição?') then
  begin
    ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value               := STATUS_Requisicao_ABR;
    IbDtstTabelaVALOR_BRUTO.AsCurrency     := cTotalBruto;
    IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency := cTotalIPI;
    IbDtstTabelaVALOR_DESCONTO.AsCurrency  := cTotalDesconto;
    IbDtstTabelaVALOR_TOTAL.AsCurrency     := cTotalLiquido;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Requisição finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODIGO.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusRequisicao.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQUANTIDADE) or (Field = cdsTabelaItensVALOR_UNITARIO) or (Field = cdsTabelaItensIPI_PERCENTUAL) ) then
    begin
      cdsTabelaItensVALOR_TOTAL.AsCurrency     := cdsTabelaItensQUANTIDADE.AsCurrency * cdsTabelaItensVALOR_UNITARIO.AsCurrency;
      cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency := (cdsTabelaItensVALOR_TOTAL.AsCurrency * cdsTabelaItensIPI_PERCENTUAL.AsCurrency) / 100;
    end;
end;

procedure TfrmGeRequisicaoCompra.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  { DONE -oIsaque -cRequisicao : 22/05/2014 - Preenchimento automático ENDEREÇO DE ENTREGA E OBSERVAÇÕES no momento da inserção }

  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
  begin
    if ( Field = IbDtstTabelaEMPRESA ) then
    begin
      if ( IbDtstTabela.State = dsInsert ) then
      begin
        IbDtstTabelaENDERECO_ENTREGA.AsString := GetEmpresaEndereco(IbDtstTabelaEMPRESA.AsString);
        IbDtstTabelaOBSERVACAO.AsString       := 'NF. EM NOME DA ' + GetEmpresaNomeDefault;
      end;
    end
    else
    if ( (Field = IbDtstTabelaVALOR_BRUTO) or (Field = IbDtstTabelaVALOR_TOTAL_FRETE) or (Field = IbDtstTabelaVALOR_DESCONTO) ) then
      IbDtstTabelaVALOR_TOTAL.AsCurrency :=
        (IbDtstTabelaVALOR_BRUTO.AsCurrency + IbDtstTabelaVALOR_TOTAL_IPI.AsCurrency) - IbDtstTabelaVALOR_DESCONTO.AsCurrency;
  end;
end;

procedure TfrmGeRequisicaoCompra.FormKeyDown(Sender: TObject;
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
          if GetExisteNumeroRequisicao(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODIGO.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('Número de requisição já existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cRequisicao : 20/10/2014 - Verificar Data de Emissão da Autorização }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de Emissão da requisição está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  inherited;
end;

procedure TfrmGeRequisicaoCompra.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_Requisicao_COMPRA :
        Text := 'Compra';

      TIPO_Requisicao_SERVICO:
        Text := 'Serviço';

      TIPO_Requisicao_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

function TfrmGeRequisicaoCompra.GetRotinaRequisitarID: String;
begin
  Result := GetRotinaInternaID(btnRequisitarCompra);
end;

function TfrmGeRequisicaoCompra.GetRotinaCancelarRequisicaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarRequisicao);
end;

function TfrmGeRequisicaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarRequisicao);
end;

procedure TfrmGeRequisicaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarRequisicao.Caption, RotinaID);

    if btnRequisitarCompra.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaRequisitarID, btnRequisitarCompra.Caption, RotinaID);

    if btnCancelarRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarRequisicaoID, btnCancelarRequisicao.Caption, RotinaID);
  end;
end;

procedure TfrmGeRequisicaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeRequisicaoCompra.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaCLIENTE.AsInteger    := iCodigo;
      IbDtstTabelaNOMECLIENTE.AsString := sNome;
    end;
end;

procedure TfrmGeRequisicaoCompra.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsRequisicaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_Requisicao_CAN);
end;

procedure TfrmGeRequisicaoCompra.ValidarToTais(var Total_Bruto, Total_IPI,
  Total_Desconto, Total_Liquido: Currency);
var
  Item : Integer;
begin
  Item := cdsTabelaItensSEQ.AsInteger;

  Total_Bruto    := 0.0;
  Total_IPI      := 0.0;
  Total_Liquido  := 0.0;
  Total_Desconto := IbDtstTabelaVALOR_DESCONTO.AsCurrency;

  cdsTabelaItens.First;

  try
    cdsTabelaItens.DisableControls;
    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto := Total_Bruto + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      Total_IPI   := Total_IPI   + cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_Desconto;
  finally
    cdsTabelaItens.Locate('SEQ', Item, []);
    cdsTabelaItens.EnableControls;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoCompra', TfrmGeRequisicaoCompra);

end.
