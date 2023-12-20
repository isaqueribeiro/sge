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
  dxSkinsDefaultPainters, dxSkinBasic, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    pgcDetalhes: TPageControl;
    tbsProdutos: TTabSheet;
    tbsNotas: TTabSheet;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblValorTotal: TLabel;
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
    dbgProdutos: TDBGrid;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoFinalizada: TLabel;
    shpOperacaoFinalizada: TShape;
    ppImprimir: TPopupMenu;
    nmListaContratos: TMenuItem;
    tbsObservacoes: TTabSheet;
    dbObservacao: TDBMemo;
    DtSrcTabelaNotas: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbNomeButtonClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure ControlEditExit(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btnDisponibilizarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView  ,
    FControllerTipoContratoView : IControllerCustom;
    FControllerProduto : IControllerProduto;

    FApenasDisponiveis : Boolean;
    FTipoContrato : TTipoContrato;
    FEmpresa : String;

    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure AbrirTabelaItens;
    procedure AbrirTabelaNotas;
    procedure RegistrarNovaRotinaSistema;
    procedure CarregarDadosProduto(aCodigo : Integer);

    function ContratoDuplicado(const aContrato : TContrato) : Boolean;
    function GetRotinaDisponibilizarID : String;
    function Controller : IControllerContrato;
    function Empresa : IControllerEmpresa;
    function Itens : IControllerCustom;
    function Notas : IControllerCustom;

  public
    { Public declarations }
    property ApenasDisponiveis : Boolean read FApenasDisponiveis write FApenasDisponiveis;
    property TipoContrato : TTipoContrato read FTipoContrato write FTipoContrato;
    property RotinaDisponibilizarID : String read GetRotinaDisponibilizarID;

    procedure pgcGuiasOnChange; override;
  end;

var
  ViewContrato: TViewContrato;

implementation

{$R *.dfm}

uses
  UDMBusiness,
  UDMRecursos,
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
    .Display('VALOR',      'Valor Unit�rio (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('TOTAL',      'Valor Total (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('CONSUMO_QTDE',  'Qtde. Consumida', ',0.##', TAlignment.taRightJustify, False)
    .Display('CONSUMO_TOTAL', 'Total Consumido (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('SALDO_QTDE',    'Qtde. Saldo', ',0.##', TAlignment.taRightJustify, False)
    .Display('SALDO_TOTAL',   'Total Saldo (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;
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
//    .Display('VALOR',      'Valor Unit�rio (R$)', ',0.00', TAlignment.taRightJustify, True)
//    .Display('TOTAL',      'Valor Total (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CONSUMO_QTDE',  'Qtde. Consumida', ',0.##', TAlignment.taRightJustify, False)
//    .Display('CONSUMO_TOTAL', 'Total Consumido (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('SALDO_QTDE',    'Qtde. Saldo', ',0.##', TAlignment.taRightJustify, False)
//    .Display('SALDO_TOTAL',   'Total Saldo (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Configurar;
end;

procedure TViewContrato.btbtnAlterarClick(Sender: TObject);
var
  aMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('situacao').AsInteger > STATUS_CONTRATO_FINAL ) then
    begin
      Case FieldByName('situacao').AsInteger of
        STATUS_CONTRATO_FINAL : aMsg := 'Este contrato n�o pode ser alterado porque est� finalizado.';
        STATUS_CONTRATO_CANCEL: aMsg := 'Este contrato n�o pode ser alterado porque est� cancelado';
      end;

      TServiceMessage.ShowWarning(aMsg);
      Abort;
    end
    else
    begin
      inherited;
      if (not OcorreuErro) then
      begin
        AbrirTabelaItens;
        AbrirTabelaNotas;
      end;
    end;
  end;
end;

procedure TViewContrato.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
  begin
    AbrirTabelaItens;
    AbrirTabelaNotas;
  end;
end;

procedure TViewContrato.btbtnExcluirClick(Sender: TObject);
var
  aMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('situacao').AsInteger > STATUS_CONTRATO_FINAL ) then
    begin
      Case FieldByName('situacao').AsInteger of
        STATUS_CONTRATO_FINAL : aMsg := 'Este contrato n�o pode ser exclu�do porque est� finalizado.';
        STATUS_CONTRATO_CANCEL: aMsg := 'Este contrato n�o pode ser exclu�do porque est� cancelado';
      end;

      TServiceMessage.ShowWarning(aMsg);
      Abort;
    end
    else
    begin
      inherited;
      if (not OcorreuErro) then
      begin
        AbrirTabelaItens;
        AbrirTabelaNotas;
      end;
    end;
  end;
end;

procedure TViewContrato.btbtnListaClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewContrato.btbtnSalvarClick(Sender: TObject);
var
  aContrato : TContrato;
begin
  with DtSrcTabela.DataSet do
  begin
    if DtSrcTabelaItens.DataSet.IsEmpty then
      TServiceMessage.ShowWarning('Favor informar itens do contrato.')
    else
    begin
      // Verificar duplicidade de lan�amento do Contrato
      aContrato.Controle   := FieldByName('controle').AsLargeInt;
      aContrato.Destino    := FieldByName('destino').AsInteger;
      aContrato.Cliente    := FieldByName('cliente').AsInteger;
      aContrato.Fornecedor := FieldByName('fornecedor').AsInteger;
      aContrato.Numero     := Trim(FieldByName('numero').AsString).ToUpper;

      if not ContratoDuplicado(aContrato) then
      begin
        inherited;

        if (not OcorreuErro) then
        begin
          if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
            DtSrcTabelaItens.DataSet.Post;

          Itens.DAO.ApplyUpdates;
          Itens.DAO.CommitUpdates;

          FController.DAO.CommitTransaction;
        end;

        HabilitarDesabilitar_Btns;
        RecarregarRegistro;
      end;
    end;
  end;
end;

procedure TViewContrato.btnDisponibilizarClick(Sender: TObject);
var
  aGerarTitulos : Boolean;
  aContrato : TContrato;
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Abort;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    // Verificar duplicidade de lan�amento do Contrato
    aContrato.Controle   := FieldByName('controle').AsLargeInt;
    aContrato.Destino    := FieldByName('destino').AsInteger;
    aContrato.Cliente    := FieldByName('cliente').AsInteger;
    aContrato.Fornecedor := FieldByName('fornecedor').AsInteger;
    aContrato.Numero     := Trim(FieldByName('numero').AsString).ToUpper;

    if not ContratoDuplicado(aContrato) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    // 1. Garantir a grava��o dos itens na base
    DtSrcTabelaItens.DataSet.DisableControls;
    try
      DtSrcTabelaItens.DataSet.First;
      while not DtSrcTabelaItens.DataSet.Eof do
      begin
        DtSrcTabelaItens.DataSet.Edit;
        DtSrcTabelaItens.DataSet.Post;

        Itens.DAO.ApplyUpdates;
        Itens.DAO.CommitUpdates;

        DtSrcTabelaItens.DataSet.Next;
      end;
    finally
      FController.DAO.CommitTransaction;
      DtSrcTabelaItens.DataSet.First;
      DtSrcTabelaItens.DataSet.EnableControls;
    end;

    if (FieldByName('situacao').AsInteger = STATUS_CONTRATO_DISPO) then
      TServiceMessage.ShowWarning('Contrato j� est� disponibilizado para uso!')
    else
    if (DtSrcTabelaItens.DataSet.RecordCount = 0) then
      TServiceMessage.ShowWarning('Contrato sem itens!')
    else
    begin
      if TServiceMessage.ShowConfirm('Confirma a disponibiliza��o do contrato selecionado para uso?') then
      begin
        Edit;

        FieldByName('situacao').AsInteger := STATUS_CONTRATO_DISPO;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        HabilitarDesabilitar_Btns;
        TServiceMessage.ShowInformation('Contrato disponibilizado com sucesso!');
      end;

    end;
  end;
end;

procedure TViewContrato.btnFiltrarClick(Sender: TObject);
var
  aCNPJ : String;
begin
  if ApenasDisponiveis then
    WhereAdditional := '(c.situacao = ' + IntToStr(STATUS_CONTRATO_DISPO) + ') and '
  else
    WhereAdditional := EmptyStr;

  WhereAdditional := WhereAdditional +
    ' (c.empresa in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    ' ))';

  if (not Trim(FEmpresa).IsEmpty) then
    WhereAdditional := WhereAdditional + ' and (c.empresa = ' + FEmpresa.QuotedString + ')';


  // Buscar pelo CNPJ
  aCNPJ := Trim(edtFiltrar.Text);
  if TServicesUtils.StrIsCPF(aCNPJ) or TServicesUtils.StrIsCNPJ(aCNPJ) then
    WhereAdditional := WhereAdditional + ' and ((cli.cnpj = ' + aCNPJ.QuotedString + ') or (frn.cnpj = ' + aCNPJ.QuotedString + '))';

  inherited;
end;

procedure TViewContrato.btnProdutoEditarClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbQuantidade.SetFocus;
  end;
end;

procedure TViewContrato.btnProdutoExcluirClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if TServiceMessage.ShowConfirm('Deseja excluir o �tem selecionado?') then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewContrato.btnProdutoInserirClick(Sender: TObject);
var
  aSequencial : Integer;
begin
  with DtSrcTabela.DataSet do
  begin
    if ((FieldByName('cliente').AsInteger = 0) and (FieldByName('fornecedor').AsInteger = 0)) then
    begin
      TServiceMessage.ShowInformation('Favor selecionar o Cliente ou o Fornecedor para o Contrato!');
      dbNome.SetFocus;
    end
    else
    if DtSrcTabelaItens.DataSet.Active then
    begin
      Itens.GerarSequencial(DtSrcTabelaItens.DataSet, 'item', aSequencial);

      DtSrcTabelaItens.DataSet.Append;
      DtSrcTabelaItens.DataSet.FieldByName('item').Value := aSequencial;
      DtSrcTabelaItens.DataSet.FieldByName('contrato').AsInteger := FieldByName('controle').AsInteger;

      dbProduto.SetFocus;
    end;
  end;
end;

procedure TViewContrato.btnProdutoSalvarClick(Sender: TObject);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if Trim(DtSrcTabelaItens.DataSet.FieldByName('produto').AsString).IsEmpty then
    begin
      TServiceMessage.ShowWarning('Favor selecionar o Produto');
      dbProduto.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('quantidade').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('valor').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Valor unit�rio inv�lida.');
      dbValorUnit.SetFocus;
    end
    else
    begin
      DtSrcTabelaItens.DataSet.Post;

      if (btnProdutoInserir.Visible and btnProdutoInserir.Enabled) then
        btnProdutoInserir.SetFocus;
    end;
  end;
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
        TServiceMessage.ShowWarning('C�digo de �tem (produto/servi�o) n�o cadastrado');

        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;

        if (dbProduto.Visible and dbProduto.Enabled) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

function TViewContrato.ContratoDuplicado(const aContrato: TContrato): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := Controller.NumeroDuplicado(aContrato);
    if aRetorno then
      TServiceMessage.ShowWarning(Format('Contrato de n�mero %s j� lan�ado.'#13#13'Pesquise o registro de controle %s lan�ado para %s.', [
          QuotedStr(Trim(Controller.Busca.DataSet.FieldByName('numero').AsString))
        , FormatFloat('###0000000', Controller.Busca.DataSet.FieldByName('controle').AsInteger)
        , Controller.Busca.DataSet.FieldByName('razao').AsString
      ]));
  finally
    Result := aRetorno;
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

