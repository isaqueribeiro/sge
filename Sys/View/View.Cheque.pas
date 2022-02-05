unit View.Cheque;

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

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

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
  dxSkinsDefaultPainters,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE,
  SGE.Controller.Impressao.Cheque;

type
  TViewCheque = class(TViewPadraoCadastro)
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    dbStatus: TDBEdit;
    lblValor: TLabel;
    dbValor: TDBEdit;
    dtsEmpresa: TDataSource;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lblStatus: TLabel;
    bvlBaixas: TBevel;
    dbgBaixas: TDBGrid;
    Bevel7: TBevel;
    dtsBaixas: TDataSource;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblEmissorCnpj: TLabel;
    dbEmissorCnpj: TDBEdit;
    dtsBanco: TDataSource;
    lblData: TLabel;
    btbtnAlterarSituacao: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    popImprimir: TPopupMenu;
    popGerarEspelhoChequeA4: TMenuItem;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    lblApresentacao: TLabel;
    dbApresentacao: TJvDBDateEdit;
    dtsTipoCheque: TDataSource;
    popGerarEspelhoChequeA5: TMenuItem;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblEmissorNome: TLabel;
    dbEmissorNome: TJvDBComboEdit;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    lblCompensacao: TLabel;
    dbCompensacao: TJvDBDateEdit;
    dbConta: TDBEdit;
    lblConta: TLabel;
    lblNominalA: TLabel;
    dbNominalA: TDBEdit;
    popMudarSituacao: TPopupMenu;
    ppmApresentar: TMenuItem;
    ppmCompensado: TMenuItem;
    ppmDevolvido: TMenuItem;
    ppmCancelar: TMenuItem;
    N1: TMenuItem;
    popRelacaoCheques: TMenuItem;
    N2: TMenuItem;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoCancelado: TShape;
    shpOperacaoACompensar: TShape;
    shpOperacaoPedente: TShape;
    pnlStatusText: TPanel;
    lblOperacaoPendente: TLabel;
    lblOperacaoACompensar: TLabel;
    lblOperacaoCancelado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbEmissorNomeButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure ppmApresentarClick(Sender: TObject);
    procedure ppmDevolvidoClick(Sender: TObject);
    procedure ppmCompensadoClick(Sender: TObject);
    procedure ppmCancelarClick(Sender: TObject);
    procedure popRelacaoChequesClick(Sender: TObject);
  private
    { Private declarations }
    FDataAtual    : TDateTime;
    FLoteParcelas : String;
    FImprimirCabecalho,
    FChequeParaBaixa  : Boolean;

    FControllerEmpresaView   ,
    FControllerTipoChequeView,
    FControllerBancoFebrabanView : IControllerCustom;
    FImpressao : IImpressaoCheque;

    procedure AbrirBaixas;
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure AddWhereAdditional;

    function Empresa : IControllerEmpresa;
    function Controller : IControllerCheque;

    function GetRotinaAlterarSituacaoID  : String;
    function GetRotinaApresentarChequeID : String;
    function GetRotinaDevolverChequeID   : String;
    function GetRotinaCompensarChequeID  : String;
    function GetRotinaCancelarChequeID   : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaAlterarSituacaoID  : String read GetRotinaAlterarSituacaoID;
    property RotinaApresentarChequeID : String read GetRotinaApresentarChequeID;
    property RotinaDevolverChequeID   : String read GetRotinaDevolverChequeID;
    property RotinaCompensarChequeID  : String read GetRotinaCompensarChequeID;
    property RotinaCancelarChequeID   : String read GetRotinaCancelarChequeID;
    property DataAtual : TDateTime read FDataAtual;
  end;

(*
  Tabelas:
  - TBCHEQUE
  - TBBANCO
  - TBCLIENTE
  - TBFORNECEDOR
  - TBEMPRESA

  Views:
  - VW_EMPRESA
  - VW_STATUS_CHEQUE

  Procedures:

*)

  function SelecionarChequeBaixa(const AOnwer : TComponent;
    var pCheque : TChequeBaixa) : Boolean;

implementation

uses
    System.DateUtils
  , UDMBusiness
  , UDMRecursos
  , UDMNFe
  , Service.Message
  , Service.Utils
  , Model.Constantes
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , View.Cliente
  , View.MemoData
  , View.Query.FornecedorCliente;

{$R *.dfm}

function SelecionarChequeBaixa(const AOnwer : TComponent;
  var pCheque : TChequeBaixa) : Boolean;
var
  AForm : TViewCheque;
