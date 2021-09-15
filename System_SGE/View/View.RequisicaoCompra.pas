unit View.RequisicaoCompra;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewRequisicaoCompra = class(TViewPadraoCadastro)
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
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView,
    FControllerTipoRequisicaoView,
    FControllerFormaPagto ,
    FControllerCondicaoPagtoView,
    FControllerTransportadora   : IControllerCustom;
    FControllerProduto    : IControllerProduto;
    FControllerFornecedor : IControllerFornecedor;

    iSeq : Integer;
    iFornecedor : Integer;

    procedure AbrirTabelaItens;
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);

    function Controller : IControllerRequisicaoCompra;
    function Produtos : IControllerCustom;
    function Empresa : IControllerEmpresa;
    function Fornecedor : IControllerFornecedor;

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
  ViewRequisicaoCompra: TViewRequisicaoCompra;

  procedure MostrarControleRequisicao(const AOwner : TComponent);

  function SelecionarRequisicao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
    System.DateUtils
  , System.SysConst
  , UDMRecursos
  , UDMBusiness
  , UDMNFe
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , Service.Message
  , View.Fornecedor
  , View.Produto
  , View.RequisicaoCompra.Cancelar
  , View.Cliente
  , View.CentroCusto;

{$R *.dfm}

procedure MostrarControleRequisicao(const AOwner : TComponent);
var
  AForm : TViewRequisicaoCompra;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewRequisicaoCompra.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);


    AForm.WhereAdditional :=
      '(cast(r.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(r.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusRequisicao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (r.status = ' + IntToStr(AForm.RdgStatusRequisicao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarRequisicao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  AForm : TViewRequisicaoCompra;
  aDataInicio,
  aDataFinal ,
  aNome      : String;
  I : Integer;
begin
  AForm := TViewRequisicaoCompra.Create(AOwner);
  try
    AForm.btbtnIncluir.Visible           := False;
    AForm.btnFinalizarRequisicao.Visible := False;
    AForm.btnRequisitarReabrir.Visible   := False;
    AForm.btnCancelarRequisicao.Visible  := False;

    AForm.RdgStatusRequisicao.ItemIndex := STATUS_REQUISICAO_REQ + 1;
    AForm.RdgStatusRequisicao.Enabled   := False;

    AForm.iFornecedor := Fornecedor;
    AForm.e1Data.Date := DataInicial;

    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    AForm.WhereAdditional :=
      '(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
      '(cast(r.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(r.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusRequisicao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (r.status = ' + IntToStr(AForm.RdgStatusRequisicao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    Result := AForm.SelecionarRegistro(Codigo, aNome, AForm.WhereAdditional);

    if Result then
    begin
      Ano     := AForm.DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      Codigo  := AForm.DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      Empresa := AForm.DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
    end;
  finally
    AForm.Destroy;
  end;

end;

procedure TViewRequisicaoCompra.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.RequisicaoCompra;

  FControllerEmpresaView         := TControllerFactory.New.EmpresaView;
  FControllerTipoRequisicaoView  := TControllerFactory.New.TipoRequisicaoView;
  FControllerFormaPagto          := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView   := TControllerFactory.New.CondicaoPagtoView;
  FControllerTransportadora      := TControllerFactory.New.Transportadora;

  DtSrcTabelaItens.DataSet := Produtos.DAO.DataSet;

  inherited;

  e1Data.Date      := IncDay(Date, -30);
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;
  iFornecedor      := 0;


  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_REQUISICAO_CMP_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISITA_COMPRA';
  CampoCodigo    := 'r.codigo';
  CampoDescricao := 'f.nomeforn';
  CampoOrdenacao := 'r.emissao_data, f.nomeforn';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(cast(r.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '(r.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  lblCliente.Visible :=  Empresa.GetAutorizacaoInformarCliente(FController.DAO.Usuario.Empresa.CNPJ);
  dbCliente.Visible  := lblCliente.Visible;

  Tabela
    .Display('CODIGO',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('EMPRESA', 'Empresa', TAlignment.taLeftJustify, True)
    .Display('FORNECEDOR', 'Fornecedor', TAlignment.taLeftJustify, True)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:nn', TAlignment.taLeftJustify, True)
    .Display('TIPO', 'Tipo', TAlignment.taLeftJustify, True)
    .Display('FORMA_PAGTO', 'Forma de Pagamento', TAlignment.taLeftJustify, True)
    .Display('CONDICAO_PAGTO', 'Condição de Pagamento', TAlignment.taLeftJustify, True)
    .Display('VALOR_BRUTO', 'Valor Bruto', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_DESCONTO', 'Descontos', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL_FRETE', 'Frete', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL_IPI', 'IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL', 'Valor Total', ',0.00', TAlignment.taRightJustify, True)
    .Display('FATURAMENTO_MINIMO', 'Faturamento Mínimo', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoRequisicaoView)
    .LookupComboBox(dbTipo, dtsTipoRequisicao, 'tipo', 'codigo', 'descricao');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FORMA_PAGTO', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'CONDICAO_PAGTO', 'cond_cod', 'cond_descricao');

  TController(FControllerTransportadora)
    .LookupComboBox(dbTransportador, dtsTransportador, 'transportador', 'codforn', 'nomeforn');
end;

procedure TViewRequisicaoCompra.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    DtSrcTabela.DataSet.FieldByName('NUMERO').AsString :=
      FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger) + '/' +
        Copy(DtSrcTabela.DataSet.FieldByName('ANO').AsString, 3, 2);

    AbrirTabelaItens;
  end;
end;

procedure TViewRequisicaoCompra.AbrirTabelaItens;
begin
  Controller.CarregarProdutos;

  TTabelaController
    .New
    .Tabela(DtSrcTabelaItens.DataSet)
    .Display('SEQ', '#', '#00', TAlignment.taCenter, True)
    .Display('PRODUTO', 'Produto/Serviço', TAlignment.taLeftJustify, True)
    .Display('QUANTIDADE', 'Quantidade', ',0.###', TAlignment.taRightJustify, True)
    .Display('VALOR_UNITARIO', 'Valor Unit.', ',0.00', TAlignment.taRightJustify, True)
    .Display('IPI_PERCENTUAL', '% IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('IPI_VALOR_TOTAL', 'Valor IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL', 'Valor Total', ',0.00', TAlignment.taRightJustify, True)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarRequisicao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_EDC) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnRequisitarReabrir.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_EDC, STATUS_REQUISICAO_ABR, STATUS_REQUISICAO_REQ]);
      ppmRequisitarCompra.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_EDC, STATUS_REQUISICAO_ABR]) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      ppmReabrirRequisicao.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ);
      btnCancelarRequisicao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ);

      nmImprimirRequisicao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ) or (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_FAT);
    end
    else
    begin
      btnFinalizarRequisicao.Enabled := False;
      btnRequisitarReabrir.Enabled   := False;
      ppmRequisitarCompra.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      ppmReabrirRequisicao.Enabled   := False;
      btnCancelarRequisicao.Enabled  := False;

      nmImprimirRequisicao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_REQ) or (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_FAT);
    end;
