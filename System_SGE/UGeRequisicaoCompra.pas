unit UGeRequisicaoCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, System.ImageList,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeRequisicaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    lblFornecedor: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    Bevel12: TBevel;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
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
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsFormaPagto: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoRequisicao: TDataSource;
    lblDataValidade: TLabel;
    GrpBxPagamento: TGroupBox;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
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
    TbsRequisicaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCusto: TLabel;
    btnFinalizarRequisicao: TcxButton;
    btnRequisitarReabrir: TcxButton;
    btnCancelarRequisicao: TcxButton;
    dbFornecedor: TJvDBComboEdit;
    dbCliente: TJvDBComboEdit;
    dbCentroCusto: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    ppRequisicao: TPopupMenu;
    ppmRequisitarCompra: TMenuItem;
    ppmReabrirRequisicao: TMenuItem;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaCODIGO: TFDAutoIncField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaFORNECEDOR: TIntegerField;
    fdQryTabelaNOME_CONTATO: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaINSERCAO_DATA: TSQLTimeStampField;
    fdQryTabelaEMISSAO_DATA: TDateField;
    fdQryTabelaEMISSAO_USUARIO: TStringField;
    fdQryTabelaVALIDADE: TDateField;
    fdQryTabelaCOMPETENCIA: TIntegerField;
    fdQryTabelaMOVITO: TMemoField;
    fdQryTabelaOBSERVACAO: TMemoField;
    fdQryTabelaCLIENTE: TIntegerField;
    fdQryTabelaCENTRO_CUSTO: TIntegerField;
    fdQryTabelaENDERECO_ENTREGA: TMemoField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaRECEBEDOR_NOME: TStringField;
    fdQryTabelaRECEBEDOR_CPF: TStringField;
    fdQryTabelaRECEBEDOR_FUNCAO: TStringField;
    fdQryTabelaFORMA_PAGTO: TSmallintField;
    fdQryTabelaCONDICAO_PAGTO: TSmallintField;
    fdQryTabelaTRANSPORTADOR: TIntegerField;
    fdQryTabelaVALOR_BRUTO: TBCDField;
    fdQryTabelaVALOR_DESCONTO: TBCDField;
    fdQryTabelaVALOR_TOTAL_FRETE: TBCDField;
    fdQryTabelaVALOR_TOTAL_IPI: TBCDField;
    fdQryTabelaVALOR_TOTAL: TBCDField;
    fdQryTabelaREQUISITADO_DATA: TDateField;
    fdQryTabelaDATA_FATURA: TDateField;
    fdQryTabelaREQUISITADO_USUARIO: TStringField;
    fdQryTabelaCANCELADO_DATA: TDateField;
    fdQryTabelaCANCELADO_USUARIO: TStringField;
    fdQryTabelaCANCELADO_MOTIVO: TMemoField;
    fdQryTabelaITENS: TIntegerField;
    fdQryTabelaAUTORIZACOES: TIntegerField;
    fdQryTabelaNOMEFORN: TStringField;
    fdQryTabelaCNPJ: TStringField;
    fdQryTabelaPESSOA_FISICA: TSmallintField;
    fdQryTabelaFATURAMENTO_MINIMO: TBCDField;
    fdQryTabelaTRANSPORTADOR_NOME: TStringField;
    fdQryTabelaTRANSPORTADOR_CPF_CNPJ: TStringField;
    fdQryTabelaNOMECLIENTE: TStringField;
    fdQryTabelaDESCRICAO_CENTRO_CUSTO: TStringField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensEMPRESA: TStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensFORNECEDOR: TIntegerField;
    cdsTabelaItensPRODUTO: TStringField;
    cdsTabelaItensQUANTIDADE: TBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensVALOR_UNITARIO: TBCDField;
    cdsTabelaItensIPI_PERCENTUAL: TBCDField;
    cdsTabelaItensIPI_VALOR_TOTAL: TBCDField;
    cdsTabelaItensVALOR_TOTAL: TBCDField;
    cdsTabelaItensCONFIRMADO_RECEBIMENTO: TSmallintField;
    cdsTabelaItensUSUARIO: TStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TStringField;
    cdsTabelaItensUNP_DESCRICAO: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    qryProduto: TFDQuery;
    cdsTransportador: TFDQuery;
    fdQryCondicaoPagto: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    fdQryEmpresa: TFDQuery;
    fdQryTipoRequisicao: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirRequisicaoClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
    procedure btnFinalizarRequisicaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure dbCentroCustoButtonClick(Sender: TObject);
    procedure ppmRequisitarCompraClick(Sender: TObject);
    procedure ppmReabrirRequisicaoClick(Sender: TObject);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
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
    function GetRotinaReabrirRequisicaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaRequisitarID : String read GetRotinaRequisitarID;
    property RotinaCancelarRequisicaoID : String read GetRotinaCancelarRequisicaoID;
    property RotinaReabrirRequisicaoID : String read GetRotinaReabrirRequisicaoID;
  end;

