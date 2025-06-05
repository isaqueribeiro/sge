unit UGeCotacaoCompra;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ImgList,
  IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, cxGraphics, cxLookAndFeels, System.ImageList,
  cxLookAndFeelPainters, cxButtons, JvDBControls, JvToolEdit, JvExMask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TfrmGeCotacaoCompra = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusCotacao: TRadioGroup;
    lblCotacaoAberta: TLabel;
    lblCotacaoCancelada: TLabel;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
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
    nmImprimirCotacao: TMenuItem;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsDadoConsolidado: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoCotacao: TDataSource;
    lblDataValidade: TLabel;
    GrpBxPagamento: TGroupBox;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    tbsEventoLOG: TTabSheet;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
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
    dbEventoLOG: TDBMemo;
    lblNumeroFornecedor: TLabel;
    dbNumeroFornecedor: TDBEdit;
    nmImprimirCotacaoMapa: TMenuItem;
    lblTotalReferencia: TLabel;
    dbTotalReferencia: TDBEdit;
    lblTotalLiquidoMax: TLabel;
    dbTotalLiquidoMax: TDBEdit;
    lblTotalLiquidoMin: TLabel;
    dbTotalLiquidoMin: TDBEdit;
    lblTotalLiquidoMedio: TLabel;
    dbTotalLiquidoMedio: TDBEdit;
    PnlDadosProdutoConsolidado: TPanel;
    Bevel10: TBevel;
    lblValorUnMax: TLabel;
    dbValorUnMax: TDBEdit;
    lblValorTotalMax: TLabel;
    dbValorTotalMax: TDBEdit;
    lblValorUnMin: TLabel;
    dbValorUnMin: TDBEdit;
    dbValorTotalMin: TDBEdit;
    lblValorTotalMin: TLabel;
    tbsFornecedor: TTabSheet;
    Bevel11: TBevel;
    PnlFornecedor: TPanel;
    BtnFornecedorInserir: TBitBtn;
    BtnFornecedorEditar: TBitBtn;
    BtnFornecedorExcluir: TBitBtn;
    Bevel13: TBevel;
    dtsFornecedor: TDataSource;
    dbgFornecedor: TDBGrid;
    BtnFornecedorOpcoes: TBitBtn;
    ppCotacaoFornecedor: TPopupMenu;
    nmGerarArquivoXLS: TMenuItem;
    nmProcessarArquivoXLS: TMenuItem;
    opdCotacaoFornecedor: TOpenDialog;
    N1: TMenuItem;
    nmProcessarRespostas: TMenuItem;
    btnFinalizarCotacao: TcxButton;
    btnAutorizarCotacao: TcxButton;
    btnCancelarCotacao: TcxButton;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbProduto: TJvDBComboEdit;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaDESCRICAO_RESUMO: TStringField;
    fdQryTabelaNOME_CONTATO_INT: TStringField;
    fdQryTabelaINSERCAO_DATA: TSQLTimeStampField;
    fdQryTabelaEMISSAO_DATA: TDateField;
    fdQryTabelaEMISSAO_USUARIO: TStringField;
    fdQryTabelaVALIDADE: TDateField;
    fdQryTabelaCOMPETENCIA: TIntegerField;
    fdQryTabelaMOVITO: TMemoField;
    fdQryTabelaOBSERVACAO: TMemoField;
    fdQryTabelaLOG_EVENTO: TMemoField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaNUMERO_MINIMO_FORNECEDOR: TSmallintField;
    fdQryTabelaAUTORIZADA_DATA: TDateField;
    fdQryTabelaAUTORIZADA_USUARIO: TStringField;
    fdQryTabelaENCERRADA_DATA: TDateField;
    fdQryTabelaENCERRADA_USUARIO: TStringField;
    fdQryTabelaCANCELADO_DATA: TDateField;
    fdQryTabelaCANCELADO_USUARIO: TStringField;
    fdQryTabelaCANCELADO_MOTIVO: TMemoField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODIGO: TIntegerField;
    cdsTabelaItensEMPRESA: TStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensPRODUTO: TStringField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUSUARIO: TStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TStringField;
    cdsTabelaItensUNP_DESCRICAO: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    qryFornecedor: TFDQuery;
    updFornecedor: TFDUpdateSQL;
    qryFornecedorANO: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorEMPRESA: TStringField;
    qryFornecedorFORNECEDOR: TIntegerField;
    qryFornecedorNOME_CONTATO: TStringField;
    qryFornecedorEMAIL_ENVIO: TStringField;
    qryFornecedorFORMA_PAGTO: TSmallintField;
    qryFornecedorCONDICAO_PAGTO: TSmallintField;
    qryFornecedorPRAZO_ENTREGA_DATA: TDateField;
    qryFornecedorPRAZO_ENTREDA_DIA: TSmallintField;
    qryFornecedorOBSERVACAO: TMemoField;
    qryFornecedorATIVO: TSmallintField;
    qryFornecedorUSUARIO: TStringField;
    qryFornecedorVENCEDOR: TSmallintField;
    qryFornecedorNOMEFORN: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryFornecedorEMAIL: TStringField;
    qryFornecedorFORMA_PAGTO_DESC: TStringField;
    qryFornecedorCONDICAP_PAGTO_DESC: TStringField;
    qryFornecedorITENS: TIntegerField;
    qryProduto: TFDQuery;
    fdQryEmpresa: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    fdQryCondicaoPagto: TFDQuery;
    cdsTransportador: TFDQuery;
    fdQryTipoCotacao: TFDQuery;
    spSetCotacaoFornecedorItem: TFDStoredProc;
    spSetCotacaoFornecedorProcessa: TFDStoredProc;
    fdQryTabelaVALOR_REF_TOTAL: TFMTBCDField;
    fdQryTabelaVALOR_MAX_BRUTO: TFMTBCDField;
    fdQryTabelaVALOR_MAX_DESCONTO: TFMTBCDField;
    fdQryTabelaVALOR_MAX_TOTAL: TFMTBCDField;
    fdQryTabelaVALOR_MIN_BRUTO: TFMTBCDField;
    fdQryTabelaVALOR_MIN_DESCONTO: TFMTBCDField;
    fdQryTabelaVALOR_MIN_TOTAL: TFMTBCDField;
    fdQryTabelaVALOR_MEDIA_BRUTO: TFMTBCDField;
    fdQryTabelaVALOR_MEDIA_DESCONTO: TFMTBCDField;
    fdQryTabelaVALOR_MEDIA_TOTAL: TFMTBCDField;
    cdsTabelaItensQUANTIDADE: TFMTBCDField;
    cdsTabelaItensVALOR_UNITARIO_REF: TFMTBCDField;
    cdsTabelaItensVALOR_TOTAL_REF: TFMTBCDField;
    cdsTabelaItensVALOR_UNITARIO_MIN: TFMTBCDField;
    cdsTabelaItensVALOR_TOTAL_MIN: TFMTBCDField;
    cdsTabelaItensVALOR_UNITARIO_MAX: TFMTBCDField;
    cdsTabelaItensVALOR_TOTAL_MAX: TFMTBCDField;
    cdsTabelaItensVALOR_UNITARIO_MEDIA: TFMTBCDField;
    cdsTabelaItensVALOR_TOTAL_MEDIA: TFMTBCDField;
    qryFornecedorVALOR_TOTAL_BRUTO: TFMTBCDField;
    qryFornecedorVALOR_TOTAL_DESCONTO: TFMTBCDField;
    qryFornecedorVALOR_TOTAL_LIQUIDO: TFMTBCDField;
    fdQryTabelaITENS: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnAutorizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirCotacaoClick(Sender: TObject);
    procedure btnCancelarCotacaoClick(Sender: TObject);
    procedure btnFinalizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnFornecedorInserirClick(Sender: TObject);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure BtnFornecedorEditarClick(Sender: TObject);
    procedure BtnFornecedorOpcoesClick(Sender: TObject);
    procedure nmGerarArquivoXLSClick(Sender: TObject);
    procedure nmProcessarArquivoXLSClick(Sender: TObject);
    procedure dbgFornecedorDblClick(Sender: TObject);
    procedure nmProcessarRespostasClick(Sender: TObject);
    procedure nmImprimirCotacaoMapaClick(Sender: TObject);
    procedure BtnFornecedorExcluirClick(Sender: TObject);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure qryFornecedorVENCEDORGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens       ,
    SQL_Fornecedores: TStringList;
    iFornecedor     : Integer;
    procedure AbrirTabelaItens(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure AbrirTabelaFornecedores(const AnoCotacao : Smallint; const CodigoCotacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);
    procedure SetCotacaoFornecedorItem;
    procedure SetCotacaoFornecedorProcessa(Empresa : String; Ano : Smallint; Codigo : Integer);

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarCotacaoID : String;
    function GetRotinaManterFornecedorID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarCotacaoID : String read GetRotinaCancelarCotacaoID;
    property RotinaManterFornecedorID : String read GetRotinaManterFornecedorID;
  end;

(*
  Tabelas:
  - TBCOTACAO_COMPRA
  - TBCOTACAO_COMPRAITEM
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCOTACAO_COMPRAFORN
  - TBCOTACAO_COMPRAFORN_ITEM
  - TBFORNECEDOR
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO
  - VW_TIPO_COTACAO

  Procedures:
  - SET_COTACAO_COMPRAFORN_ITEM
  - SET_COTACAO_COMPRAFORN_PROCESSA
*)

var
  frmGeCotacaoCompra: TfrmGeCotacaoCompra;

  procedure MostrarControleCotacao(const AOwner : TComponent);

  function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
    System.StrUtils
  , System.DateUtils
  , SysConst
  , Controller.Tabela
  , UConstantesDGE
  , UDMBusiness
  , UDMRecursos
  , UDMNFe
  , View.Produto
  , UGeCotacaoCompraCancelar
  , UGeCotacaoCompraFornecedor
  , View.Fornecedor
  , UFuncoes;

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

function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  frm : TfrmGeCotacaoCompra;
  sNome : String;
  I : Integer;
begin
  frm := TfrmGeCotacaoCompra.Create(AOwner);
  try
    with frm do
    begin
      btbtnIncluir.Visible        := False;
      btnFinalizarCotacao.Visible := False;
      btnAutorizarCotacao.Visible := False;
      btnCancelarCotacao.Visible  := False;

      RdgStatusCotacao.ItemIndex := STATUS_COTACAO_COT + 1;

      RdgStatusCotacao.Enabled := False;
      //for I := 0 to frm.RdgStatusCotacao.Items.Count - 1 do
      //  frm.RdgStatusCotacao.Controls[I].Enabled := False;

      iFornecedor := 0; //Fornecedor;
      e1Data.Date := DataInicial;
      WhereAdditional := //'(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
              'cast(c.emissao_data as date) between ' +
              QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
              QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

      if (RdgStatusCotacao.ItemIndex > 0) then
        WhereAdditional := frm.WhereAdditional + ' and (c.status = ' + IntToStr(frm.RdgStatusCotacao.ItemIndex - 1) + ')';

      with fdQryTabela do
      begin
        Close;
        SQL.Add('where ' + WhereAdditional);
        SQL.Add('order by ' + CampoDescricao);
        Open;
      end;

      Result := SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

      if ( Result ) then
      begin
        Ano     := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        Codigo  := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        Empresa := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      end;
    end;
  finally
    frm.Destroy;
  end;

end;

procedure TfrmGeCotacaoCompra.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_COTACAO_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));
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

  SQL_Fornecedores := TStringList.Create;
  SQL_Fornecedores.Clear;
  SQL_Fornecedores.AddStrings( qryFornecedor.SQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iFornecedor      := 0;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoCotacao);
  CarregarLista(fdQryFormaPagto);
  CarregarLista(fdQryCondicaoPagto);
  CarregarLista(cdsTransportador);

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

  Tabela
    .Display('CODIGO', 'C�digo', '###00000', TAlignment.taCenter)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:mm')
    .Display('VALOR_REF_TOTAL',      'Valor Refer�ncia', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_MAX_BRUTO',      'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MAX_DESCONTO',   'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MAX_TOTAL',      'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_BRUTO',      'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_DESCONTO',   'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_TOTAL',      'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_BRUTO',    'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_DESCONTO', 'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_TOTAL',    'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  TTabelaController
    .New
    .Tabela( cdsTabelaItens )
    .Display('SEQ', '#', '#00', TAlignment.taCenter)
    .Display('QUANTIDADE', 'Quantidade', ',0.###', TAlignment.taRightJustify)
    .Display('VALOR_UNITARIO_REF',   'Valor Ref.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_REF',      'Total Ref.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_UNITARIO_MIN',   'Valor Min.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_MIN',      'Total Min.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_UNITARIO_MAX',   'Valor Max.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_MAX',      'Total Max.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_UNITARIO_MEDIA', 'Valor Med.', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_MEDIA',    'Total Med.', ',0.00#', TAlignment.taRightJustify)
    .Configurar( cdsTabelaItens );

  TTabelaController
    .New
    .Tabela( qryFornecedor )
    .Display('VALOR_TOTAL_BRUTO',    'Total Bruto',    ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_DESCONTO', 'Total Desconto', ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_LIQUIDO',  'Total L�quido',  ',0.00#', TAlignment.taRightJustify)
    .Configurar( qryFornecedor );
end;

procedure TfrmGeCotacaoCompra.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;
  with DtSrcTabela.DataSet do
    if ( not OcorreuErro ) then
    begin
      FieldByName('ANO').AsInteger    := iAno;
      FieldByName('CODIGO').AsInteger := iNum;
      FieldByName('NUMERO').AsString  := FormatFloat('##0000000', FieldByName('CODIGO').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    end;
end;

procedure TfrmGeCotacaoCompra.AbrirTabelaItens(
  const AnoCotacao: Smallint; const CodigoCotacao: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano    = ' + IntToStr(AnoCotacao));
    Add('  and i.codigo = ' + IntToStr(CodigoCotacao));
    Add('order by i.ano, i.codigo, i.seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarCotacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_EDC) and (not cdsTabelaItens.IsEmpty);
      btnAutorizarCotacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) and (not cdsTabelaItens.IsEmpty);
      btnCancelarCotacao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT);

      nmImprimirCotacao.Enabled     := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
      nmImprimirCotacaoMapa.Enabled := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);

      dtsFornecedor.AutoEdit := (not IsEmpty) and (State = dsBrowse) and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC);
      dtsFornecedorStateChange( dtsFornecedor );
    end
    else
    begin
      btnFinalizarCotacao.Enabled := False;
      btnAutorizarCotacao.Enabled := False;
      btnCancelarCotacao.Enabled  := False;

      nmImprimirCotacao.Enabled     := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
      nmImprimirCotacaoMapa.Enabled := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      Exit;

    if IsEmpty then
      sID := EmptyStr
    else
      sID := FieldByName('NUMERO').AsString;

    if ( sID <> EmptyStr ) then
    begin
      iAno := FieldByName('ANO').AsInteger;
      iCod := FieldByName('CODIGO').AsInteger;

      if ( not FieldByName('EMISSAO_DATA').IsNull ) then
      begin
        if ( FieldByName('EMISSAO_DATA').AsDateTime < e1Data.Date ) then
          e1Data.Date := FieldByName('EMISSAO_DATA').AsDateTime;

        if ( FieldByName('EMISSAO_DATA').AsDateTime > e2Data.Date ) then
          e2Data.Date := FieldByName('EMISSAO_DATA').AsDateTime;
      end;
    end;

    fdQryTabela.RefreshRecord;
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_COTACAO_COT ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_COTACAO_ENC : sMsg := 'Esta cota��o n�o pode ser alterada por j� est� autorizada/encerrada.';
        STATUS_COTACAO_CAN : sMsg := 'Esta cota��o n�o pode ser alterada porque est� cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) then
        if not ShowConfirm('A edi��o da cota��o selecionada est� em andamento.' + #13 + 'Deseja coloc�-la em edi��o novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
        AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_COTACAO_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_COTACAO_COT : sMsg := 'Esta cota��o n�o pode ser exclu�da porque j� est� aguardando encerramento.';
        STATUS_COTACAO_ENC : sMsg := 'Esta cota��o n�o pode ser exclu�da por j� est� autorizada/encerrada.';
        STATUS_COTACAO_CAN : sMsg := 'Esta cota��o n�o pode ser exclu�da porque est� cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
        AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
      end;
    end;
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
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( Trim(DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descri��o resumo para a cota��o!');
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
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;
(*
      GetToTais(cTotalReferencia);

      FieldByName('VALOR_REF_TOTAL.AsCurrency := cTotalReferencia;
*)
    end;
end;

procedure TfrmGeCotacaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Referencia : Currency);
  var
    Item : Integer;
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
      ShowWarning('Favor informar o c�digo do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
//    else
//    if ( (cdsTabelaItensIPI_PERCENTUAL.AsCurrency < 0) or (cdsTabelaItensIPI_PERCENTUAL.AsCurrency > 100) ) then
//    begin
//      ShowWarning('Percentual do IPI inv�lido.');
//      dbPercentualIPI.SetFocus;
//    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalReferencia);

      DtSrcTabela.DataSet.FieldByName('VALOR_REF_TOTAL').AsCurrency := cTotalReferencia;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeCotacaoCompra.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    cdsTabelaItensANO.Value        := FieldByName('ANO').Value;
    cdsTabelaItensCODIGO.Value     := FieldByName('CODIGO').Value;
    cdsTabelaItensEMPRESA.Value    := FieldByName('EMPRESA').Value;
    cdsTabelaItensQUANTIDADE.Value := 1;
    cdsTabelaItensVALOR_UNITARIO_REF.AsCurrency := 0.0;
    cdsTabelaItensVALOR_TOTAL_REF.AsCurrency    := 0.0;
    cdsTabelaItensUSUARIO.Value                 := gUsuarioLogado.Login;

    cdsTabelaItensVALOR_UNITARIO_MAX.AsCurrency   := 0.0;
    cdsTabelaItensVALOR_UNITARIO_MIN.AsCurrency   := 0.0;
    cdsTabelaItensVALOR_UNITARIO_MEDIA.AsCurrency := 0.0;
    cdsTabelaItensVALOR_TOTAL_MAX.AsCurrency      := 0.0;
    cdsTabelaItensVALOR_TOTAL_MIN.AsCurrency      := 0.0;
    cdsTabelaItensVALOR_TOTAL_MEDIA.AsCurrency    := 0.0;

    cdsTabelaItensPRODUTO.Clear;
    cdsTabelaItensDESCRI_APRESENTACAO.Clear;
    cdsTabelaItensUNIDADE.Clear;
    cdsTabelaItensUNP_SIGLA.Clear;
  end;
end;

procedure TfrmGeCotacaoCompra.btnAutorizarCotacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    RecarregarRegistro;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);
    AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

    if not (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) then
      ShowInformation('Apenas cota��es que j� possuem respostas de fornecedores poder ser autorizadas/encerradas!')
    else
    if (qryFornecedor.RecordCount < FieldByName('NUMERO_MINIMO_FORNECEDOR').Value) then
      ShowInformation(
        Format('Para que a cota��o possa ser autorizada/encerrada, esta deve possuir respostas de, no m�nimo, %s fornecedor(es).',
          [FieldByName('NUMERO_MINIMO_FORNECEDOR').AsString]))
    else
    if ( ShowConfirm('Confirma a autoriza��o do cota��o selecionada?') ) then
    begin
      fdQryTabela.Edit;

      FieldByName('STATUS').Value             := STATUS_COTACAO_ENC;
      FieldByName('AUTORIZADA_DATA').Value    := GetDateDB;
      FieldByName('AUTORIZADA_USUARIO').Value := gUsuarioLogado.Login;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Cota��o Autorizada/Encerrada realizada com sucesso !' + #13#13 +
        'Ano/N�mero: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusCotacao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  PgcTextoCotacao.ActivePage   := TbsCotacaoMotivo;

  with DtSrcTabela.DataSet do
  begin
    DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC );
    DtSrcTabelaItensStateChange( DtSrcTabelaItens );

    dtsFornecedor.AutoEdit := (not IsEmpty) and (State = dsBrowse) and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC);
    dtsFornecedorStateChange( dtsFornecedor );
  end;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
  end;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  TbsCotacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_CAN);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if Trim(FieldByName('AUTORIZADA_USUARIO').AsString) = EmptyStr then
      FieldByName('AUTORIZADA_USUARIO').Clear;

    if Trim(FieldByName('ENCERRADA_USUARIO').AsString) = EmptyStr then
      FieldByName('ENCERRADA_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').Value             := gUsuarioLogado.Empresa;
    FieldByName('TIPO').Value                := TIPO_COTACAO_COMPRA;
    FieldByName('INSERCAO_DATA').Value       := GetDateTimeDB;
    FieldByName('EMISSAO_DATA').Value        := GetDateDB;
    FieldByName('EMISSAO_USUARIO').Value     := GetUserApp;
    FieldByName('VALIDADE').Value            := FieldByName('EMISSAO_DATA').Value + GetPrazoValidadeCotacaoCompra(FieldByName('EMPRESA').AsString);
    FieldByName('STATUS').AsInteger          := STATUS_COTACAO_EDC;
    FieldByName('NOME_CONTATO_INT').AsString := GetUserFullName;

    FieldByName('NUMERO_MINIMO_FORNECEDOR').AsInteger := 3;

    FieldByName('VALOR_REF_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MAX_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MAX_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MAX_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MIN_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MIN_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MIN_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MEDIA_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MEDIA_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MEDIA_TOTAL').AsCurrency    := 0.0;

    FieldByName('DESCRICAO_RESUMO').Clear;
    FieldByName('AUTORIZADA_DATA').Clear;
    FieldByName('AUTORIZADA_USUARIO').Clear;
    FieldByName('ENCERRADA_DATA').Clear;
    FieldByName('ENCERRADA_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
  end;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_COTACAO_EDC : Text := 'Em Edi��o';
    STATUS_COTACAO_ABR : Text := 'Aberta';
    STATUS_COTACAO_COT : Text := 'Em Cota��o';
    STATUS_COTACAO_ENC : Text := 'Autorizada/Encerrada';
    STATUS_COTACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeCotacaoCompra.fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_COTACAO_COMPRA :
        Text := 'Compra';

      TIPO_COTACAO_SERVICO:
        Text := 'Servi�o';

      TIPO_COTACAO_COMPRA_SERVICO:
        Text := 'Compra/Servi�o';
    end;
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
  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
    AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
  end;

  pgcMaisDados.ActivePage := tbsDadoConsolidado;
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
    ShowWarning('Favor informar o c�digo do produto');
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
        ShowWarning('C�digo de produto n�o cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autoriza��o.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar altera��o em andamento no �tem da cota��o!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if GetExisteNumeroCotacao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        ShowWarning('N�mero de cota��o j� existe!');
        Abort;
      end;

      FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));

      inherited;

      if ( not OcorreuErro ) then
      begin

        // Salvar Itens

        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        cdsTabelaItens.CommitUpdates;

        fdQryTabela.RefreshRecord;

        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );
        AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

        SetCotacaoFornecedorItem;
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCotacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbDataEmissao ) then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      DtSrcTabela.DataSet.FieldByName('VALIDADE').Value :=
        DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value +
        GetPrazoValidadeCotacaoCompra(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString);

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
    // Destacar cota��o em edi��o
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_EDC ) then
      dbgDados.Canvas.Brush.Color := lblCotacaoEmEdicao.Color
    else
    // Destacar cota��o aberta
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR ) then
      dbgDados.Canvas.Font.Color := lblCotacaoAberta.Font.Color
    else
    // Destacar cota��o cancelada
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_CAN ) then
      dbgDados.Canvas.Font.Color := lblCotacaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos j� em cota��o
  if ( Sender = dbgProdutos ) then
  begin