begin
  AForm := TViewCheque.Create(AOnwer);
  try
    AForm.btbtnIncluir.Visible  := False;
    AForm.btbtnAlterar.Visible  := False;
    AForm.btbtnExcluir.Visible  := False;
    AForm.btbtnCancelar.Visible := False;
    AForm.btbtnSalvar.Visible   := False;
    AForm.btbtnLista.Visible    := False;

    AForm.btbtnSelecionar.Visible := True;
    AForm.FChequeParaBaixa        := True;

    AForm.btbtnAlterarSituacao.Visible := False;
    AForm.AddWhereAdditional;

    Result := (AForm.ShowModal = mrOk);

    if Result then
      with AForm, DtSrcTabela.DataSet do
      begin
        pCheque.Codigo  := FieldByName('CONTROLE').AsInteger;
        pCheque.Numero  := FieldByName('NUMERO').AsString;
        pCheque.Banco   := FieldByName('BANCO').AsString;
        pCheque.Agencia := FieldByName('AGENCIA').AsString;
        pCheque.Conta   := FieldByName('CONTA').AsString;
        pCheque.Valor   := FieldByName('VALOR').AsCurrency;

        if (not FieldByName('DATA_COMPENSACAO').IsNull) then
          pCheque.Data := FieldByName('DATA_COMPENSACAO').AsDateTime
        else
        if (not FieldByName('DATA_APRESENTACAO').IsNull) then
          pCheque.Data := FieldByName('DATA_APRESENTACAO').AsDateTime
        else
        if (not FieldByName('DATA_EMISSAO').IsNull) then
          pCheque.Data := FieldByName('DATA_EMISSAO').AsDateTime;
      end;
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewCheque.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Cheque;
  FControllerEmpresaView    := TControllerFactory.New.EmpresaView;
  FControllerTipoChequeView := TControllerFactory.New.TipoChequeView;
  FControllerBancoFebrabanView := TControllerFactory.New.BancoFebrabanView;

  popRelacaoCheques.Caption := Format(popRelacaoCheques.Caption, [Empresa.GetEmpresaFantasia(FController.DAO.Usuario.Empresa.CNPJ)]);

  inherited;
  RotinaID         := ROTINA_FIN_CONTROLE_CHEQUE_ID;
  ControlFirstEdit := dbEmpresa;
  FChequeParaBaixa := False;

  FDataAtual  := Date;
  e1Data.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  e2Data.Date := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCHEQUE';
  CampoCodigo    := 'c.controle';
  CampoDescricao := 'coalesce(cc.nome, fc.nomeforn)';
  CampoOrdenacao := 'c.data_apresentacao, coalesce(cc.nome, fc.nomeforn)';

  AddWhereAdditional;

  Tabela
    .Display('CONTROLE', 'Controle', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('STATUS', 'Situação', TAlignment.taLeftJustify, False)
    .Display('DATA_EMISSAO', 'Emissão', 'dd/mm/yyyy', True)
    .Display('NUMERO', 'Número do Cheque', True)
    .Display('BANCO', 'Banco', True)
    .Display('AGENCIA', 'Agência', True)
    .Display('CONTA', 'Conta', True)
    .Display('DATA_CADASTRO', 'Cadastrado em:', 'dd/mm/yyyy', False)
    .Display('VALOR', 'Valor (R$)', ',0.00', TAlignment.taRightJustify, True);

  AbrirTabelaAuto  := True;

  // Configurando os campos de listagem (LookupComboBox)
  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoChequeView)
    .LookupComboBox(dbTipo, dtsTipoCheque, 'tipo', 'codigo', 'descricao');

  TController(FControllerBancoFebrabanView)
    .LookupComboBox(dbBanco, dtsBanco, 'banco', 'codigo', 'codigo_nome');
end;

procedure TViewCheque.dbEmissorNomeButtonClick(Sender: TObject);
var
  aRetorno : TFornecedorCliente;