(*
  Tabelas:
  - TBEMRESA
  - TBREQUISITA_COMPRA
  - TBREQUISITA_COMPRAITEM
  - TBFORNECEDOR
  - TBCLIENTE
  - TBCENTRO_CUSTO
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBFORMPAGTO

  Views:
  - VW_TIPO_REQUISICAO
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  frmGeRequisicaoCompra: TfrmGeRequisicaoCompra;

  procedure MostrarControleRequisicao(const AOwner : TComponent);

  function SelecionarRequisicao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeFornecedor, UGeProduto, UGeRequisicaoCompraCancelar, UGeCliente,
  UGeCentroCusto;

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

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      SQL.Add('order by ' + CampoOrdenacao);
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
    frm.btnRequisitarReabrir.Visible   := False;
    frm.btnCancelarRequisicao.Visible  := False;

    frm.RdgStatusRequisicao.ItemIndex := STATUS_REQUISICAO_REQ + 1;

    frm.RdgStatusRequisicao.Enabled := False;
    //for I := 0 to frm.RdgStatusRequisicao.Items.Count - 1 do
    //  frm.RdgStatusRequisicao.Controls[I].Enabled := False;

    frm.iFornecedor := Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := '(r.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(r.emissao_data as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusRequisicao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (r.status = ' + IntToStr(frm.RdgStatusRequisicao.ItemIndex - 1) + ')';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + WhereAdditional);
      SQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      Codigo  := frm.DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      Empresa := frm.DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
    end;
  finally
    frm.Destroy;
  end;

end;

procedure TfrmGeRequisicaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_REQUISITA_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));
  CriarGenerator(sGeneratorName, 0);

  with fdQryTabela.UpdateOptions do
  begin
    GeneratorName := sGeneratorName;
    AutoIncFields := 'codigo';
  end;

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iFornecedor      := 0;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoRequisicao);
  CarregarLista(fdQryFormaPagto);
  CarregarLista(fdQryCondicaoPagto);
  CarregarLista(cdsTransportador);

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_REQUISICAO_CMP_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISITA_COMPRA';
  CampoCodigo    := 'r.codigo';
  CampoDescricao := 'f.nomeforn';
  CampoOrdenacao := 'r.emissao_data, f.nomeforn';

  WhereAdditional :=  'cast(r.emissao_data as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );

  lblCliente.Visible := GetAutorizacaoInformarCliente( gUsuarioLogado.Empresa );
  dbCliente.Visible  := lblCliente.Visible;
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
    with DtSrcTabela.DataSet do
    begin
      FieldByName('ANO').AsInteger    := iAno;
      FieldByName('CODIGO').AsInteger := iNum;
      FieldByName('NUMERO').AsString  := FormatFloat('##0000000', FieldByName('CODIGO').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    end;
end;

procedure TfrmGeRequisicaoCompra.AbrirTabelaItens(
  const AnoRequisicao: Smallint; const CodigoRequisicao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
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
  with DtSrcTabela.DataSet do
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarRequisicao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_EDC) and (not cdsTabelaItens.IsEmpty);
      btnRequisitarReabrir.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_EDC, STATUS_REQUISICAO_ABR, STATUS_REQUISICAO_REQ]);
      ppmRequisitarCompra.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_EDC, STATUS_REQUISICAO_ABR]) and (not cdsTabelaItens.IsEmpty);
      ppmReabrirRequisicao.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ);
      btnCancelarRequisicao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ);

      nmImprimirRequisicao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ) or (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_FAT);
    end
    else
    begin
      btnFinalizarRequisicao.Enabled := False;
      btnRequisitarReabrir.Enabled   := False;
      ppmRequisitarCompra.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) and (not cdsTabelaItens.IsEmpty);
      ppmReabrirRequisicao.Enabled   := False;
      btnCancelarRequisicao.Enabled  := False;

      nmImprimirRequisicao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ) or (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_FAT);
    end;
