unit View.ContaAReceber;

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
  SGE.Controller.Impressao.ContaAReceber;

type
  TViewContaAReceber = class(TViewPadraoCadastro)
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblCliente: TLabel;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblValorAReceber: TLabel;
    dbValorAReceber: TDBEdit;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    lblQuitado: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dtsRecebimentos: TDataSource;
    lblCNPJ: TLabel;
    dbCNPJ: TDBEdit;
    lblVenda: TLabel;
    daVenda: TDBEdit;
    dnVenda: TDBEdit;
    Bevel9: TBevel;
    GrpBxDadosBoleto: TGroupBox;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    lblValorMulta: TLabel;
    dbValorMulta: TDBEdit;
    lblTotalAReceber: TLabel;
    dbTotalAReceber: TDBEdit;
    lblNossoNumero: TLabel;
    dbNossoNumero: TDBEdit;
    dtsBanco: TDataSource;
    lblPercJuros: TLabel;
    dbPercJuros: TDBEdit;
    lblPercMulta: TLabel;
    dbPercMulta: TDBEdit;
    lblDataBoleto: TLabel;
    dbDataBoleto: TDBEdit;
    lblDataPagto: TLabel;
    dbDataPagto: TDBEdit;
    dbEnviado: TDBCheckBox;
    lblPercDesconto: TLabel;
    dbPercDesconto: TDBEdit;
    lblData: TLabel;
    lblNFe: TLabel;
    dbNFe: TDBEdit;
    btbtnEfetuarPagto: TcxButton;
    dbCliente: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    Bevel10: TBevel;
    btbtnIncluirLote: TcxButton;
    popImprimir: TPopupMenu;
    popGerarReciboA4: TMenuItem;
    dtsCompetencia: TDataSource;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    lblVencimento: TLabel;
    dbVencimento: TJvDBDateEdit;
    lblCompetenciaApuracao: TLabel;
    dbCompetenciaApuracao: TDBLookupComboBox;
    dtsTpReceita: TDataSource;
    lblTipoReceita: TLabel;
    dbTipoReceita: TDBLookupComboBox;
    popGerarReciboA5: TMenuItem;
    lblSaldoAPagar: TLabel;
    dbSaldoAReceber: TDBEdit;
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
    procedure dbClienteButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnEfetuarPagtoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure dbFormaPagtoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnIncluirLoteClick(Sender: TObject);
    procedure FrReciboGetValue(const VarName: string; var Value: Variant);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FControllerEmpresaView ,
    FControllerFormaPagto  ,
    FControllerTipoReceita : IControllerCustom;
    FControllerRecebimento : IControllerRecebimento;
    FControllerCompetencia : IControllerCompetencia;
    FControllerCaixa : IControllerCaixa;
    FControllerBanco : IControllerBanco;
    FImpressao : IImpressaoContaAReceber;

    FDataAtual     : TDateTime;
    sGeneratorName ,
    FLoteParcelas  : String;
    FImprimirCabecalho : Boolean;
    procedure ControleLabels;
    procedure AbrirRecebimentos;
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoReceita(const ApenasAtivos : Boolean);

    function Controller : IControllerContaAReceber;
    function Recebimentos : IControllerRecebimento;

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
  - TBCONTREC
  - TBEMPRESA
  - TBCLIENTE
  - TBCONTREC_BAIXA
  - TBBANCO_BOLETO
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  ViewContaAReceber: TViewContaAReceber;

  { DONE -oIsaque -cContas A Receber : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem CLIENTE, DATAS e VALOR }
  procedure MostrarControleContasAReceber(const AOwner : TComponent);

implementation

uses
  System.DateUtils,
  UDMBusiness,
  UDMRecursos,
  Service.Message,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Cliente,
  View.ContaAReceber.LoteParcela,
  View.ContaAReceber.Pagamento;

{$R *.dfm}

procedure MostrarControleContasAReceber(const AOwner : TComponent);
var
  AForm  : TViewContaAReceber;
  aWhere : String;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewContaAReceber.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    aWhere :=
      '((r.baixado = 0) and (r.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
      '  (cast(r.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '  (r.empresa = ' + QuotedStr(AForm.FController.DAO.Usuario.Empresa.CNPJ) + ') and ' +
      '  (r.empresa in ( ' +
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