end;

procedure TViewRequisicaoCompra.RecarregarRegistro;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if (not DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').IsNull) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime < e1Data.Date ) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime;

    if ( DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime > e2Data.Date ) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime;
  end;

  FController.DAO.RefreshRecord;
end;

procedure TViewRequisicaoCompra.btbtnAlterarClick(Sender: TObject);
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

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) then
        if not TServiceMessage.ShowConfirm('A edição da requisição selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        FieldByName('STATUS').AsInteger := STATUS_REQUISICAO_EDC;
        AbrirTabelaItens;
      end;
    end;
end;

procedure TViewRequisicaoCompra.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    AbrirTabelaItens;
end;

procedure TViewRequisicaoCompra.btbtnExcluirClick(Sender: TObject);
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

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
        AbrirTabelaItens;
    end;
end;

procedure TViewRequisicaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewRequisicaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := DtSrcTabelaItens.DataSet.RecordCount + 1;
    while ( DtSrcTabelaItens.DataSet.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger = 0 ) then
  begin
    TServiceMessage.ShowWarning('Favor selecionar o fornecedor para a requisição!');
    dbFornecedor.SetFocus;
  end
  else
  if ( DtSrcTabelaItens.DataSet.Active ) then
  begin
    GerarSequencial(Sequencial);

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    DtSrcTabelaItens.DataSet.FieldByName('CODIGO').Assign( DtSrcTabela.DataSet.FieldByName('CODIGO') );
    DtSrcTabelaItens.DataSet.FieldByName('EMPRESA').Assign( DtSrcTabela.DataSet.FieldByName('EMPRESA') );
    DtSrcTabelaItens.DataSet.FieldByName('FORNECEDOR').Assign( DtSrcTabela.DataSet.FieldByName('FORNECEDOR') );

    DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TViewRequisicaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not DtSrcTabelaItens.DataSet.IsEmpty ) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewRequisicaoCompra.btnProdutoExcluirClick(Sender: TObject);
(*
  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ').AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO').AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
  end;