end;

procedure TfrmGeRequisicaoCompra.RecarregarRegistro;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      Exit;

    if ( not FieldByName('EMISSAO_DATA').IsNull ) then
    begin
      if ( FieldByName('EMISSAO_DATA').AsDateTime < e1Data.Date ) then
        e1Data.Date := FieldByName('EMISSAO_DATA').AsDateTime;

      if ( FieldByName('EMISSAO_DATA').AsDateTime > e2Data.Date ) then
        e2Data.Date := FieldByName('EMISSAO_DATA').AsDateTime;
    end;

    fdQryTabela.RefreshRecord();
  end;
end;

procedure TfrmGeRequisicaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
    if ( FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_REQUISICAO_REQ : sMsg := 'Esta requisição não pode ser alterada porque já está autorizada.';
        STATUS_REQUISICAO_FAT : sMsg := 'Esta requisição não pode ser alterada porque já está faturada.';
        STATUS_REQUISICAO_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) then
        if not ShowConfirm('A edição da requisição selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        FieldByName('STATUS').AsInteger := STATUS_REQUISICAO_EDC;
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      end;
    end;
end;

procedure TfrmGeRequisicaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
    if ( FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
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
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
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
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger = 0 ) then
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
    Item         := cdsTabelaItensSEQ').AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO').AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO').AsCurrency;

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

      FieldByName('DESCONTO').AsCurrency   := cDescontos;
      FieldByName('TOTALVENDA').AsCurrency := cTotalLiquido;

      if ( FieldByName('DESCONTO').AsCurrency < 0 ) then
        FieldByName('DESCONTO').AsCurrency := 0;

      if ( FieldByName('TOTALVENDA').AsCurrency < 0 ) then
        FieldByName('TOTALVENDA').AsCurrency := 0;
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
    Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

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

      with DtSrcTabela.DataSet do
      begin
        FieldByName('VALOR_BRUTO').AsCurrency     := cTotalBruto;
        FieldByName('VALOR_TOTAL_IPI').AsCurrency := cTotalIPI;
        FieldByName('VALOR_DESCONTO').AsCurrency  := cTotalDesconto;
        FieldByName('VALOR_TOTAL').AsCurrency     := cTotalLiquido;
      end;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeRequisicaoCompra.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    cdsTabelaItensANO.AsInteger        := FieldByName('ANO').AsInteger;
    cdsTabelaItensCODIGO.AsInteger     := FieldByName('CODIGO').AsInteger;
    cdsTabelaItensEMPRESA.AsString     := FieldByName('EMPRESA').AsString;
    cdsTabelaItensFORNECEDOR.AsInteger := FieldByName('FORNECEDOR').AsInteger;
    cdsTabelaItensQUANTIDADE.AsInteger := 1;
    cdsTabelaItensCONFIRMADO_RECEBIMENTO.Value := 0;
    cdsTabelaItensVALOR_UNITARIO.AsCurrency    := 0.0;
    cdsTabelaItensIPI_PERCENTUAL.AsCurrency    := 0.0;
    cdsTabelaItensIPI_VALOR_TOTAL.AsCurrency   := 0.0;
    cdsTabelaItensUSUARIO.AsString             := gUsuarioLogado.Login;
    cdsTabelaItensPRODUTO.Clear;
    cdsTabelaItensDESCRI_APRESENTACAO.Clear;
    cdsTabelaItensUNIDADE.Clear;
    cdsTabelaItensUNP_SIGLA.Clear;
  end;