procedure TViewContaAReceber.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.ContaAReceber;

  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerCompetencia := TControllerFactory.New.Competencia;
  FControllerTipoReceita := TControllerFactory.New.TipoDespesa;
  FControllerFormaPagto  := TControllerFactory.New.FormaPagto;
  FControllerRecebimento := TControllerFactory.New.Recebimento;
  FControllerBanco       := TControllerFactory.New.Banco;

  dtsRecebimentos.DataSet := Recebimentos.DAO.DataSet;
  dtsEmpresa.DataSet    := FControllerEmpresaView.DAO.DataSet;

  inherited;

  AbrirTabelaAuto := True;
  FDataAtual      := Now;
  FLoteParcelas   := EmptyStr;

  e1Data.Date := Date;
  e2Data.Date := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));

  ControlFirstEdit := dbCliente;

  CarregarFormaPagto(Controller.DAO.Usuario.Empresa.CNPJ);
  CarregarTipoReceita(False);

  RotinaID            := ROTINA_FIN_CONTA_ARECEBER_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCONTREC';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'Nome';
  CampoOrdenacao := 'r.dtvenc, c.Nome';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '((r.baixado = 0) and (r.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
    '  (cast(r.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '  (r.empresa = ' + QuotedStr(FController.DAO.Usuario.Empresa.CNPJ) + ') and ' +
    '  (r.empresa in ( ' +
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
    .Display('ANOVENDA', 'Ano Venda', TAlignment.taCenter, False)
    .Display('NUMVENDA', 'No. Venda', DisplayFormatCodigo, TAlignment.taCenter, False)
    .Display('ANOOS', 'Ano OS', TAlignment.taCenter, False)
    .Display('NUMOS', 'No. OS', DisplayFormatCodigo, TAlignment.taCenter, False)
    .Display('BAIXADO',  'Situação', TAlignment.taLeftJustify, True)
    .Display('VALORREC', 'Valor A Receber (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('CODTPREC',     'Tipo de Receita', True)
    .Display('FORMA_PAGTO',  'Forma de Pagamento', True)
    .Display('PERCENTJUROS', '% Juros', ',0.##', TAlignment.taRightJustify, False)
    .Display('PERCENTMULTA', '% Multa', ',0.##', TAlignment.taRightJustify, False)
    .Display('VALORSALDO', 'Saldo A Receber (R$)', ',0.00', TAlignment.taRightJustify, False);

  TController(FControllerCompetencia)
    .LookupComboBox(dbCompetenciaApuracao, dtsCompetencia, 'competencia_apuracao', 'cmp_num', 'cmp_desc');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'forma_pagto', 'codigo', 'codigo_descricao');

  TController(FControllerTipoReceita)
    .LookupComboBox(dbTipoReceita, dtsTpReceita, 'codtprec', 'codigo', 'descricao');

  TController(FControllerBanco)
    .LookupComboBox(dbBanco, dtsBanco, 'codbanco', 'bco_cod', 'bco_nome_agencia_conta');
end;

procedure TViewContaAReceber.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('CLIENTE').AsInteger    := iCodigo;
        FieldByName('CNPJ').AsString        := sCNPJ;
        FieldByName('NOMECLIENTE').AsString := sNome;
      end;
  end;
end;

procedure TViewContaAReceber.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  if FLoteParcelas.Trim.IsEmpty then
    WhereAdditional :=
      '((r.baixado = 0) and (r.dtvenc between (current_date - 30) and (current_date - 1))) or (' +
      '  (cast(r.dtvenc as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '  (r.empresa = ' + QuotedStr(FController.DAO.Usuario.Empresa.CNPJ) + ') and ' +
      '  (r.empresa in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      '  ))' +
      ')'
  else
    WhereAdditional :=
      '(r.empresa = ' + QuotedStr(FController.DAO.Usuario.Empresa.CNPJ) + ') and ' +
      '(r.lote = ' + FLoteParcelas.QuotedString + ')';

  inherited;
end;