begin
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
    begin
      if FieldByName('TIPO').IsNull then
        TServiceMessage.ShowWarning('Favor selecionar o Tipo de Origem do Cheque')
      else
      if SelecionarFornecedorCliente(Self, aRetorno) then
      begin
        FieldByName('EMISSOR_NOME').AsString  := aRetorno.Nome;
        FieldByName('EMISSOR_CNPJ').AsString  := aRetorno.Cnpj;
        FieldByName('EMISSOR_PF').AsInteger   := IfThen(TServicesUtils.StrIsCPF(aRetorno.Cnpj), 1, 0);

        if (aRetorno.TipoEmissor = TTipoEmissorCheque.tecFornecedor) then
        begin
          FieldByName('FORNECEDOR').AsInteger     := aRetorno.Codigo;
          FieldByName('FORNECEDOR_NOME').AsString := aRetorno.Nome;
          FieldByName('FORNECEDOR_CNPJ').AsString := aRetorno.Cnpj;
          FieldByName('FORNECEDOR_PF').AsInteger  := IfThen(TServicesUtils.StrIsCPF(aRetorno.Cnpj), 1, 0);
          FieldByName('CLIENTE').Clear;
          FieldByName('CLIENTE_NOME').Clear;
          FieldByName('CLIENTE_CNPJ').Clear;
          FieldByName('CLIENTE_PF').Clear;
        end
        else
        if (aRetorno.TipoEmissor = TTipoEmissorCheque.tecCliente) then
        begin
          FieldByName('FORNECEDOR').Clear;
          FieldByName('FORNECEDOR_NOME').Clear;
          FieldByName('FORNECEDOR_CNPJ').Clear;
          FieldByName('FORNECEDOR_PF').Clear;
          FieldByName('CLIENTE').AsInteger     := aRetorno.Codigo;
          FieldByName('CLIENTE_NOME').AsString := aRetorno.Nome;
          FieldByName('CLIENTE_CNPJ').AsString := aRetorno.Cnpj;
          FieldByName('CLIENTE_PF').AsInteger  := IfThen(TServicesUtils.StrIsCPF(aRetorno.Cnpj), 1, 0);
        end;
      end;
    end;
  end;
end;

procedure TViewCheque.btnFiltrarClick(Sender: TObject);
begin
  AddWhereAdditional;
  inherited;
end;

procedure TViewCheque.HabilitarDesabilitar_Btns;
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    with DtSrcTabela.DataSet do
    begin
      btbtnAlterarSituacao.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (not (State in [dsEdit, dsInsert]));

      ppmApresentar.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_DEVOLVIDO]);
      ppmDevolvido.Enabled  := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_APRESENTADO]);
      ppmCompensado.Enabled := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_APRESENTADO]);
      ppmCancelar.Enabled   := (FieldByName('CONTROLE').AsCurrency > 0) and (FieldByName('STATUS').AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_APRESENTADO, STATUS_CHEQUE_DEVOLVIDO]);
    end;
  end
  else
  begin
    btbtnAlterarSituacao.Enabled := False;

    ppmApresentar.Enabled := False;
    ppmDevolvido.Enabled  := False;
    ppmCompensado.Enabled := False;
    ppmCancelar.Enabled   := False;
  end;

  popGerarEspelhoChequeA4.Enabled := (not DtSrcTabela.DataSet.IsEmpty);
  popGerarEspelhoChequeA5.Enabled := (not DtSrcTabela.DataSet.IsEmpty);
  popRelacaoCheques.Enabled := (not DtSrcTabela.DataSet.IsEmpty);
end;

procedure TViewCheque.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    RecarregarRegistro;
  HabilitarDesabilitar_Btns;
end;

procedure TViewCheque.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
    AbrirBaixas;
end;

procedure TViewCheque.popGerarReciboClick(Sender: TObject);
begin
  FImprimirCabecalho := TServiceMessage.ShowConfirmation('Espelho Cheque', 'Deseja imprimir no espelho o Cabeçalho com informações da empresa?');

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoCheque.New;

  if (Sender = popGerarEspelhoChequeA4) then
    FImpressao
      .VisualizarCheque(
        FController.DAO.DataSet.FieldByName('CONTROLE').AsLargeInt,
        TModeloPapel.mrPapelA4,
        FImprimirCabecalho
      )
  else
  if (Sender = popGerarEspelhoChequeA5) then
    FImpressao
      .VisualizarCheque(
        FController.DAO.DataSet.FieldByName('CONTROLE').AsLargeInt,
        TModeloPapel.mrPapelA5,
        FImprimirCabecalho
      );
end;

procedure TViewCheque.popRelacaoChequesClick(Sender: TObject);
begin
  if not Assigned(FImpressao) then
    FImpressao := TImpressaoCheque.New;

  FImpressao.VisualizarRelacaoCheques(FController.DAO.Usuario.Empresa.CNPJ, e1Data.Date, e2Data.Date);
end;