end;

procedure TfrmGeRequisicaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex  := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_REQUISICAO_REQ );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeRequisicaoCompra.fdQryTabelaAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGeRequisicaoCompra.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    TbsRequisicaoCancelado.TabVisible := (FieldByName('STATUS').AsInteger = STATUS_Requisicao_CAN);
end;

procedure TfrmGeRequisicaoCompra.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeRequisicaoCompra.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').AsString         := gUsuarioLogado.Empresa;
    FieldByName('TIPO').AsInteger           := TIPO_REQUISICAO_COMPRA;
    FieldByName('INSERCAO_DATA').AsDateTime := GetDateTimeDB;
    FieldByName('EMISSAO_DATA').AsDateTime  := GetDateDB;
    FieldByName('EMISSAO_USUARIO').AsString := gUsuarioLogado.Login;
    FieldByName('VALIDADE').AsDateTime      := FieldByName('EMISSAO_DATA').AsDateTime + GetPrazoValidadeAutorizacaoCompra(FieldByName('EMPRESA').AsString);
    FieldByName('STATUS').AsInteger         := STATUS_REQUISICAO_EDC;

    FieldByName('FORMA_PAGTO').AsInteger    := GetFormaPagtoIDDefault;
    FieldByName('CONDICAO_PAGTO').AsInteger := GetCondicaoPagtoIDDefault;

    FieldByName('VALOR_TOTAL_FRETE').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_IPI').AsCurrency   := 0.0;
    FieldByName('VALOR_DESCONTO').AsCurrency    := 0.0;

    FieldByName('FORNECEDOR').Clear;
    FieldByName('NOMEFORN').Clear;
    FieldByName('TRANSPORTADOR').Clear;
    FieldByName('RECEBEDOR_NOME').Clear;
    FieldByName('RECEBEDOR_FUNCAO').Clear;
    FieldByName('RECEBEDOR_CPF').Clear;
    FieldByName('REQUISITADO_DATA').Clear;
    FieldByName('REQUISITADO_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
    FieldByName('CLIENTE').Clear;
    FieldByName('CENTRO_CUSTO').Clear;
  end;
end;

procedure TfrmGeRequisicaoCompra.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
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

procedure TfrmGeRequisicaoCompra.fdQryTabelaTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
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
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

  pgcMaisDados.ActivePage := tbsFormaPagto;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoCompra.ppmReabrirRequisicaoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('AUTORIZACOES').AsInteger > 0) then
      ShowWarning('A Requisição possui autorizações de compra/serviço gerada!' + #13 + 'Favor excluir o registro de autorização para que a requisição possa ser reaberta.')
    else
    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) then
      ShowWarning('A Requisição já está aberta!')
    else
    if (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_FAT, STATUS_REQUISICAO_CAN]) then
      ShowWarning('Apenas registros "Requisitados" podem ser reabertos!')
    else
    begin
      AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

      if ( ShowConfirm('Confirma a reabertura do registro selecionado?') ) then
        try
          Edit;

          FieldByName('STATUS').AsInteger := STATUS_AUTORIZACAO_ABR;
          FieldByName('REQUISITADO_DATA').Clear;
          FieldByName('REQUISITADO_USUARIO').Clear;
          PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;
          dbObservacao.Lines.Add(Format('Requisição reaberta para correção por %s em %s.',
            [gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy "às" hh:mm', GetDateTimeDB)]));

          fdQryTabela.Post;
          fdQryTabela.ApplyUpdates;
          fdQryTabela.CommitUpdates;

          CommitTransaction;

          ShowInformation('Requisição reaberta com sucesso !');

          HabilitarDesabilitar_Btns;

          RdgStatusRequisicao.ItemIndex := 0;
        finally
        end;
    end;
  end;
end;

procedure TfrmGeRequisicaoCompra.ppmRequisitarCompraClick(Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ) then
    begin
      ShowWarning('Lançamento já está requisitado!');
      Abort;
    end;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

    if ( FieldByName('VALOR_TOTAL').AsCurrency <> cTotalLiquido ) then
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
      if ( cTotalLiquido > FieldByName('FATURAMENTO_MINIMO').AsCurrency ) then
      begin
        ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa requisição de compra/serviço seja requisitadas!',
          [FormatFloat('"R$ ",0.00', FieldByName('FATURAMENTO_MINIMO').AsCurrency)]));
        Exit;
      end;

      Edit;

      FieldByName('STATUS').AsInteger            := STATUS_REQUISICAO_REQ;
      FieldByName('REQUISITADO_DATA').AsDateTime  := GetDateDB;
      FieldByName('REQUISITADO_USUARIO').AsString := GetUserApp;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Requisição realizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
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
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('FORNECEDOR').AsInteger := iCodigo;
        FieldByName('NOMEFORN').AsString    := sNome;
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

    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if GetExisteNumeroRequisicao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        ShowWarning('Número de requisição já existe!');
        Abort;
      end;

      FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));
      FieldByName('ENDERECO_ENTREGA').AsString := Trim(AnsiUpperCase(FieldByName('ENDERECO_ENTREGA').AsString));

      inherited;

      if ( not OcorreuErro ) then
      begin

        // Salvar Itens da Base

        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        cdsTabelaItens.CommitUpdates;

        RecarregarRegistro;

        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeRequisicaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsEdit, dsInsert] ) then
        FieldByName('VALIDADE').AsDateTime := FieldByName('EMISSAO_DATA').AsDateTime + GetPrazoValidadeAutorizacaoCompra(FieldByName('EMPRESA').AsString);
    end;

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
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar autorização em edição
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_Requisicao_EDC ) then
        dbgDados.Canvas.Brush.Color := lblRequisicaoEmEdicao.Color
      else
      // Destacar autorização aberta
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_Requisicao_ABR ) then
        dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
      else
      // Destacar autorização cancelada
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_Requisicao_CAN ) then
        dbgDados.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_Requisicao_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
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
  cPercRedBC    ,
  cValorCusto   : Currency;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('FORNECEDOR').AsInteger = 0 ) then
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

      Case FieldByName('TIPO').AsInteger of
        TIPO_Requisicao_COMPRA:
          bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                            cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
                            iEstoque, iReserva);

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
end;