procedure TViewContaAReceber.btbtnEfetuarPagtoClick(Sender: TObject);
var
//  sSenha   : String;
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
  cReceber  : Currency;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  CxContaCorrente := 0;

  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( not Active ) then
      Exit;

    if ( FieldByName('BAIXADO').AsInteger = 1 ) then
    begin
      TServiceMessage.ShowWarning('Registro de recebimento selecionado já se encontra baixado!' + #13 + 'Favor pesquisar novamente.');
      Abort;
    end;
  //  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');
  //
  //  if ( Trim(sSenha) = EmptyStr ) then
  //    Exit;
  //
  //  if ( sSenha <> GetSenhaAutorizacao ) then
  //  begin
  //    ShowWarning('Senha de autorização inválida');
  //    Exit;
  //  end;

    cReceber := FieldByName('VALORSALDO').AsCurrency;

    if PagamentoConfirmado(Self, FieldByName('EMPRESA').AsString,
      FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger,
      FieldByName('FORMA_PAGTO').AsInteger, FieldByName('NOMECLIENTE').AsString,
      CxContaCorrente, DataPagto, cReceber) then
    begin
      if (CxContaCorrente > 0) then
        FControllerRecebimento.GerarSaldoConta(CxContaCorrente, DataPagto);

      RecarregarRegistro;
      AbrirRecebimentos;

      TControllerFactory.New.Cliente
        .DesbloquearCliente(FieldByName('CLIENTE').AsInteger, EmptyStr);
    end;
  end;
end;

procedure TViewContaAReceber.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btbtnEfetuarPagto.Enabled := (FieldByName('SITUACAO').AsInteger = 1) and (FieldByName('BAIXADO').AsInteger = STATUS_APAGAR_PENDENTE) and (not IsEmpty) and (State = dsBrowse);
      popGerarReciboA4.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not dtsRecebimentos.DataSet.IsEmpty);
      popGerarReciboA5.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not dtsRecebimentos.DataSet.IsEmpty);
    end
    else
    begin
      btbtnEfetuarPagto.Enabled := False;
      popGerarReciboA4.Enabled  := False;
      popGerarReciboA5.Enabled  := False;
    end;
  end;
end;

procedure TViewContaAReceber.btbtnSalvarClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.State = dsEdit) then
    if (VarToStr(DtSrcTabela.DataSet.FieldByName('DTVENC').OldValue) <> VarToStr(DtSrcTabela.DataSet.FieldByName('DTVENC').NewValue)) then
      TControllerFactory.New.Cliente.DesbloquearCliente(DtSrcTabela.DataSet.FieldByName('CLIENTE').AsInteger, EmptyStr);

  inherited;
  HabilitarDesabilitar_Btns;
  ControleLabels;
end;

procedure TViewContaAReceber.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
    AbrirRecebimentos;
end;

procedure TViewContaAReceber.popGerarReciboClick(Sender: TObject);
begin
  if Recebimentos.DAO.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Selecione um registro de pagamento para que o recibo seja emitido')
  else
    FImprimirCabecalho := TServiceMessage.ShowConfirmation('Recibo', 'Deseja imprimir no recibo o Cabeçalho com informações da empresa?');

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoContaAReceber.New;

  if (Sender = popGerarReciboA4) then
    FImpressao
      .VisualizarRecibo(
        Recebimentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger,
        Recebimentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger,
        Recebimentos.DAO.DataSet.FieldByName('SEQ').AsInteger,
        TModeloPapel.mrPapelA4,
        FImprimirCabecalho
      )
  else
  if (Sender = popGerarReciboA5) then
    FImpressao
      .VisualizarRecibo(
        Recebimentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger,
        Recebimentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger,
        Recebimentos.DAO.DataSet.FieldByName('SEQ').AsInteger,
        TModeloPapel.mrPapelA5,
        FImprimirCabecalho
      );
end;

