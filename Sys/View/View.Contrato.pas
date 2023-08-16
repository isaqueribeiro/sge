unit View.Contrato;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
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

  JvToolEdit,
  JvDBControls,
  JvExMask,

  Data.DB,
  Datasnap.DBClient,

  UConstantesDGE,
  UGrPadrao,
  Interacao.Versao,
  Interacao.Tabela,
  Controller.Versao,
  Controller.Tabela,
  SGE.Controller.Interfaces,
  View.PadraoCadastro,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  dxSkinsCore,
  dxSkinsDefaultPainters;

type
  TViewContrato = class(TViewPadraoCadastro)
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dtsTipoDestino: TDataSource;
    lblTipoDestino: TLabel;
    dbTipoDestino: TDBLookupComboBox;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    lblNome: TLabel;
    dbNome: TJvDBComboEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TJvDBDateEdit;
    lblDataValidade: TLabel;
    dbDataValidade: TJvDBDateEdit;
    DtSrcTabelaItens: TDataSource;
    btnDisponibilizar: TcxButton;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblValorTotal: TLabel;
    Bevel10: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbValorTotal: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    dbProduto: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbNomeButtonClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure ControlEditExit(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView  ,
    FControllerTipoContratoView : IControllerCustom;
    FControllerProduto : IControllerProduto;

    FApenasDisponiveis : Boolean;
    FTipoContrato : TTipoContrato;
    FEmpresa : String;

    procedure HabilitarDesabilitar_Btns; virtual; abstract;
    procedure RecarregarRegistro;
    procedure AbrirTabelaItens;
    procedure AbrirTabelaNotas;
    procedure RegistrarNovaRotinaSistema;
    procedure CarregarDadosProduto(aCodigo : Integer);

    function GetRotinaDisponibilizarID : String;
    function Controller : IControllerContrato;
    function Empresa : IControllerEmpresa;
    function Itens : IControllerCustom;

  public
    { Public declarations }
    property ApenasDisponiveis : Boolean read FApenasDisponiveis write FApenasDisponiveis;
    property TipoContrato : TTipoContrato read FTipoContrato write FTipoContrato;
    property RotinaDisponibilizarID : String read GetRotinaDisponibilizarID;
  end;

var
  ViewContrato: TViewContrato;

implementation

{$R *.dfm}

uses
  UDMBusiness,
  Service.Message,
  Service.Utils,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Cliente,
  View.Fornecedor;

procedure TViewContrato.AbrirTabelaItens;
begin
  Controller.CarregarItens;

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( DtSrcTabelaItens.DataSet )
    .Display('ITEM',       '#', '00', TAlignment.taCenter, True)
    .Display('PRODUTO',    'Produto', True)
    .Display('QUANTIDADE', 'Qtde.', ',0.##', TAlignment.taRightJustify, True)
    .Display('UNIDADE',    'Unidade', True)
    .Display('VALOR',      'Valor Unitário (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('TOTAL',      'Valor Total (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('CONSUMO_QTDE',  'Qtde. Consumida', ',0.##', TAlignment.taRightJustify, False)
    .Display('CONSUMO_TOTAL', 'Total Consumido (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('SALDO_QTDE',    'Qtde. Saldo', ',0.##', TAlignment.taRightJustify, False)
    .Display('SALDO_TOTAL',   'Total Saldo (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewContrato.AbrirTabelaNotas;
begin
//  Controller.CarregarNotas;
//
//  // Configurar tabela das notas
//  TTabelaController
//    .New
//    .Tabela( DtSrcTabelaNotas.DataSet )
//    .Display('ITEM',       '#', '00', TAlignment.taCenter, True)
//    .Display('PRODUTO',    'Produto', True)
//    .Display('QUANTIDADE', 'Qtde.', ',0.##', TAlignment.taRightJustify, True)
//    .Display('UNIDADE',    'Unidade', True)
//    .Display('VALOR',      'Valor Unitário (R$)', ',0.00', TAlignment.taRightJustify, True)
//    .Display('TOTAL',      'Valor Total (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CONSUMO_QTDE',  'Qtde. Consumida', ',0.##', TAlignment.taRightJustify, False)
//    .Display('CONSUMO_TOTAL', 'Total Consumido (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('SALDO_QTDE',    'Qtde. Saldo', ',0.##', TAlignment.taRightJustify, False)
//    .Display('SALDO_TOTAL',   'Total Saldo (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Configurar;
end;

procedure TViewContrato.CarregarDadosProduto(aCodigo: Integer);
begin
  if (not DtSrcTabelaItens.DataSet.Active) then
    Exit
  else
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if not Assigned(FControllerProduto) then
      FControllerProduto := TControllerFactory.New.Produto;

    with FControllerProduto.Get(aCodigo).DataSet do
    begin
      if not IsEmpty then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('produto').AsString := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('descri').AsString  := FieldByName('descri').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('apresentacao').AsString := FieldByName('apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('descri_apresentacao').AsString := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('unp_descricao').AsString := FieldByName('unp_descricao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('unp_sigla').AsString := FieldByName('unp_sigla').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('unid').AsString := FieldByName('unid').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := FieldByName('Codunidade').AsInteger;
        DtSrcTabelaItens.DataSet.FieldByName('VALOR').AsCurrency  := FieldByName('preco').AsCurrency + FieldByName('valor_ipi').AsCurrency;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de ítem (produto/serviço) não cadastrado');

        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;

        if (dbProduto.Visible and dbProduto.Enabled) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewContrato.ControlEditExit(Sender: TObject);
begin
  inherited;

  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if (Sender = dbProduto) then
      CarregarDadosProduto(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsInteger);

    if (Sender = dbQuantidade) or (Sender = dbValorUnit) then
      DtSrcTabelaItens.DataSet.FieldByName('TOTAL').AsCurrency :=
        DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('VALOR').AsCurrency;
  end;
end;

function TViewContrato.Controller: IControllerContrato;
begin
  if not Assigned(FController) then
    FController := TControllerFactory.New.Contrato;

  Result := (FController as IControllerContrato);
end;

procedure TViewContrato.dbNomeButtonClick(Sender: TObject);
var
  aRetorno : Boolean;
  aCodigo  : Integer;
  aCNPJ    ,
  aNome    : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
    begin
      if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoCliente)) then
        aRetorno := SelecionarCliente(Self, aCodigo, aCNPJ, aNome)
      else
      if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoFornecedor)) then
        aRetorno := SelecionarFornecedor(Self, aCodigo, aCNPJ, aNome);

      if aRetorno then
      begin
        if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoCliente)) then
          FieldByName('CLIENTE').AsInteger := aCodigo
        else
        if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoFornecedor)) then
          FieldByName('FORNECEDOR').AsInteger := aCodigo;

        FieldByName('CNPJ').AsString := aCNPJ;
        FieldByName('NOME').AsString := aNome;
      end;
    end;
  end;
