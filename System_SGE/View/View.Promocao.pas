unit View.Promocao;

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

  JvDBControls,
  JvExMask,
  JvToolEdit,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewPromocao = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblDataInicio: TLabel;
    lblDataFinal: TLabel;
    lblDescontoProm: TLabel;
    dbDescontoProm: TDBEdit;
    DtSrcProdutos: TDataSource;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblValorUnit: TLabel;
    lblDesconto: TLabel;
    lblUnidade: TLabel;
    Bevel5: TBevel;
    lblValorPromocao: TLabel;
    dbProdutoNome: TDBEdit;
    dbValorUnit: TDBEdit;
    dbDesconto: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    dbAtiva: TDBCheckBox;
    dbProduto: TJvDBComboEdit;
    dbValorPromocao: TJvDBComboEdit;
    dbDataInicio: TJvDBDateEdit;
    dbDataFinal: TJvDBDateEdit;
    lblRegistroDesativado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcProdutosStateChange(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbValorPromocaoButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerProduto : IControllerProduto;
    FControllerPromocaoProduto : IControllerCustom;
    procedure AbrirTabelaProdutos(const PromocaoID : Integer);
    procedure CarregarDadosProduto(const ProdutoID : Integer);

    function Controller : IControllerPromocao;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBPROMOCAO
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBCFOP

  Views:

  Procedures:

*)

var
  ViewPromocao: TViewPromocao;

  procedure MostrarTabelaPromocoes(const AOwner : TComponent);

  function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  Service.InputQuery,
  SGE.Controller.Factory,
  SGE.Controller,
  View.Produto;

{$R *.dfm}

procedure MostrarTabelaPromocoes(const AOwner : TComponent);
var
  frm : TViewPromocao;
begin
  frm := TViewPromocao.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewPromocao;
begin
  frm := TViewPromocao.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewPromocao.AbrirTabelaProdutos(const PromocaoID: Integer);
begin
  FControllerPromocaoProduto.DAO.DataSet.Close;

  FControllerPromocaoProduto.DAO
    .ParamsByName('promocao', PromocaoID)
    .Open;

  // Preparar DataSet para a configuração dos campos
  TTabelaController.New
    .Tabela(FControllerPromocaoProduto.DAO.DataSet)
    .Display('SEQUENCIAL',     '#', '00', TAlignment.taCenter)
    .Display('codigo_prod',    'Código')
    .Display('PRECO_VENDA',    'Valor Un. ', ',0.00', TAlignment.taRightJustify, True)
    .Display('DESCONTO',       '% Desconto', ',0.##', TAlignment.taRightJustify, True)
    .Display('PRECO_PROMOCAO', 'Valor Líquido', ',0.00', TAlignment.taRightJustify, True)
    .Configurar;
end;

procedure TViewPromocao.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Promocao;
  FControllerPromocaoProduto := TControllerFactory.New.PromocaoProduto;

  DtSrcProdutos.DataSet := FControllerPromocaoProduto.DAO.DataSet;

  inherited;
  Controller.DesativarPromocoes;

  DisplayFormatCodigo := '0000';
  RotinaID            := ROTINA_CAD_PROMOCAO_ID;
  ControlFirstEdit    := dbNome;

  NomeTabela     := 'TBPROMOCAO';
  CampoCodigo    := 'p.CODIGO';
  CampoDescricao := 'p.DESCRICAO';
  CampoOrdenacao := 'p.Ativa DESC, p.Data_inicio ASC, p.DESCRICAO ASC';
  CampoCadastroAtivo := 'ATIVA';

  Tabela
    .Display('codigo', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('descricao', 'Descrição', True)
    .Display('data_inicio', 'Data Início', 'dd/mm/yyyy', True)
    .Display('data_final', 'Data Final', 'dd/mm/yyyy', False)
    .Display('percentual_desconto', '% Desconto', ',0.00', TAlignment.taRightJustify, True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

procedure TViewPromocao.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TViewPromocao.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TViewPromocao.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    AbrirTabelaProdutos(DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger);
end;

procedure TViewPromocao.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    AbrirTabelaProdutos(DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger);
end;

procedure TViewPromocao.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  AbrirTabelaProdutos(DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger);
end;

procedure TViewPromocao.DtSrcProdutosStateChange(Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcProdutos.AutoEdit and (DtSrcProdutos.DataSet.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcProdutos.AutoEdit and (DtSrcProdutos.DataSet.State = dsBrowse) and (not DtSrcProdutos.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcProdutos.AutoEdit and (DtSrcProdutos.DataSet.State = dsBrowse) and (not DtSrcProdutos.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] );

  if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TViewPromocao.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo     : Integer;
  sCodigoAlfa ,
  sDescricao  ,
  sUnidade    : String;
  cValorVenda   ,
  cValorPromocao: Currency;
begin
  if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProduto(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, cValorVenda, cValorPromocao) ) then
    begin
      DtSrcProdutos.DataSet.FieldByName('CODIGO_PROD').AsString   := sCodigoAlfa;
      DtSrcProdutos.DataSet.FieldByName('DESCRI').AsString        := sDescricao;
      DtSrcProdutos.DataSet.FieldByName('UNIDADE').AsString       := sUnidade;
      DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency := cValorVenda;
    end;
end;

procedure TViewPromocao.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbAtiva.ReadOnly       := ( DtSrcTabela.DataSet.State in [dsInsert] );
  DtSrcProdutos.AutoEdit := ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] );
  DtSrcProdutosStateChange( DtSrcProdutos );
end;

procedure TViewPromocao.btnProdutoInserirClick(Sender: TObject);
begin
  if ( DtSrcProdutos.DataSet.Active ) then
  begin
    DtSrcProdutos.DataSet.Append;
    DtSrcProdutos.DataSet.FieldByName('CODIGO_PROM').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
    DtSrcProdutos.DataSet.FieldByName('DESCONTO').AsCurrency   := DtSrcTabela.DataSet.FieldByName('PERCENTUAL_DESCONTO').AsCurrency;
    dbProduto.SetFocus;
  end;
end;

procedure TViewPromocao.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not DtSrcProdutos.DataSet.IsEmpty ) then
  begin
    DtSrcProdutos.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewPromocao.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not DtSrcProdutos.DataSet.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcProdutos.DataSet.Delete;