procedure TViewContrato.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('situacao').IsNull) then
      // Destacar Contratos em Edi��o
      if (DtSrcTabela.DataSet.FieldByName('situacao').AsInteger = STATUS_CONTRATO_EDIT) then
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar Contratos Encerrados/Finalizados
      if (DtSrcTabela.DataSet.FieldByName('situacao').AsInteger = STATUS_CONTRATO_FINAL) then
        dbgDados.Canvas.Font.Color := shpOperacaoFinalizada.Brush.Color
      else
      // Destacar Contratos Cancelados
      if (DtSrcTabela.DataSet.FieldByName('situacao').AsInteger = STATUS_CONTRATO_CANCEL) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;

  if (Sender = dbgProdutos) then
  begin
    // Destacar Produtos com Saldos zerados
    if (not DtSrcTabelaItens.DataSet.FieldByName('saldo_total').IsNull) and (DtSrcTabelaItens.DataSet.FieldByName('saldo_total').AsCurrency <= 0.0) then
      dbgProdutos.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
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

  btbtnSelecionar.Enabled := (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CONTRATO_DISPO);
end;

procedure TViewContrato.DtSrcTabelaItensStateChange(Sender: TObject);
begin
  btnProdutoInserir.Enabled := (DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse));
  btnProdutoEditar.Enabled  := (DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := (DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]);

  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if (dbProduto.Visible and dbProduto.Enabled) then
      dbProduto.SetFocus;
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

  FApenasDisponiveis := False;

  DtSrcTabelaItens.DataSet := Itens.DAO.DataSet;
  DtSrcTabelaNotas.DataSet := Notas.DAO.DataSet;

  inherited;

  AbrirTabelaAuto := True;
  FEmpresa        := EmptyStr;

  ControlFirstEdit := dbEmpresa;

  RotinaID := ROTINA_MOV_GESTAO_CONTRATO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBCONTRATO';
  CampoCodigo    := 'c.controle';
  CampoDescricao := 'cli.nome';
  CampoOrdenacao := 'cli.nome, frn.nomeforn, c.numero';
  CampoCadastroAtivo := 'c.situacao';

  TipoContrato      := TTipoContrato.tpContratoNull;
  ApenasDisponiveis := False;

  // Configurar tabela de cadastro
  Tabela
    .Display('CONTROLE', 'Controle', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NUMERO',  'N�mero', False)
    .Display('EMPRESA',  'Empresa', True)
    .Display('CLIENTE',  'Cliente', True)
    .Display('FORNECEDOR', 'Fornecedor', True)
    .Display('SITUACAO',   'Situa��o', TAlignment.taLeftJustify, True)
    .Display('DESTINO',    'Tipo', True)
    .Display('DATA_EMISSAO', 'Data de Emiss�o', 'dd/mm/yyyy', TAlignment.taCenter, True)
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

procedure TViewContrato.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    btnDisponibilizar.Enabled := (pgcGuias.ActivePage = tbsCadastro)
      and (FieldByName('SITUACAO').AsInteger = STATUS_CONTRATO_EDIT)
      and (not DtSrcTabelaItens.DataSet.IsEmpty);

    nmListaContratos.Enabled := (DtSrcTabela.DataSet.State = dsBrowse) and (not DtSrcTabela.DataSet.IsEmpty);
  end;
end;

function TViewContrato.Itens: IControllerCustom;
begin
  Result := Controller.Itens;
end;

function TViewContrato.Notas: IControllerCustom;
begin
  Result := Controller.Notas;
end;

procedure TViewContrato.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    AbrirTabelaNotas;
  end;
end;

procedure TViewContrato.pgcGuiasOnChange;
begin
  pgcDetalhes.ActivePage := tbsProdutos;
  HabilitarDesabilitar_Btns;
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

initialization
  FormFunction.RegisterForm('ViewContrato', TViewContrato);

end.