//    if ( (FieldByName('STATUS.AsInteger = STATUS_AUTORIZACAO_FAT) and (cdsTabelaItensCONFIRMADO_RECEBIMENTO.AsInteger = 0) ) then
//      dbgProdutos.Canvas.Font.Color := lblAutorizacaoCancelada.Font.Color;
//
//    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end
  else
  // Destacar fornecedores
  if ( Sender = dbgFornecedor ) then
  begin
    if (qryFornecedorATIVO.AsInteger = 0) then
      dbgFornecedor.Canvas.Font.Color := lblCotacaoCancelada.Font.Color;

    dbgFornecedor.DefaultDrawDataCell(Rect, dbgFornecedor.Columns[DataCol].Field, State);
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
  if ( Trim(DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').AsString) = EmptyStr ) then
  begin
    ShowWarning('Favor informar uma descri��o resumo para a cota��o!');
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

    Case DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger of
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
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa,
        GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString),
        dbTipo.Text,
        EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryCotacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      ParamByName('emp').AsString  := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryCotacaoCompraFornecedor do
    begin
      Close;
      ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      ParamByName('frn').AsInteger   := 0;
      ParamByName('todos').AsInteger := 0;
      Open;
    end;

    frrCotacaoCompra.ShowReport;
  end;
end;

procedure TfrmGeCotacaoCompra.btnCancelarCotacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    RecarregarRegistro;
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);
    AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

    if ( FieldByName('STATUS').AsInteger <> STATUS_COTACAO_COT ) then
      ShowInformation('Apenas registros em cota��o podem ser cancelados!')
    else
    if ( CancelarCOT(Self, FieldByName('ANO').Value, FieldByName('CODIGO').Value) ) then
    begin
      RecarregarRegistro;

      ShowInformation('Cota��o cancelada com sucesso.' + #13#13 +
        'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
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
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    RecarregarRegistro;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger);
    AbrirTabelaFornecedores( FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger );

    if ( ShowConfirm('Confirma a finaliza��o da edi��o do cota��o?') ) then
    begin
      fdQryTabela.Edit;

      FieldByName('STATUS').Value := STATUS_COTACAO_ABR;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Cota��o finalizada com sucesso !' + #13#13 +
        'Ano/N�mero: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusCotacao.ItemIndex := 0;
    end;
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

    with DtSrcTabela.DataSet do
      if (State in [dsEdit, dsInsert])  then
      begin

        if dbNumero.Focused then
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if GetExisteNumeroCotacao(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              ShowWarning('N�mero de cota��o j� existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emiss�o da Autoriza��o }

        if dbDataEmissao.Focused then
          if ( dbDataEmissao.Date > GetDateTimeDB ) then
              ShowWarning('A Data de Emiss�o da cota��o est� maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      end;

  end;

  // Desistir na inser��o de um novo produto/servi�o
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
    cdsTabelaItens.Cancel
  else
    inherited;
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

    if PnlFornecedor.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaManterFornecedorID, PnlFornecedor.Hint, RotinaID);
  end;
end;

procedure TfrmGeCotacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeCotacaoCompra.AbrirTabelaFornecedores(
  const AnoCotacao: Smallint; const CodigoCotacao: Integer);
begin
  qryFornecedor.Close;

  with qryFornecedor, SQL do
  begin
    Clear;
    AddStrings( SQL_Fornecedores );
    Add('where c.ano    = ' + IntToStr(AnoCotacao));
    Add('  and c.codigo = ' + IntToStr(CodigoCotacao));
  end;

  qryFornecedor.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeCotacaoCompra.BtnFornecedorInserirClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    iCodigo := 0;
    if SelecionarFornecedor(Self, iCodigo, sNome) then
    begin
      if qryFornecedor.Locate('FORNECEDOR', iCodigo, []) then
      begin
        ShowWarning('Fornecedor selecionado j� inserido na Cota��o!');
        Abort;
      end;

      if CotacaoFornecedor(Self
        , cfoInserir
        , DtSrcTabela.DataSet.FieldByName('EMPRESA').Value
        , DtSrcTabela.DataSet.FieldByName('ANO').Value
        , DtSrcTabela.DataSet.FieldByName('CODIGO').Value
        , iCodigo
        , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
        , EmptyStr
        , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
        , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
      begin

        AbrirTabelaFornecedores( DtSrcTabela.DataSet.FieldByName('ANO').Value, DtSrcTabela.DataSet.FieldByName('CODIGO').Value );

      end;
    end;
  end;
end;

function TfrmGeCotacaoCompra.GetRotinaManterFornecedorID: String;
begin
  Result := GetRotinaInternaID(PnlFornecedor);
end;

procedure TfrmGeCotacaoCompra.dtsFornecedorStateChange(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    btnFornecedorInserir.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) );
    btnFornecedorEditar.Enabled  := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );
    btnFornecedorExcluir.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );

    BtnFornecedorOpcoes.Enabled   := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) );
    nmGerarArquivoXLS.Enabled     := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) ) and ( FieldByName('STATUS').AsInteger in [STATUS_COTACAO_ABR, STATUS_COTACAO_COT] );
    nmProcessarArquivoXLS.Enabled := ( dtsFornecedor.AutoEdit and (qryFornecedor.State = dsBrowse) and (not qryFornecedor.IsEmpty) ) and ( FieldByName('STATUS').AsInteger in [STATUS_COTACAO_ABR, STATUS_COTACAO_COT] );
  end;