procedure TViewCheque.ppmApresentarClick(Sender: TObject);
var
  aDataApresn : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaApresentarChequeID, True) then
    Exit;

  aDataApresn := Date;
  aObservacao := TStringList.Create;

  if ppmApresentar.Enabled then
    if SetMemoTextoData(Self, aDataApresn, aObservacao, 'Apresentação do Cheque', 'Informe observação sobre a apresenta do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger             := STATUS_CHEQUE_APRESENTADO;
        DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime := aDataApresn;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Apresentado" por ' + FController.DAO.Usuario.Login + ' em ' + FormatDateTime('dd/mm/yyyy', Date) + #13 +
          aObservacao.Text;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TViewCheque.ppmCancelarClick(Sender: TObject);
var
  aDataCancel : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaCancelarChequeID, True) then
    Exit;

  aDataCancel := Date;
  aObservacao := TStringList.Create;

  if ppmCancelar.Enabled then
    if SetMemoTextoData(Self, aDataCancel, aObservacao, 'Cancelamento do Cheque', 'Informe o motivo do cancelamento do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger := STATUS_CHEQUE_CANCELADO;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Cancelado" por ' + FController.DAO.Usuario.Login + ' em ' + FormatDateTime('dd/mm/yyyy', Date) + #13 +
          'Data  : ' + FormatDateTime('dd/mm/yyyy', aDataCancel) + #13 +
          'Motivo: ' + aObservacao.Text;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TViewCheque.ppmCompensadoClick(Sender: TObject);
var
  aDataCompen : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaCompensarChequeID, True) then
    Exit;

  aDataCompen := Date;
  aObservacao := TStringList.Create;

  if ppmCompensado.Enabled then
    if SetMemoTextoData(Self, aDataCompen, aObservacao, 'Compensação do Cheque', 'Informe observação sobre a compensação do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger            := STATUS_CHEQUE_COMPENSADO;
        DtSrcTabela.DataSet.FieldByName('DATA_COMPENSACAO').AsDateTime := aDataCompen;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Compensado" por ' + FController.DAO.Usuario.Login + ' em ' + FormatDateTime('dd/mm/yyyy', Date) + #13 +
          aObservacao.Text;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TViewCheque.ppmDevolvidoClick(Sender: TObject);
var
  aDataDevolv : TDateTime;
  aObservacao : TStringList;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaSistema(RotinaDevolverChequeID, True) then
    Exit;

  aDataDevolv := Date;
  aObservacao := TStringList.Create;

  if ppmDevolvido.Enabled then
    if SetMemoTextoData(Self, aDataDevolv, aObservacao, 'Devolução do Cheque', 'Informe o motivo da devolução do cheque:') then
      try
        DtSrcTabela.DataSet.DisableControls;
        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger          := STATUS_CHEQUE_DEVOLVIDO;
        DtSrcTabela.DataSet.FieldByName('DATA_DEVOLUCAO').AsDateTime := aDataDevolv;
        DtSrcTabela.DataSet.FieldByName('OBS').AsString :=
          DtSrcTabela.DataSet.FieldByName('OBS').AsString + #13 +
          '* Cheque marcado como "Devolvimento" por ' + FController.DAO.Usuario.Login + ' em ' + FormatDateTime('dd/mm/yyyy', Date) + #13 +
          'Data  : ' + FormatDateTime('dd/mm/yyyy', aDataDevolv) + #13 +
          'Motivo: ' + aObservacao.Text;


        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;
      finally
        DtSrcTabela.DataSet.EnableControls;
        RecarregarRegistro;
        HabilitarDesabilitar_Btns;
      end;
end;

procedure TViewCheque.AbrirBaixas;
begin
  Controller.CarregarBaixas;

  dtsBaixas.DataSet := Controller.Baixas.DataSet;
  HabilitarDesabilitar_Btns;

  TTabelaController
    .New
    .Tabela(dtsBaixas.DataSet)
    .Display('SEQ', '#', '00', TAlignment.taCenter)
    .Display('DATA_PAGTO', 'Pagamento', 'dd/mm/yyyy', TAlignment.taCenter)
    .Display('VALOR_BAIXA', 'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar;

  dbgBaixas.Visible := (not dtsBaixas.DataSet.IsEmpty);
  bvlBaixas.Visible := (not dtsBaixas.DataSet.IsEmpty);
end;

procedure TViewCheque.AddWhereAdditional;
var
  sChequeBaixa : String;
begin
  sChequeBaixa :=
    // Cheques emitidos que foram apresentados e/ou compensados
    '((c.tipo = 1) and (c.status in (' + IntToSTr(STATUS_CHEQUE_APRESENTADO) + ', ' + IntToSTr(STATUS_CHEQUE_COMPENSADO) + ')))' +
    ' or ' +
    // Cheques recebidos que foram compensados
    '((c.tipo = 2) and (c.status = ' + IntToSTr(STATUS_CHEQUE_COMPENSADO) + '))';

  WhereAdditional :=
    IfThen(not FChequeParaBaixa, '(c.empresa = ' + QuotedStr(FController.DAO.Usuario.Empresa.CNPJ) + ') and ', EmptyStr) +
    '(c.data_apresentacao between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')' +
    IfThen(not FChequeParaBaixa, EmptyStr, ' and (' + sChequeBaixa + ')');
end;

procedure TViewCheque.btbtnAlterarClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger >= STATUS_CHEQUE_COMPENSADO ) then
  begin
    TServiceMessage.ShowWarning('O cheque selecionado está em situação de "' + dbStatus.Text + '" e não poderá ser alterado!');
    Abort;
  end
  else
  begin
    inherited;
    if (not OcorreuErro) then
      AbrirBaixas;
  end;