*)
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if ( TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewRequisicaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

    Total_Bruto    := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Bruto := Total_Bruto + DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency;
      Total_IPI   := Total_IPI   + DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_desconto;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalFrete   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if (Trim(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString) = EmptyStr) then
    begin
      TServiceMessage.ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency < 0) then
    begin
      TServiceMessage.ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Valor Unitário inválido.');
      dbValorUn.SetFocus;
    end
    else
    if ((DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency < 0) or (DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency > 100)) then
    begin
      TServiceMessage.ShowWarning('Percentual do IPI inválido.');
      dbPercentualIPI.Field.AsCurrency := 0.0;
      dbPercentualIPI.SetFocus;
    end
    else
    begin
      DtSrcTabelaItens.DataSet.Post;

      GetToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      DtSrcTabela.DataSet.FieldByName('VALOR_BRUTO').AsCurrency     := cTotalBruto;
      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL_IPI').AsCurrency := cTotalIPI;
      DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency  := cTotalDesconto;
      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency     := cTotalLiquido;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TViewRequisicaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex  := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_REQUISICAO_REQ );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

function TViewRequisicaoCompra.Empresa: IControllerEmpresa;
begin
  Result := FControllerEmpresaView as IControllerEmpresa;
end;

procedure TViewRequisicaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]);

  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if (dbProduto.Visible and dbProduto.Enabled) then
      dbProduto.SetFocus;
end;

procedure TViewRequisicaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    pgcMaisDados.ActivePage := tbsFormaPagto;
    TbsRequisicaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_Requisicao_CAN);
  end;

  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoCompra.ppmReabrirRequisicaoClick(Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('AUTORIZACOES').AsInteger > 0) then
      TServiceMessage.ShowWarning('A Requisição possui autorizações de compra/serviço gerada!' + #13 + 'Favor excluir o registro de autorização para que a requisição possa ser reaberta.')
    else
    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ABR) then
      TServiceMessage.ShowWarning('A Requisição já está aberta!')
    else
    if (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_FAT, STATUS_REQUISICAO_CAN]) then
      TServiceMessage.ShowWarning('Apenas registros "Requisitados" podem ser reabertos!')
    else
    begin
      AbrirTabelaItens;

      if TServiceMessage.ShowConfirm('Confirma a reabertura do registro selecionado?') then
        try
          Edit;

          FieldByName('STATUS').AsInteger := STATUS_AUTORIZACAO_ABR;
          FieldByName('REQUISITADO_DATA').Clear;
          FieldByName('REQUISITADO_USUARIO').Clear;
          PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

          dbObservacao.Lines.Add(
            Format('Requisição reaberta para correção por %s em %s.',
              [FController.DAO.Usuario.Login, FormatDateTime('dd/mm/yyyy "às" hh:mm', Now)])
          );

          DtSrcTabela.DataSet.Post;

          FController.DAO.ApplyUpdates;
          FController.DAO.CommitUpdates;
          FController.DAO.CommitTransaction;

          TServiceMessage.ShowInformation('Requisição reaberta com sucesso !');

          HabilitarDesabilitar_Btns;

          RdgStatusRequisicao.ItemIndex := 0;
        finally
        end;
    end;
  end;
end;

procedure TViewRequisicaoCompra.ppmRequisitarCompraClick(Sender: TObject);
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
      TServiceMessage.ShowWarning('Lançamento já está requisitado!');
      Abort;
    end;

    AbrirTabelaItens;

    ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

    if ( FieldByName('VALOR_TOTAL').AsCurrency <> cTotalLiquido ) then
    begin
      TServiceMessage.ShowWarning('A soma dos valores totais dos itens (' +
        FormatFloat('"R$ ",0.00', cTotalLiquido) +
        ') não confere com o Valor Total da Requisição.' + #13#13 +
        'Favor excute os seguintes procedimentos:' + #13 +
        '1. Altere o registro para correção.'      + #13 +
        '2. Salve a alteração realizada.'          + #13 +
        '3. Finalize-o novamente.');
      Abort;
    end;

    if TServiceMessage.ShowConfirm('Confirma a autorização do registro selecionado?') then
    begin
      if (FieldByName('FATURAMENTO_MINIMO').AsCurrency > 0.0) and (cTotalLiquido > FieldByName('FATURAMENTO_MINIMO').AsCurrency) then
      begin
        TServiceMessage.ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa requisição de compra/serviço seja requisitadas!',
          [FormatFloat('"R$ ",0.00', FieldByName('FATURAMENTO_MINIMO').AsCurrency)]));
        Exit;
      end;

      Edit;

      FieldByName('STATUS').AsInteger             := STATUS_REQUISICAO_REQ;
      FieldByName('REQUISITADO_DATA').AsDateTime  := Now;
      FieldByName('REQUISITADO_USUARIO').AsString := FController.DAO.Usuario.Login;

      DtSrcTabela.DataSet.Post;

      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Requisição realizada com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

