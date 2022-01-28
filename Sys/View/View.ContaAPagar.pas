unit View.ContaAPagar;

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

  ACBrBase,
  ACBrExtenso,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE,
  SGE.Controller.Impressao.ContaAPagar;

type
  TViewContaAPagar = class(TViewPadraoCadastro)
    lblEmpresa: TLabel;
    dbEmpresa: TDBEdit;
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblFornecedor: TLabel;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblValorAPagar: TLabel;
    dbValorAPagar: TDBEdit;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    lblQuitado: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dtsPagamentos: TDataSource;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    dtsTpDespesa: TDataSource;
    lblData: TLabel;
    popImprimir: TPopupMenu;
    popGerarReciboA4: TMenuItem;
    lblSaldoAPagar: TLabel;
    dbSaldoAPagar: TDBEdit;
    btbtnEfetuarPagto: TcxButton;
    dbEmissao: TJvDBDateEdit;
    dbVencimento: TJvDBDateEdit;
    dbFornecedor: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    Bevel9: TBevel;
    btbtnIncluirLote: TcxButton;
    dtsCompetencia: TDataSource;
    lblCompetenciaApuracao: TLabel;
    dbCompetenciaApuracao: TDBLookupComboBox;
    daCompra: TDBEdit;
    dnCompra: TDBEdit;
    lblCompra: TLabel;
    popGerarReciboA5: TMenuItem;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoCancelado: TShape;
    shpOperacaoVendido: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoVencido: TLabel;
    lblOperacaoCancelado: TLabel;
    pnlPagamentos: TPanel;
    pnlPagamentosDicas: TPanel;
    lblPagamentosDicas: TLabel;
    dbgPagamentos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnEfetuarPagtoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnIncluirLoteClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FControllerEmpresaView ,
    FControllerFormaPagto  ,
    FControllerCondicaoPagtoView,
    FControllerTipoDespesa : IControllerCustom;
    FControllerPagamento   : IControllerPagamento;
    FControllerCompetencia : IControllerCompetencia;
    FControllerCaixa : IControllerCaixa;
    FImpressao : IImpressaoContaAPagar;

    FDataAtual     : TDateTime;
    sGeneratorName ,
    FLoteParcelas  : String;
    FImprimirCabecalho : Boolean;
    procedure AbrirPagamentos;
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoDespesa(const ApenasAtivos : Boolean);

    function Controller : IControllerContaAPagar;
    function Pagamentos : IControllerPagamento;

    function GetRotinaEfetuarPagtoID : String;
    function GetRotinaCancelarPagtosID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaEfetuarPagtoID : String read GetRotinaEfetuarPagtoID;
    property RotinaCancelarPagtosID : String read GetRotinaCancelarPagtosID;
    property DataAtual : TDateTime read FDataAtual;
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCONTPAG_BAIXA
  - TBBANCO_BOLETO
  - TBFORMPAGTO
  - TBCOMPETENCIA

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  ViewContaAPagar: TViewContaAPagar;

  { DONE -oIsaque -cContas A Pagar : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem FORNECEDOR, DATAS e VALOR }

  procedure MostrarControleContasAPagar(const AOwner : TComponent);

implementation

uses
  System.DateUtils,
  UDMBusiness,
  UDMRecursos,
  Service.Message,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Fornecedor,
  View.ContaAPagar.Pagamento,
  View.ContaAPagar.LoteParcela;

{$R *.dfm}