end;

procedure TfrmGeCotacaoCompra.BtnFornecedorEditarClick(Sender: TObject);
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    if CotacaoFornecedor(Self
      , cfoEditar
      , qryFornecedorEMPRESA.Value
      , qryFornecedorANO.Value
      , qryFornecedorCODIGO.Value
      , qryFornecedorFORNECEDOR.Value
      , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
      , EmptyStr
      , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
      , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
    begin

      AbrirTabelaFornecedores( DtSrcTabela.DataSet.FieldByName('ANO').Value, DtSrcTabela.DataSet.FieldByName('CODIGO').Value );

    end;
  end;
end;

procedure TfrmGeCotacaoCompra.BtnFornecedorOpcoesClick(
  Sender: TObject);
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  ppCotacaoFornecedor.Popup(BtnFornecedorOpcoes.ClientOrigin.X, BtnFornecedorOpcoes.ClientOrigin.Y + BtnFornecedorOpcoes.Height);
end;

procedure TfrmGeCotacaoCompra.qryFornecedorVENCEDORGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( not Sender.IsNull ) then
    Case Sender.AsInteger of
      0 : Text := EmptyStr;
      1 : Text := 'X';
    end;
end;

procedure TfrmGeCotacaoCompra.SetEventoLOG(sEvento: String);
var
  sMensagem : String;
begin
  sMensagem := FormatDateTime('dd/mm/yyyy hh:mm', Now) + ' - ' + sEvento + ' (por ' + gUsuarioLogado.Login + ').';
  try
    if ( not fdQryTabela.IsEmpty ) then
    begin
      fdQryTabela.Edit;

      dbEventoLOG.Lines.Add(sMensagem);

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;
    end;
  finally
  end;
end;

procedure TfrmGeCotacaoCompra.nmGerarArquivoXLSClick(Sender: TObject);
var
  sID       ,
  sMensagem ,
  sFileName : String;
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa, GetEmailEmpresa(qryFornecedorEMPRESA.AsString), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := qryFornecedorEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := qryFornecedorANO.AsInteger;
      ParamByName('cod').AsInteger := qryFornecedorCODIGO.AsInteger;
      ParamByName('emp').AsString  := qryFornecedorEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompraFornecedor do
    begin
      Close;
      ParamByName('ano').AsInteger   := qryFornecedorANO.AsInteger;
      ParamByName('cod').AsInteger   := qryFornecedorCODIGO.AsInteger;
      ParamByName('emp').AsString    := qryFornecedorEMPRESA.AsString;
      ParamByName('frn').AsInteger   := qryFornecedorFORNECEDOR.AsInteger;
      ParamByName('todos').AsInteger := 0;
      Open;
    end;

    sID       := FormatFloat('00000', qryFornecedorFORNECEDOR.AsInteger);
    sFileName := Path_MeusDocumentos + '\' +
      'COTACAO_' + sID + '.' + qryFornecedorEMPRESA.AsString + '_' +
        StringReplace(DtSrcTabela.DataSet.FieldByName('NUMERO').AsString, '/', '-', [rfReplaceAll]) + '.xls';

    ExportarFR3_ToXSL(frrCotacaoCompra, sFileName);

    ElaborarFormulaTravarCelulasXLS(Self,
      qryFornecedorEMPRESA.AsString, qryFornecedorANO.AsInteger, qryFornecedorCODIGO.AsInteger, qryFornecedorFORNECEDOR.AsInteger,
      qryFornecedorCNPJ.AsString, sFileName);

    if FileExists(sFileName) then
    begin

      SetEventoLOG('Planilha de cota��o gerada para o Fornecedor ' + qryFornecedorNOMEFORN.AsString);

      sMensagem := 'Arquivo gerado com sucesso:' + #13 + sFileName + #13#13 +
        'Deseja que este arquivo seja enviado por e-mail para o fornecedor?';

      if ShowConfirm(sMensagem) then
      begin
        if DMNFe.EnviarEmail_Generico(qryFornecedorEMPRESA.AsString
          , DtSrcTabela.DataSet.FieldByName('NUMERO').Value
          , qryFornecedorEMAIL_ENVIO.AsString
          , sFileName) then
        begin
          SetEventoLOG('Planilha de cota��o enviada por e-mail para o Fornecedor ' + qryFornecedorNOMEFORN.AsString);
          ShowInformation(Format('E-mail enviado com sucesso para ''%s''', [qryFornecedorEMAIL_ENVIO.AsString]));
        end;
      end;

    end;
  end;
end;

procedure TfrmGeCotacaoCompra.nmProcessarArquivoXLSClick(Sender: TObject);
var
  sID       ,
  sMensagem ,
  sFileName : String;
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  sID       := FormatFloat('00000', qryFornecedorFORNECEDOR.AsInteger);
  sFileName := Path_MeusDocumentos + '\' +
    'COTACAO_' + sID + '.' + qryFornecedorEMPRESA.AsString + '_' +
      StringReplace(DtSrcTabela.DataSet.FieldByName('NUMERO').AsString, '/', '-', [rfReplaceAll]) + '.xls';

  opdCotacaoFornecedor.FileName := sFileName;

  if opdCotacaoFornecedor.Execute then
    sFileName := opdCotacaoFornecedor.FileName
  else
    Exit;

  if CotacaoFornecedor(Self
    , cfoCarregarPlanilha
    , qryFornecedorEMPRESA.Value
    , qryFornecedorANO.Value
    , qryFornecedorCODIGO.Value
    , qryFornecedorFORNECEDOR.Value
    , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
    , sFileName
    , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
    , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
  begin
    SetEventoLOG(Format('Arquivo ''%s'' de resposta do fornecedor %s processado', [sFileName, qryFornecedorNOMEFORN.AsString]));

    RecarregarRegistro;

    AbrirTabelaFornecedores( qryFornecedorANO.Value, qryFornecedorCODIGO.Value );
  end;
end;

procedure TfrmGeCotacaoCompra.dbgFornecedorDblClick(Sender: TObject);
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  if CotacaoFornecedor(Self
    , cfoVisualizar
    , qryFornecedorEMPRESA.Value
    , qryFornecedorANO.Value
    , qryFornecedorCODIGO.Value
    , qryFornecedorFORNECEDOR.Value
    , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
    , EmptyStr
    , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
    , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
      ;
end;

procedure TfrmGeCotacaoCompra.nmProcessarRespostasClick(Sender: TObject);
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger <> STATUS_COTACAO_COT ) then
      ShowInformation('Apenas Cota��es com situa��o "Em Cota��o" podem ser processadas')
    else
    if (qryFornecedor.RecordCount < FieldByName('NUMERO_MINIMO_FORNECEDOR').Value) then
      ShowInformation(
        Format('Para que a cota��o possa ser processada, esta deve possuir respostas de, no m�nimo, %s fornecedor(es).',
          [FieldByName('NUMERO_MINIMO_FORNECEDOR').AsString]))
    else
    if ShowConfirm('Deseja executar processamento da(s) resposta(s) do(s) fornecedor(es)?') then
    begin
      SetCotacaoFornecedorProcessa(FieldByName('EMPRESA').Value, FieldByName('ANO').Value, FieldByName('CODIGO').Value);

      AbrirTabelaItens( FieldByName('ANO').Value, FieldByName('CODIGO').Value );
      AbrirTabelaFornecedores( FieldByName('ANO').Value, FieldByName('CODIGO').Value );

      RecarregarRegistro;

      pgcMaisDados.ActivePage := tbsFornecedor;
    end;
  end;
end;

procedure TfrmGeCotacaoCompra.SetCotacaoFornecedorItem;
begin
  qryFornecedor.First;

  while not qryFornecedor.Eof do
  begin
    with spSetCotacaoFornecedorItem do
    begin
      ParamByName('ano').AsSmallInt       := qryFornecedorANO.AsInteger;
      ParamByName('codigo').AsInteger     := qryFornecedorCODIGO.AsInteger;
      ParamByName('empresa').AsString     := qryFornecedorEMPRESA.AsString;
      ParamByName('fornecedor').AsInteger := qryFornecedorFORNECEDOR.AsInteger;

      ExecProc;
    end;

    qryFornecedor.Next;
  end;
  CommitTransaction;

  qryFornecedor.Close;
  qryFornecedor.Open;
end;

procedure TfrmGeCotacaoCompra.SetCotacaoFornecedorProcessa(Empresa: String;
  Ano: Smallint; Codigo: Integer);
begin
  with spSetCotacaoFornecedorProcessa do
  begin
    ParamByName('ano').AsSmallInt   := Ano;
    ParamByName('codigo').AsInteger := Codigo;
    ParamByName('empresa').AsString := Empresa;

    ExecProc;
    CommitTransaction;
  end;
end;

procedure TfrmGeCotacaoCompra.nmImprimirCotacaoMapaClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('VALOR_MAX_TOTAL').AsCurrency = 0.0 ) then
    ShowWarning('N�o � poss�vel montar ainda o mapa de pre�os por n�o haver respostas de fornecedores!')
  else
    with DMNFe do
    begin

      try
        ConfigurarEmail(gUsuarioLogado.Empresa,
          GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString),
          dbTipo.Text,
          EmptyStr);
      except
      end;

      with qryEmitente do
      begin
        Close;
        ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        Open;
      end;

      with qryCotacaoCompra do
      begin
        Close;
        ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString  := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        Open;
      end;

      with qryCotacaoCompraFornecedor do
      begin
        Close;
        ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        ParamByName('frn').AsInteger   := 0;
        ParamByName('todos').AsInteger := 1;
        Open;
      end;

      with qryCotacaoCompraFornecedorItem do
      begin
        Close;
        ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        ParamByName('frn').AsInteger   := 0;
        ParamByName('todos').AsInteger := 1;
        Open;
      end;

      frrCotacaoCompraMapaPreco.ShowReport;
    end;
end;

procedure TfrmGeCotacaoCompra.BtnFornecedorExcluirClick(Sender: TObject);
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    if ( not qryFornecedor.IsEmpty ) then
      if ( ShowConfirm('Deseja excluir o fornecedor selecionado?') ) then
      begin
        qryFornecedor.Delete;
        //qryFornecedor.ApplyUpdates;

        RecarregarRegistro;
        pgcMaisDados.ActivePage := tbsFornecedor;
      end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeCotacaoCompra', TfrmGeCotacaoCompra);

end.