end;

procedure TViewPromocao.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(DtSrcProdutos.DataSet.FieldByName('CODIGO_PROD').AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( (DtSrcProdutos.DataSet.FieldByName('DESCONTO').AsCurrency < 0) or (DtSrcProdutos.DataSet.FieldByName('DESCONTO').AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual de desconto inválido.');
      dbDesconto.SetFocus;
    end
    else
    begin

      DtSrcProdutos.DataSet.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TViewPromocao.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(DtSrcProdutos.DataSet.FieldByName('CODIGO_PROD').AsString, 0) );

  if ( Sender = dbDesconto ) then
    if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
    begin
      if ( DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').IsNull ) then
        DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency := 0;

      if ( DtSrcProdutos.DataSet.FieldByName('DESCONTO').IsNull ) then
        DtSrcProdutos.DataSet.FieldByName('DESCONTO').AsCurrency := 0;

      DtSrcProdutos.DataSet.FieldByName('PRECO_PROMOCAO').AsCurrency :=
        DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency -
        (DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency * DtSrcProdutos.DataSet.FieldByName('DESCONTO').AsCurrency / 100);
    end;

  if ( Sender = dbValorPromocao ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

end;

function TViewPromocao.Controller: IControllerPromocao;
begin
  Result := (FController as IControllerPromocao);
end;

procedure TViewPromocao.CarregarDadosProduto(const ProdutoID: Integer);
begin
  if ( ProdutoID = 0 ) then
  begin
    ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if ( not DtSrcProdutos.DataSet.Active ) then
    Exit
  else
  if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if not Assigned(FControllerProduto) then
    begin
      FControllerProduto := TControllerFactory.New.Produto;
      FControllerProduto.DAO.ClearWhere;
      FControllerProduto.DAO.Where('p.Codigo = :Codigo');
      FControllerProduto.DAO.Open;
    end;

    FControllerProduto.DAO.DataSet.Close;
    FControllerProduto
      .DAO
      .ParamsByName('Codigo', ProdutoID)
      .Open;

    if not FControllerProduto.DAO.DataSet.IsEmpty then
    begin
      DtSrcProdutos.DataSet.FieldByName('CODIGO_PROD').AsString   := FControllerProduto.DAO.DataSet.FieldByName('Cod').AsString;
      DtSrcProdutos.DataSet.FieldByName('DESCRI').AsString        := FControllerProduto.DAO.DataSet.FieldByName('Descri').AsString;
      DtSrcProdutos.DataSet.FieldByName('APRESENTACAO').AsString  := FControllerProduto.DAO.DataSet.FieldByName('Apresentacao').AsString;
      DtSrcProdutos.DataSet.FieldByName('PRECO_VENDA').AsCurrency := FControllerProduto.DAO.DataSet.FieldByName('Preco').AsCurrency;
    end
    else
    begin
      DtSrcProdutos.DataSet.FieldByName('CODIGO_PROD').Clear;

      ShowWarning('Código de produto não cadastrado');

      if ( dbProduto.Visible and dbProduto.Enabled ) then
        dbProduto.SetFocus;
    end;
  end;
end;

procedure TViewPromocao.dbValorPromocaoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    sValor := FormatFloat(',0.00', dbValorPromocao.Field.AsCurrency);

    if not TServiceInputQuery.InputQuery(Self, 'VALOR PROMOÇÃO (R$)', 'Favor informar o Valor Promocional:', sValor) then
      Abort;

    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);

    if ( cValor > 0 ) then
      with DtSrcProdutos.DataSet do
      begin
        FieldByName('PRECO_PROMOCAO').AsCurrency := cValor;
        FieldByName('DESCONTO').AsCurrency       := (1 - (
            FieldByName('PRECO_PROMOCAO').AsCurrency / FieldByName('PRECO_VENDA').AsCurrency
          )) * 100.0;
      end;
  end;
end;

procedure TViewPromocao.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( DtSrcProdutos.DataSet.State in [dsEdit, dsInsert] ) then
      DtSrcProdutos.DataSet.Post;

    FControllerPromocaoProduto.DAO.ApplyUpdates;
    FControllerPromocaoProduto.DAO.CommitUpdates;

    Controller.AplicarPromocao;

    FController.DAO.CommitTransaction;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewPromocao', TViewPromocao);

end.