procedure TViewContaAReceber.AbrirRecebimentos;
begin
  Controller.CarregarRecebimentos;

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( dtsRecebimentos.DataSet )
    .Display('SEQ', '#', '00', TAlignment.taCenter, False)
    .Display('DATA_PAGTO', 'Data Pagto.', 'dd/mm/yyyy', TAlignment.taCenter, False)
    .Display('VALOR_BAIXA', 'Valor Pago (R$) ', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewContaAReceber.btbtnAlterarClick(Sender: TObject);
var
  aEmpresa : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('BAIXADO').AsInteger = STATUS_ARECEBER_PAGO ) then
    begin
      TServiceMessage.ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
        AbrirRecebimentos;
    end;
  end;
end;

procedure TViewContaAReceber.btbtnExcluirClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.FieldByName('BAIXADO').AsInteger = STATUS_ARECEBER_PAGO) then
  begin
    TServiceMessage.ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  if (DtSrcTabela.DataSet.FieldByName('ANOVENDA').AsInteger > 0) or (DtSrcTabela.DataSet.FieldByName('ANOOS').AsInteger > 0) then
  begin
    TServiceMessage.ShowWarning('Registros de Contas A Receber atrelados à saídas de produtos/serviços não podem ser excluídos!');
    Abort;
  end
  else
  begin
    inherited;
    if (not OcorreuErro) then
      AbrirRecebimentos;

    ControleLabels;
  end;
end;