procedure MostrarControleContasAPagar(const AOwner : TComponent);
var
  AForm  : TViewContaAPagar;
  aWhere : String;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewContaAPagar.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    aWhere :=
      '((p.quitado = 0) and (p.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
      '  (cast(p.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '  (p.empresa = ' + AForm.FController.DAO.Usuario.Empresa.CNPJ + ') and ' +
      '  (p.empresa in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      '  ))' +
      ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(aWhere);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure TViewContaAPagar.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.ContaAPagar;

  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerCompetencia := TControllerFactory.New.Competencia;
  FControllerTipoDespesa := TControllerFactory.New.TipoDespesa;
  FControllerFormaPagto        := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;
  FControllerPagamento   := TControllerFactory.New.Pagamento;

  dtsPagamentos.DataSet := Pagamentos.DAO.DataSet;
  dtsEmpresa.DataSet    := FControllerEmpresaView.DAO.DataSet;

  inherited;

  AbrirTabelaAuto := True;
  FDataAtual      := Now;
  FLoteParcelas   := EmptyStr;

  e1Data.Date := Date;
  e2Data.Date := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));

  ControlFirstEdit := dbFornecedor;

  CarregarFormaPagto(Controller.DAO.Usuario.Empresa.CNPJ);
  CarregarTipoDespesa(False);

  RotinaID            := ROTINA_FIN_CONTA_APAGAR_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCONTPAG';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'NomeForn';
  CampoOrdenacao := 'p.dtvenc, f.NomeForn';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '((p.quitado = 0) and (p.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
    '  (cast(p.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '  (p.empresa = ' + FController.DAO.Usuario.Empresa.CNPJ + ') and ' +
    '  (p.empresa in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    '  ))' +
    ')';

  Tabela
    .Display('NUMLANC', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('PARCELA', 'Parcela', '00', TAlignment.taCenter, False)
    .Display('DTEMISS', 'Data de Emissão', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('DTVENC', 'Data de Venvimento', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('COMPETENCIA_APURACAO', 'Competência da Apuração', True)
    .Display('ANOCOMPRA', 'Ano Compra', TAlignment.taCenter, False)
    .Display('NUMCOMPRA', 'No. Compra', DisplayFormatCodigo, TAlignment.taCenter, False)
    .Display('QUITADO', 'Situação', TAlignment.taLeftJustify, True)
    .Display('VALORPAG', 'Valor A Pagar (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('CODTPDESP',      'Tipo de Despesa', True)
    .Display('FORMA_PAGTO',    'Forma de Pagamento', True)
    .Display('CONDICAO_PAGTO', 'Condição de Pagamento', True)
    .Display('VALORSALDO', 'Saldo A Pagar (R$)', ',0.00', TAlignment.taRightJustify, False);

  TController(FControllerCompetencia)
    .LookupComboBox(dbCompetenciaApuracao, dtsCompetencia, 'competencia_apuracao', 'cmp_num', 'cmp_desc');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'forma_pagto', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'condicao_pagto', 'cond_cod', 'cond_descricao');

  TController(FControllerTipoDespesa)
    .LookupComboBox(dbTipoDespesa, dtsTpDespesa, 'codtpdesp', 'codigo', 'descricao');
end;

procedure TViewContaAPagar.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('CODFORN').AsInteger := iCodigo;
        FieldByName('CNPJ').AsString     := sCNPJ;
        FieldByName('NOMEFORN').AsString := sNome;
      end;
  end;
end;

procedure TViewContaAPagar.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  if FLoteParcelas.Trim.IsEmpty then
    WhereAdditional :=
      '((p.quitado = 0) and (p.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
      '  (cast(p.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '  (p.empresa = ' + FController.DAO.Usuario.Empresa.CNPJ + ') and ' +
      '  (p.empresa in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      '  ))' +
      ')'
  else
    WhereAdditional :=
      '(p.empresa = ' + FController.DAO.Usuario.Empresa.CNPJ + ') and ' +
      '(p.lote = ' + FLoteParcelas.QuotedString + ')';

  inherited;
end;

procedure TViewContaAPagar.btbtnIncluirLoteClick(Sender: TObject);
var
  sEmpresa,
  sLote   : String;
  iFornecedor : Integer;
  dDataEmissao    ,
  dVencimentoFirst,
  dVencimentoLast : TDateTime;
  aFornecedor : IControllerFornecedor;
begin
  if btbtnIncluir.Enabled then
  begin
    sEmpresa     := FController.DAO.Usuario.Empresa.CNPJ;
    sLote        := EmptyStr;
    iFornecedor  := 0;
    aFornecedor  := TControllerFactory.New.Fornecedor;
    dDataEmissao := Date;

    dVencimentoFirst := IncDay(dDataEmissao, 30);
    dVencimentoLast  := IncDay(dDataEmissao, 60);

    if GerarLoteParcelas(Self, sEmpresa, sLote, iFornecedor, dDataEmissao, dVencimentoFirst, dVencimentoLast)  then
    begin
      pgcGuias.ActivePage := tbsTabela;
      edtFiltrar.Text := aFornecedor.Get(iFornecedor).DataSet.FieldByName('Nomeforn').AsString;
      FLoteParcelas   := sLote;
      btnFiltrar.Click;

      FLoteParcelas := EmptyStr;
    end;
  end;
end;

procedure TViewContaAPagar.btbtnEfetuarPagtoClick(Sender: TObject);
var
//  sSenha   : String;
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
  cAPagar   : Currency;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  CxContaCorrente := 0;

  RecarregarRegistro;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('QUITADO').AsInteger = 1 ) then
    begin
      TServiceMessage.ShowWarning('Registro de despesa selecionada já se encontra quitado!' + #13 + 'Favor pesquisar novamente.');
      Abort;
    end;

  {  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');

    if ( Trim(sSenha) = EmptyStr ) then
      Exit;

    if ( sSenha <> GetSenhaAutorizacao ) then
    begin
      ShowWarning('Senha de autorização inválida');
      Exit;
    end;
   }
    cAPagar := FieldByName('VALORSALDO').AsCurrency;

    if PagamentoConfirmado(Self, FieldByName('EMPRESA').AsString,
      FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger,
      FieldByName('FORMA_PAGTO').AsInteger, FieldByName('NOMEFORN').AsString,
      CxContaCorrente, DataPagto, cAPagar) then
    begin
      if (CxContaCorrente > 0) then
        FControllerPagamento.GerarSaldoConta(CxContaCorrente, DataPagto);

      RecarregarRegistro;
      AbrirPagamentos;
    end;
  end;
end;

procedure TViewContaAPagar.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btbtnEfetuarPagto.Enabled := (FieldByName('SITUACAO').AsInteger = 1) and (FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PENDENTE) and (not IsEmpty) and (State = dsBrowse);
      popGerarReciboA4.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not dtsPagamentos.DataSet.IsEmpty);
      popGerarReciboA5.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not dtsPagamentos.DataSet.IsEmpty);
    end
    else
    begin
      btbtnEfetuarPagto.Enabled := False;
      popGerarReciboA4.Enabled  := False;
      popGerarReciboA5.Enabled  := False;
    end;
  end;