procedure TfrmGeRequisicaoCompra.nmImprimirRequisicaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa,
        GetFornecedorEmail(DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryFornecedorDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger;
      Open;
    end;

    with qryRequisicaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      Open;
    end;

    frrRequisicaoCompra.ShowReport;
  end;
end;

procedure TfrmGeRequisicaoCompra.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_CAN) then
    begin
      ShowWarning('Lançamento de Requisição já está cancelado!');
      Abort;
    end;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    if ( FieldByName('STATUS').AsInteger <> STATUS_REQUISICAO_REQ ) then
      ShowInformation('Apenas registros requisitados podem ser cancelados!')
    else
    if ( CancelarAUT(Self, FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger) ) then
    begin
      RecarregarRegistro;

      ShowInformation('Requisição cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
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
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) then
    begin
      ShowWarning('Lançamento de Requisição já está finalizado!');
      Abort;
    end;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);

    if ShowConfirm('Confirma a finalização da edição do requisição?') then
    begin
      ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      if ( cTotalLiquido > FieldByName('FATURAMENTO_MINIMO').AsCurrency ) then
      begin
        ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa requisição de compra/serviço seja emitida!',
          [FormatFloat('"R$ ",0.00', FieldByName('FATURAMENTO_MINIMO').AsCurrency)]) + #13 +
          'Apenas requisições com valores abaixo de mínimo poderão ser emitidas.');
        Exit;
      end;

      Edit;

      FieldByName('STATUS').AsInteger           := STATUS_Requisicao_ABR;
      FieldByName('VALOR_BRUTO').AsCurrency     := cTotalBruto;
      FieldByName('VALOR_TOTAL_IPI').AsCurrency := cTotalIPI;
      FieldByName('VALOR_DESCONTO').AsCurrency  := cTotalDesconto;
      FieldByName('VALOR_TOTAL').AsCurrency     := cTotalLiquido;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Requisição finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
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

  with DtSrcTabela.DataSet do
    if (State in [dsEdit, dsInsert]) then
    begin
      if ( Field = FieldByName('EMPRESA') ) then
      begin
        if ( State = dsInsert ) then
        begin
          FieldByName('ENDERECO_ENTREGA').AsString := GetEmpresaEndereco(FieldByName('EMPRESA').AsString);
          FieldByName('OBSERVACAO').AsString       := 'NF. EM NOME DA ' + GetEmpresaNomeDefault;
        end;
      end
      else
      if ( (Field = FieldByName('VALOR_BRUTO')) or (Field = FieldByName('VALOR_TOTAL_FRETE')) or (Field = FieldByName('VALOR_DESCONTO')) ) then
        FieldByName('VALOR_TOTAL').AsCurrency :=
          (FieldByName('VALOR_BRUTO').AsCurrency + FieldByName('VALOR_TOTAL_IPI').AsCurrency) - FieldByName('VALOR_DESCONTO').AsCurrency;
    end;