function TViewRequisicaoCompra.Produtos: IControllerCustom;
begin
  Result := Controller.Produtos;
end;

procedure TViewRequisicaoCompra.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(r.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  WhereAdditional := WhereAdditional +
    IfThen(iFornecedor = 0, EmptyStr,
      ' and (r.fornecedor = ' + IntToStr(iFornecedor) + ') and ') +
      ' and (cast(r.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ')';

  if (RdgStatusRequisicao.ItemIndex > 0) then
    WhereAdditional := WhereAdditional + ' and (r.status = ' + IntToStr(RdgStatusRequisicao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TViewRequisicaoCompra.dbFornecedorButtonClick(Sender: TObject);
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

procedure TViewRequisicaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if ( not DtSrcTabelaItens.DataSet.Active ) then
    Exit
  else
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if not Assigned(FControllerProduto) then
      FControllerProduto := TControllerFactory.New.Produto;

    with FControllerProduto.Get(Codigo).DataSet do
    begin
      if not IsEmpty then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          DtSrcTabelaItens.DataSet.FieldByName('UNID_COD').AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de produto não cadastrado!');
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewRequisicaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Favor informar o(s) produto(s) da requisição.')
  else
  if btnProdutoSalvar.Enabled then
  begin
    TServiceMessage.ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da requisição!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        TServiceMessage.ShowWarning('Número de requisição já existe!');
        Abort;
      end;

      FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));
      FieldByName('ENDERECO_ENTREGA').AsString := Trim(AnsiUpperCase(FieldByName('ENDERECO_ENTREGA').AsString));

      inherited;

      if (not OcorreuErro) then
      begin

        // Salvar Itens da Base

        if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
          DtSrcTabelaItens.DataSet.Post;

        Produtos.DAO.ApplyUpdates;
        Produtos.DAO.CommitUpdates;
        Produtos.DAO.CommitTransaction;

        RecarregarRegistro;
        AbrirTabelaItens;
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TViewRequisicaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  with DtSrcTabela.DataSet do
  begin
    if (Sender = dbDataEmissao) then
      if (State in [dsEdit, dsInsert]) then
        FieldByName('VALIDADE').AsDateTime := IncDay(FieldByName('EMISSAO_DATA').AsDateTime, PRAZO_VALIDADE_REQUISICAO_COMPRA);

    if (Sender = dbProduto ) then
      if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
        CarregarDadosProduto( StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString, 0) );

    if ((Sender = dbQuantidade) or (Sender = dbValorUn) or (Sender = dbPercentualIPI)) then
      if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency :=
          DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency *
            DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency :=
          (DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency *
            DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency) / 100.0;
      end;

    if (Sender = dbValorTotal) then
      if (btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled) then
        btnProdutoSalvar.SetFocus;
  end;
end;

function TViewRequisicaoCompra.Controller: IControllerRequisicaoCompra;
begin
  Result := (FController as IControllerRequisicaoCompra);
end;

procedure TViewRequisicaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
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
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_FAT) and (DtSrcTabelaItens.DataSet.FieldByName('CONFIRMADO_RECEBIMENTO').AsInteger = 0) ) then
      dbgProdutos.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TViewRequisicaoCompra.dbProdutoButtonClick(Sender: TObject);
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
    if (FieldByName('FORNECEDOR').AsInteger = 0) then
    begin
      TServiceMessage.ShowWarning('Favor selecionar o fornecedor para a requisição!');
      dbFornecedor.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
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

      if bSelecionado then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := sCodigoAlfa;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := sDescricao;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := sUnidade;

        if ( iUnidade > 0 ) then
          DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := iUnidade;
      end;

    end;
  end;
end;