end;

function TViewContaAPagar.Pagamentos: IControllerPagamento;
begin
  Result := (Controller.Pagamentos as IControllerPagamento);
end;

procedure TViewContaAPagar.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewContaAPagar.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
    AbrirPagamentos;
end;

procedure TViewContaAPagar.AbrirPagamentos;
begin
  Controller.CarregarPagamentos;

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( dtsPagamentos.DataSet )
    .Display('SEQ', '#', '00', TAlignment.taCenter, False)
    .Display('DATA_PAGTO', 'Data Pagto.', 'dd/mm/yyyy', TAlignment.taCenter, False)
    .Display('VALOR_BAIXA', 'Valor Pago (R$) ', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewContaAPagar.btbtnAlterarClick(Sender: TObject);
var
  aEmpresa : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PAGO ) then
    begin
      TServiceMessage.ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        if (Trim(FieldByName('NOMEEMP').AsString) = EmptyStr) then
        begin
          aEmpresa := Controller.DAO.Usuario.Empresa.RazaoSocial;
          FieldByName('NOMEEMP').AsString := Copy(aEmpresa, 1, FieldByName('NOMEEMP').Size);
        end;

        AbrirPagamentos;
      end;
    end;
  end;
end;

procedure TViewContaAPagar.btbtnExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PAGO ) then
  begin
    TServiceMessage.ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  if ( DtSrcTabela.DataSet.FieldByName('ANOCOMPRA').AsInteger > 0 ) then
  begin
    TServiceMessage.ShowWarning('Registros de Contas A Pagar atrelados à entradas de produtos/serviços não podem ser excluídos!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirPagamentos;
  end;
end;

procedure TViewContaAPagar.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
  Self.Caption := Self.Caption + ' - (' + Controller.DAO.Usuario.Empresa.Fantasia + ')';
end;

procedure TViewContaAPagar.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    with DtSrcTabela.DataSet do
    begin
      // Destacar Títulos A Pagar cancelados
      if (FieldByName('SITUACAO').AsInteger = 0) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelado.Brush.Color
      else
      // Destacar Títulos A Pagar em aberto
      if (not FieldByName('QUITADO').IsNull) then
        if ( FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PENDENTE ) then
          if FieldByName('DTVENC').AsDateTime >= DataAtual then
            dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
          else
          begin
            dbgDados.Canvas.Font.Color  := shpOperacaoAberta.Brush.Color;
            dbgDados.Canvas.Brush.Color := shpOperacaoVendido.Brush.Color;
          end;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TViewContaAPagar.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
begin
  // Ctrl + Del
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin
  
    if not LiberarUso then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( not dtsPagamentos.DataSet.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if (not Assigned(FControllerCaixa)) then
        FControllerCaixa := TControllerFactory.New.Caixa;

      if (FControllerFormaPagto.DAO.DataSet.Locate('codigo', DtSrcTabela.DataSet.FieldByName('FORMA_PAGTO').AsInteger, [])) then
        if (FControllerFormaPagto.DAO.DataSet.FieldByName('Conta_corrente').AsInteger > 0) then
          if (not FControllerCaixa.CaixaAberto(
              DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString
            , Controller.DAO.Usuario.Login
            , Date
            , DtSrcTabela.DataSet.FieldByName('FORMA_PAGTO').AsInteger
            , CxAno
            , CxNumero
            , CxContaCorrente
          )) then
          begin
            TServiceMessage.ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
            Exit;
          end;

//    sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');
//
//    if ( Trim(sSenha) = EmptyStr ) then
//      Exit;
//
//    if ( sSenha <> GetSenhaAutorizacao ) then
//    begin
//      ShowWarning('Senha de autorização inválida');
//      Exit;
//    end;

      DataPagto := dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime;

      if TServiceMessage.ShowConfirm('Confirma a exclusão do registro de pagamento?') then
      begin
        Pagamentos.EstornarPagamento(Controller.DAO.Usuario.Login, CxContaCorrente);
        RecarregarRegistro;
        AbrirPagamentos;
      end;
    end;
  end;
end;

procedure TViewContaAPagar.popGerarReciboClick(Sender: TObject);
begin
  if Pagamentos.DAO.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Selecione um registro de pagamento para que o recibo seja emitido')
  else
    FImprimirCabecalho := TServiceMessage.ShowConfirmation('Recibo', 'Deseja imprimir no recibo o Cabeçalho com informações da empresa?');

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoContaAPagar.New;

  if (Sender = popGerarReciboA4) then
    FImpressao
      .VisualizarReciboPagamento(
        Pagamentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger,
        Pagamentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger,
        Pagamentos.DAO.DataSet.FieldByName('SEQ').AsInteger,
        TModeloPapel.mrPapelA4,
        FImprimirCabecalho
      )
  else
  if (Sender = popGerarReciboA5) then
    FImpressao
      .VisualizarReciboPagamento(
        Pagamentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger,
        Pagamentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger,
        Pagamentos.DAO.DataSet.FieldByName('SEQ').AsInteger,
        TModeloPapel.mrPapelA5,
        FImprimirCabecalho
      );
end;

procedure TViewContaAPagar.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewContaAPagar.CarregarFormaPagto(const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAPagar.CarregarTipoDespesa(const ApenasAtivos: Boolean);
begin
  FControllerTipoDespesa.DAO.DataSet.Close;
  FControllerTipoDespesa.DAO.DataSet.Filter   := '(ativo = 1)';
  FControllerTipoDespesa.DAO.DataSet.Filtered := ApenasAtivos;
  FControllerTipoDespesa.DAO.DataSet.Open;
end;

function TViewContaAPagar.Controller: IControllerContaAPagar;
begin
  Result := (FController as IControllerContaAPagar);
end;

procedure TViewContaAPagar.RecarregarRegistro;
begin
  with DtSrcTabela.DataSet do
  begin
    if (not FieldByName('DTVENC').IsNull) then
    begin
      if ( FieldByName('DTVENC').AsDateTime < e1Data.Date ) then
        e1Data.Date := FieldByName('DTVENC').AsDateTime;

      if (FieldByName('DTVENC').AsDateTime > e2Data.Date) then
        e2Data.Date := FieldByName('DTVENC').AsDateTime;
    end;

    FController.DAO.RefreshRecord;
  end;
end;

procedure TViewContaAPagar.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  iCompetencia : Integer;
begin
  with DtSrcTabela.DataSet do
  begin
    if (Field = FieldByName('EMPRESA')) then
      CarregarFormaPagto(FieldByName('EMPRESA').AsString)
    else
    if (Field = FieldByName('DTEMISS')) then
      if (State in [dsEdit, dsInsert]) then
        if (not FieldByName('DTEMISS').IsNull) then
        begin
          iCompetencia := FControllerCompetencia.GetID(FieldByName('DTEMISS').AsDateTime);
          FieldByName('COMPETENCIA_APURACAO').AsInteger := iCompetencia;
        end;
  end;
end;

procedure TViewContaAPagar.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAPagar.ReadOnly   := (not dtsPagamentos.DataSet.IsEmpty);
  btbtnIncluirLote.Enabled := btbtnIncluir.Enabled;
  HabilitarDesabilitar_Btns;

  CarregarFormaPagto(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString);
  CarregarTipoDespesa( (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) );
end;

procedure TViewContaAPagar.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    if FieldByName('COMPETENCIA_APURACAO').IsNull then
      FieldByName('COMPETENCIA_APURACAO').AsInteger := FControllerCompetencia.GetID(FieldByName('DTEMISS').AsDateTime);

    if ( (FieldByName('ANOCOMPRA').AsInteger = 0) and (FieldByName('PARCELA').AsInteger <= 0) ) then
      FieldByName('PARCELA').AsInteger := 1;

    FieldByName('VALORSALDO').AsCurrency := FieldByName('VALORPAG').AsCurrency;
  end;

  inherited;
end;

procedure TViewContaAPagar.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    AbrirPagamentos;
end;

procedure TViewContaAPagar.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    AbrirPagamentos;
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

function TViewContaAPagar.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgPagamentos);
end;

function TViewContaAPagar.GetRotinaEfetuarPagtoID: String;
begin
  Result := GetRotinaInternaID(btbtnEfetuarPagto);
end;

procedure TViewContaAPagar.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnEfetuarPagto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEfetuarPagtoID, btbtnEfetuarPagto.Hint, RotinaID);

    if dbgPagamentos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarPagtosID, 'Cancelar Pagamentos', RotinaID);
  end;
end;

initialization
  FormFunction.RegisterForm('ViewContaAPagar', TViewContaAPagar);

end.