end;

procedure TViewCheque.btbtnExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger >= STATUS_CHEQUE_COMPENSADO ) then
  begin
    TServiceMessage.ShowWarning('O cheque selecionado está em situação de "' + dbStatus.Text + '" e não poderá ser excluído!');
    Abort;
  end
  else
  begin
    inherited;
    if (not OcorreuErro) then
      AbrirBaixas;
  end;
end;

function TViewCheque.Controller: IControllerCheque;
begin
  Result := FController as IControllerCheque;
end;

procedure TViewCheque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Cheques Pendentes
    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CHEQUE_PENDENTE ) then
      dbgDados.Canvas.Font.Color := shpOperacaoPedente.Brush.Color
    else
    // Destacar Cheques A Compensar
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CHEQUE_APRESENTADO) and (DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime <= DataAtual) ) then
    begin
      dbgDados.Canvas.Font.Color  := clBlue;
      dbgDados.Canvas.Brush.Color := shpOperacaoACompensar.Brush.Color;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TViewCheque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if Assigned(dtsBaixas.DataSet) then
    dbValor.ReadOnly := (not dtsBaixas.DataSet.IsEmpty);

  dbObservacao.ReadOnly := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_CHEQUE_PENDENTE);
  HabilitarDesabilitar_Btns;
end;

function TViewCheque.Empresa: IControllerEmpresa;
begin
  if (not Assigned(FControllerEmpresaView)) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;

  Result := (FControllerEmpresaView as ICOntrollerEmpresa);
end;

procedure TViewCheque.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    AbrirBaixas;
end;

procedure TViewCheque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    AbrirBaixas;
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

procedure TViewCheque.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

function TViewCheque.GetRotinaAlterarSituacaoID: String;
begin
  Result := GetRotinaInternaID(btbtnAlterarSituacao);
end;

function TViewCheque.GetRotinaApresentarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmApresentar, RotinaAlterarSituacaoID);
end;

function TViewCheque.GetRotinaCancelarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCancelar, RotinaAlterarSituacaoID);
end;

function TViewCheque.GetRotinaCompensarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCompensado, RotinaAlterarSituacaoID);
end;

function TViewCheque.GetRotinaDevolverChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmDevolvido, RotinaAlterarSituacaoID);
end;

procedure TViewCheque.RecarregarRegistro;
begin
  if (not DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').IsNull) then
  begin
    if (DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime < e1Data.Date) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime;

    if (DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime > e2Data.Date) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_APRESENTACAO').AsDateTime;
  end;

  FController.DAO.RefreshRecord;
end;

procedure TViewCheque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_PROCESSO, RotinaAlterarSituacaoID,  Trim(btbtnAlterarSituacao.Caption), RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaApresentarChequeID, Trim(ppmApresentar.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaDevolverChequeID,   Trim(ppmDevolvido.Caption),  RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCompensarChequeID,  Trim(ppmCompensado.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCancelarChequeID,   Trim(ppmCancelar.Caption),   RotinaAlterarSituacaoID);
  end;
end;

procedure TViewCheque.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - (' + Empresa.GetEmpresaFantasia(FController.DAO.Usuario.Empresa.CNPJ) + ')';
  RegistrarNovaRotinaSistema;

  btbtnAlterarSituacao.Enabled := GetPermissaoRotinaSistema(RotinaAlterarSituacaoID, False);
end;

initialization
  FormFunction.RegisterForm('ViewCheque', TViewCheque);

end.