end;

procedure TViewContrato.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    if (not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])) then
      AbrirTabelaItens;
  end;
end;

function TViewContrato.Empresa: IControllerEmpresa;
begin
  if not Assigned(FControllerEmpresaView) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;

  Result := (FControllerEmpresaView as IControllerEmpresa);
end;

procedure TViewContrato.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Contrato;

  FControllerEmpresaView       := TControllerFactory.New.EmpresaView;
  FControllerTipoContratoView  := TControllerFactory.New.TipoContratoView;

//  if (gSistema.Codigo <> SISTEMA_GESTAO_OPME) then
//    if (not (Empresa.GetSegmentoID(FController.DAO.Usuario.Empresa.CNPJ) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID])) then
//      OcutarCampoAutorizacao;

  DtSrcTabelaItens.DataSet := Itens.DAO.DataSet;
//  DtSrcTabelaNotas.DataSet := Notas.DAO.DataSet;

  inherited;

  AbrirTabelaAuto := False;
  FEmpresa        := EmptyStr;
//
//  e1Data.Date      := Date - 30;
//  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBCONTRATO';
  CampoCodigo    := 'c.controle';
  CampoDescricao := 'cli.nome';
  CampoOrdenacao := 'cli.nome, frn.nomeforn, c.numero';
//
//  aEmitirNFE := Empresa.GetPermitirEmissaoNFe(FController.DAO.Usuario.Empresa.CNPJ)
//    and Empresa.GetPermitirEmissaoNFeEntrada(FController.DAO.Usuario.Empresa.CNPJ)
//    and Empresa.DAO.Configuracao.Certificado(FController.DAO.Usuario.Empresa.CNPJ).Instalado;
//
//  dbCalcularTotais.Visible      := aEmitirNFE;
//  lblCalcularTotaisInfo.Visible := aEmitirNFE;
//  btbtnGerarNFe.Visible         := aEmitirNFE;
//
  TipoContrato      := TTipoContrato.tpContratoNull;
  ApenasDisponiveis := False;
//
//  if not dbCalcularTotais.Visible then
//    GrpBxDadosValores.Height := 76
//  else
//    GrpBxDadosValores.Height := 90;

  // Configurar tabela de cadastro
  Tabela
    .Display('CONTROLE', 'Controle', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NUMERO',  'Número', False)
    .Display('EMPRESA',  'Empresa', True)
    .Display('CLIENTE',  'Cliente', True)
    .Display('FORNECEDOR', 'Fornecedor', True)
    .Display('SITUAÇÃO',   'Situação', TAlignment.taLeftJustify, True)
    .Display('DESTINO',    'Tipo', True)
    .Display('DATA_EMISSAO', 'Data de Emissão', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('DATA_VALIDADE', 'Data de Validade', 'dd/mm/yyyy', TAlignment.taCenter, False)
    .Display('ITENS', 'Itens', ',0', TAlignment.taRightJustify, False)
    .Display('QUANTIDADES', 'Qtde.', ',0.###', TAlignment.taRightJustify, False)
    .Display('VALOR_TOTAL', 'Valor (R$)', ',0.00', TAlignment.taRightJustify, False);

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoContratoView)
    .LookupComboBox(dbTipoDestino, dtsTipoDestino, 'destino', 'codigo', 'descricao');

  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewContrato.FormShow(Sender: TObject);
begin
  inherited;
  if Trim(DisplayFormatCodigo) <> EmptyStr then
    CentralizarCodigo;

  RegistrarNovaRotinaSistema;
end;

function TViewContrato.GetRotinaDisponibilizarID: String;
begin
  Result := GetRotinaInternaID(btnDisponibilizar);
end;

function TViewContrato.Itens: IControllerCustom;
begin
  Result := Controller.Itens;
end;

procedure TViewContrato.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    AbrirTabelaNotas;
  end;
end;

procedure TViewContrato.RecarregarRegistro;
begin
  FController.DAO.RefreshRecord;
end;

procedure TViewContrato.RegistrarNovaRotinaSistema;
begin
  if (not Trim(RotinaID).IsEmpty) then
  begin
    if btnDisponibilizar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaDisponibilizarID, btnDisponibilizar.Caption, RotinaID);
  end;
end;

end.