procedure TViewContaAReceber.CarregarFormaPagto(const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAReceber.CarregarTipoReceita(const ApenasAtivos: Boolean);
begin
  FControllerTipoReceita.DAO.DataSet.Close;
  FControllerTipoReceita.DAO.DataSet.Filter   := '(ativo = 1)';
  FControllerTipoReceita.DAO.DataSet.Filtered := ApenasAtivos;
  FControllerTipoReceita.DAO.DataSet.Open;
end;

procedure TViewContaAReceber.ControleLabels;
begin
  lblVenda.Caption  := 'No. Venda:';
  daVenda.DataField := 'ANOVENDA';
  dnVenda.DataField := 'NUMVENDA';

  lblNFe.Caption  := 'NF-e:';
  dbNFe.DataField := 'NFE_VENDA';

  if (DtSrcTabela.DataSet.FieldByName('NUMOS').AsInteger > 0) then
  begin
    lblVenda.Caption  := 'No. OS:';
    daVenda.DataField := 'ANOOS';
    dnVenda.DataField := 'NUMOS';

    lblNFe.Caption  := 'NFS-e:';
    dbNFe.DataField := 'NFSE_OS';
  end;
end;

procedure TViewContaAReceber.dbFormaPagtoClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    if (dtsFormaPagto.DataSet.Locate('codigo', dbFormaPagto.Field.AsInteger, [])) then
      DtSrcTabela.DataSet.FieldByName('TIPPAG').AsString := dtsFormaPagto.DataSet.FieldByName('descricao').AsString;
end;

procedure TViewContaAReceber.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    with DtSrcTabela.DataSet do
    begin
      // Destacar Títulos A Receber cancelados
      if (FieldByName('SITUACAO').AsInteger = 0) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelado.Brush.Color
      else
      // Destacar Títulos A Receber em aberto
      if (not FieldByName('BAIXADO').IsNull) then
        if ( FieldByName('BAIXADO').AsInteger = STATUS_APAGAR_PENDENTE ) then
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

procedure TViewContaAReceber.dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
begin
  // Ctrl + Del
  if (Sender = dbgDados) then
    if (Shift = [ssCtrl]) and (Key = 46) Then
    begin

      if not LiberarUso then
        Exit;

      if not GetPermissaoRotinaInterna(Sender, True) then
        Abort;

      if ( not dtsRecebimentos.DataSet.IsEmpty ) then
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

        DataPagto := dtsRecebimentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime;

        if TServiceMessage.ShowConfirm('Confirma a exclusão do registro de pagamento?') then
        begin
          Recebimentos.EstornarRecebimento(Controller.DAO.Usuario.Login, CxContaCorrente);
          RecarregarRegistro;
          AbrirRecebimentos;
        end;
      end;
    end;
end;

procedure TViewContaAReceber.DtSrcTabelaDataChange(Sender: TObject;
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

procedure TViewContaAReceber.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAReceber.ReadOnly := (not dtsRecebimentos.DataSet.IsEmpty);
  btbtnIncluirLote.Enabled := btbtnIncluir.Enabled;
  HabilitarDesabilitar_Btns;

  CarregarFormaPagto(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString);
  CarregarTipoReceita((DtSrcTabela.DataSet.State in [dsEdit, dsInsert]));
end;

procedure TViewContaAReceber.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ControleLabels;
end;

procedure TViewContaAReceber.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    AbrirRecebimentos;

  ControleLabels;
end;

procedure TViewContaAReceber.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    AbrirRecebimentos;
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

procedure TViewContaAReceber.btbtnIncluirLoteClick(Sender: TObject);
var
//  sEmpresa ,
//  sLote    : String;
//  iCliente : Integer;
//  dDataEmissao    ,
//  dVencimentoFirst,
//  dVencimentoLast : TDateTime;
  sEmpresa,
  sLote    : String;
  iCliente : Integer;
  dDataEmissao    ,
  dVencimentoFirst,
  dVencimentoLast : TDateTime;
  aCliente : IControllerCliente;
begin
  if btbtnIncluir.Enabled then
  begin
    sEmpresa     := FController.DAO.Usuario.Empresa.CNPJ;
    sLote        := EmptyStr;
    iCliente     := 0;
    aCliente     := TControllerFactory.New.Cliente;
    dDataEmissao := Date;

    dVencimentoFirst := IncDay(dDataEmissao, 30);
    dVencimentoLast  := IncDay(dDataEmissao, 60);

    if GerarLoteParcelas(Self, sEmpresa, sLote, iCliente, dDataEmissao, dVencimentoFirst, dVencimentoLast)  then
    begin
      pgcGuias.ActivePage := tbsTabela;
      edtFiltrar.Text := aCliente.Get(iCliente).DataSet.FieldByName('nome').AsString;
      FLoteParcelas   := sLote;
      btnFiltrar.Click;

      FLoteParcelas := EmptyStr;
    end;
  end;
//  if btbtnIncluir.Enabled then
//  begin
//    sEmpresa     := Controller.DAO.Usuario.Empresa.CNPJ;
//    sLote        := EmptyStr;
//    iCliente     := 0;
//    dDataEmissao := Date;
//    dVencimentoFirst := dDataEmissao + 30;
//    dVencimentoLast  := dDataEmissao + 60;
//
//    if GerarLoteParcelas(Self, sEmpresa, sLote, iCliente, dDataEmissao, dVencimentoFirst, dVencimentoLast)  then
//    begin
//      pgcGuias.ActivePage := tbsTabela;
//      e1Data.Date     := dVencimentoFirst;
//      e2Data.Date     := dVencimentoLast;
//      edtFiltrar.Text := GetClienteNome(iCliente);
//      FLoteParcelas   := sLote;
//      btnFiltrar.Click;
//
//      FLoteParcelas := EmptyStr;
//    end;
//  end;
end;

procedure TViewContaAReceber.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

function TViewContaAReceber.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgPagamentos);
end;

function TViewContaAReceber.GetRotinaEfetuarPagtoID: String;
begin
  Result := GetRotinaInternaID(btbtnEfetuarPagto);
end;

procedure TViewContaAReceber.RecarregarRegistro;
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

function TViewContaAReceber.Controller: IControllerContaAReceber;
begin
  Result := (FController as IControllerContaAReceber);
end;

function TViewContaAReceber.Recebimentos: IControllerRecebimento;
begin
  Result := (Controller.Recebimentos as IControllerRecebimento);
end;

procedure TViewContaAReceber.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnEfetuarPagto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEfetuarPagtoID, btbtnEfetuarPagto.Hint, RotinaID);

    if dbgPagamentos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarPagtosID, 'Cancelar Recebimentos', RotinaID);
  end;
end;

procedure TViewContaAReceber.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
  Self.Caption := Self.Caption + ' - (' + Controller.DAO.Usuario.Empresa.Fantasia + ')';
end;

procedure TViewContaAReceber.FrReciboGetValue(const VarName: string;
  var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'RECIBO';

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

initialization
  FormFunction.RegisterForm('ViewContaAReceber', TViewContaAReceber);

end.