procedure TViewRequisicaoCompra.nmImprimirRequisicaoClick(
  Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  with DMNFe do
  begin
    try
      ConfigurarEmail(
        FController.DAO.Usuario.Empresa.CNPJ,
        Fornecedor.Get(DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger).DataSet.FieldByName('Email').AsString,
        dbTipo.Text,
        EmptyStr
      );
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

procedure TViewRequisicaoCompra.btnCancelarRequisicaoClick(
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
      TServiceMessage.ShowWarning('Lançamento de Requisição já está cancelado!');
      Abort;
    end;

    AbrirTabelaItens;

    if ( FieldByName('STATUS').AsInteger <> STATUS_REQUISICAO_REQ ) then
      TServiceMessage.ShowInformation('Apenas registros requisitados podem ser cancelados!')
    else
    if ( CancelarAUT(Self, FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('EMPRESA').AsString) ) then
    begin
      RecarregarRegistro;

      TServiceMessage.ShowInformation('Requisição cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TViewRequisicaoCompra.btnFinalizarRequisicaoClick(
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
      TServiceMessage.ShowWarning('Lançamento de Requisição já está finalizado!');
      Abort;
    end;

    AbrirTabelaItens;

    if TServiceMessage.ShowConfirm('Confirma a finalização da edição do requisição?') then
    begin
      ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      if (FieldByName('FATURAMENTO_MINIMO').AsCurrency > 0.0) and (cTotalLiquido > FieldByName('FATURAMENTO_MINIMO').AsCurrency) then
      begin
        TServiceMessage.ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa requisição de compra/serviço seja emitida!',
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

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Requisição finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewRequisicaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if ( (Field = DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE'))
      or (Field = DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO'))
      or (Field = DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL')) ) then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency     :=
        DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency;
      DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency :=
        (DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency) / 100.0;
    end;
end;

procedure TViewRequisicaoCompra.DtSrcTabelaDataChange(Sender: TObject;
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
          FieldByName('OBSERVACAO').AsString       := 'NF. EM NOME DA ' + FController.DAO.Usuario.Empresa.RazaoSocial;
        end;
      end
      else
      if ( (Field = FieldByName('VALOR_BRUTO')) or (Field = FieldByName('VALOR_TOTAL_FRETE')) or (Field = FieldByName('VALOR_DESCONTO')) ) then
        FieldByName('VALOR_TOTAL').AsCurrency :=
          (FieldByName('VALOR_BRUTO').AsCurrency + FieldByName('VALOR_TOTAL_IPI').AsCurrency) - FieldByName('VALOR_DESCONTO').AsCurrency;
    end;
end;

procedure TViewRequisicaoCompra.FormKeyDown(Sender: TObject;
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
            if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              TServiceMessage.ShowWarning('Número de requisição já existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cRequisicao : 20/10/2014 - Verificar Data de Emissão da Autorização }

        if dbDataEmissao.Focused then
          if ( dbDataEmissao.Date > Now ) then
              TServiceMessage.ShowWarning('A Data de Emissão da requisição está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');
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

  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) ) then
    DtSrcTabelaItens.DataSet.Cancel
  else
    inherited;
end;

function TViewRequisicaoCompra.GetRotinaReabrirRequisicaoID: String;
begin
  Result := GetRotinaInternaID(ppmReabrirRequisicao);
end;

function TViewRequisicaoCompra.GetRotinaRequisitarID: String;
begin
  Result := GetRotinaInternaID(ppmRequisitarCompra);
end;

function TViewRequisicaoCompra.GetRotinaCancelarRequisicaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarRequisicao);
end;

function TViewRequisicaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarRequisicao);
end;

procedure TViewRequisicaoCompra.RegistrarNovaRotinaSistema;
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

procedure TViewRequisicaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TViewRequisicaoCompra.Fornecedor: IControllerFornecedor;
begin
  if not Assigned(FControllerFornecedor) then
    FControllerFornecedor := TControllerFactory.New.Fornecedor;

  Result := FControllerFornecedor;
end;

procedure TViewRequisicaoCompra.dbClienteButtonClick(Sender: TObject);
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

procedure TViewRequisicaoCompra.ValidarToTais(var Total_Bruto, Total_IPI,
  Total_Desconto, Total_Liquido: Currency);
var
  Item : Integer;
begin
  Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

  Total_Bruto    := 0.0;
  Total_IPI      := 0.0;
  Total_Liquido  := 0.0;
  Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

  DtSrcTabelaItens.DataSet.First;

  try
    DtSrcTabelaItens.DataSet.DisableControls;
    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Bruto := Total_Bruto + DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency;
      Total_IPI   := Total_IPI   + DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_Desconto;
  finally
    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
    DtSrcTabelaItens.DataSet.EnableControls;
  end;
end;

procedure TViewRequisicaoCompra.dbCentroCustoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
      if SelecionarDepartamento(Self, FieldByName('CLIENTE').AsInteger, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) then
      begin
        FieldByName('CENTRO_CUSTO').AsInteger          := iCodigo;
        FieldByName('DESCRICAO_CENTRO_CUSTO').AsString := sNome;
      end;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewRequisicaoCompra', TViewRequisicaoCompra);

end.