end;

procedure TfrmGeRequisicaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    with DtSrcTabela.DataSet do
      if (State in [dsEdit, dsInsert])  then
      begin

        if dbNumero.Focused then
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if GetExisteNumeroRequisicao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              ShowWarning('Número de requisição já existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cRequisicao : 20/10/2014 - Verificar Data de Emissão da Autorização }

        if dbDataEmissao.Focused then
          if ( dbDataEmissao.Date > GetDateTimeDB ) then
              ShowWarning('A Data de Emissão da requisição está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsEdit, dsInsert] ) then
        if ( dbCliente.Focused ) then
        begin
          FieldByName('CLIENTE').Clear;
          FieldByName('NOMECLIENTE').Clear;
        end
        else
        if ( dbCentroCusto.Focused ) then
        begin
          FieldByName('CENTRO_CUSTO').Clear;
          FieldByName('DESCRICAO_CENTRO_CUSTO').Clear;
        end;
    end;

  end;

  inherited;
end;

function TfrmGeRequisicaoCompra.GetRotinaReabrirRequisicaoID: String;
begin
  Result := GetRotinaInternaID(ppmReabrirRequisicao);
end;

function TfrmGeRequisicaoCompra.GetRotinaRequisitarID: String;
begin
  Result := GetRotinaInternaID(ppmRequisitarCompra);
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

    if ppmRequisitarCompra.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaRequisitarID, ppmRequisitarCompra.Caption, RotinaID);

    if btnCancelarRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarRequisicaoID, btnCancelarRequisicao.Caption, RotinaID);

    if ppmReabrirRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaReabrirRequisicaoID, ppmReabrirRequisicao.Caption, RotinaID);
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
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sNome) ) then
      begin
        FieldByName('CLIENTE').AsInteger    := iCodigo;
        FieldByName('NOMECLIENTE').AsString := sNome;
      end;
  end;
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
  Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

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

procedure TfrmGeRequisicaoCompra.dbCentroCustoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarDepartamento(Self, FieldByName('CLIENTE').AsInteger, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) ) then
      begin
        FieldByName('CENTRO_CUSTO').AsInteger          := iCodigo;
        FieldByName('DESCRICAO_CENTRO_CUSTO').AsString := sNome;
      end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoCompra', TfrmGeRequisicaoCompra);

end.
