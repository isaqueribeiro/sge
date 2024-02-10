unit View.Query.ContaAPagar;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  cxGraphics,
  cxLookAndFeels,
  cxButtons,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,

  View.PadraoPesquisa,
  Model.Constantes,
  SGE.Controller.Interfaces;

type
  TViewQueryContaAPagar = class(TViewPadraoPesquisa)
    lblData: TLabel;
    PnlControleQuitacao: TPanel;
    GrpBxControleQuitacao: TGroupBox;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaSelecionados: TAggregateField;
    dtsFormaPagto: TDataSource;
    lblDataPagto: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataPagto: TJvDBDateEdit;
    CdsPesquisaANOLANC: TSmallintField;
    CdsPesquisaNUMLANC: TIntegerField;
    CdsPesquisaLANCAMENTO: TStringField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaPARCELA: TSmallintField;
    CdsPesquisaTIPPAG: TStringField;
    CdsPesquisaDTEMISS: TDateField;
    CdsPesquisaDTVENC: TDateField;
    CdsPesquisaDTPAG: TDateField;
    CdsPesquisaENTRADA: TStringField;
    CdsPesquisaENTRADA_ANO: TSmallintField;
    CdsPesquisaENTRADA_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_TIPO: TStringField;
    CdsPesquisaENTRADA_DOC: TStringField;
    CdsPesquisaENTRADA_DOC_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_SERIE: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR_CNPJ: TStringField;
    CdsPesquisaSELECIONAR: TSmallintField;
    CdsPesquisaVALORPAG: TFMTBCDField;
    CdsPesquisaVALORMULTA: TFMTBCDField;
    CdsPesquisaVALORPAGTOT: TFMTBCDField;
    CdsPesquisaVALORSALDO: TFMTBCDField;
    CdsPesquisaVALOR_APAGAR: TFMTBCDField;
    BtnQuitar: TcxButton;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    lblNumeroCheque: TLabel;
    dbNumeroCheque: TJvDBComboEdit;
    cdsPagamentoLOTE: TClientDataSet;
    cdsPagamentoLOTEDataPagto: TDateTimeField;
    cdsPagamentoLOTEFormaPagto: TIntegerField;
    cdsPagamentoLOTEHistoricoGeral: TMemoField;
    dtsPagamentoLOTE: TDataSource;
    cdsPagamentoLOTEControleCheque: TIntegerField;
    cdsPagamentoLOTENumeroCheque: TStringField;
    cdsPagamentoLOTEBancoFebraban: TStringField;
    cdsPagamentoLOTEBancoBoleto: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BtnQuitarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure dtsPagamentoLOTEDataChange(Sender: TObject; Field: TField);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbNumeroChequeButtonClick(Sender: TObject);
    procedure dtsPesquisaStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FControllerFormaPagto : IControllerCustom;
    FControllerPagamento  : IControllerPagamento;
    FControllerCaixa : IControllerCaixa;
    FControllerBanco : IControllerBanco;

    CxAno    ,
    CxNumero ,
    CxContaCorrente : Integer;
    FProcessando : Boolean;
    FQuitarLista : TDictionary<String, Smallint>;

    procedure QuitarDespesa;

    function Pagamentos : IControllerPagamento;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBCONTPAG_BAIXA
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCOMPRAS
  - TBFORMPAGTO
  - TBBANCO_BOLETO

  Views:
  - VW_TIPO_DOCUMENTO_ENTRADA

  Procedures:

*)

implementation

uses
    System.DateUtils
  , UDMRecursos
  , UConstantesDGE
  , Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , SGE.Controller.Query.Factory
  , Controller.Tabela
  , View.Cheque;

{$R *.dfm}

{ TfrmGeContasAPagarQuitar }

const
  TIPO_AUT = 0;

function TViewQueryContaAPagar.ExecutarPesquisa: Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      FQuitarLista.Clear;
      FQuitarLista.TrimExcess;

      CdsPesquisa.Close;

      if Assigned(FController) then
      begin
        Result := not
          FController
            .DataIncial(e1Data.Date)
            .DataFinal(e2Data.Date)
            .Execute(TTipoPesquisa(edTipoPesquisa.ItemIndex), edPesquisar.Text)
            .DataSet
              .IsEmpty;

        Tabela.Configurar;
      end;

      if Result then
      begin
        FController.DataSet.Close;
        CdsPesquisa.Open;
      end;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewQueryContaAPagar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not FProcessando;
end;

procedure TViewQueryContaAPagar.FormCreate(Sender: TObject);
var
  aEmpresa : IControllerEmpresa;
begin
  FController := TControllerQueryFactory.Instance.ContaAPagar; //.DataSource(dtsPesquisa);
  FControllerFormaPagto := TControllerFactory.New.FormaPagto;
  FControllerPagamento  := TControllerFactory.New.Pagamento;

  inherited;

  DspPesquisa.DataSet := Controller.DataSet;

  CampoAtivo   := 'selecionar';
  FQuitarLista := TDictionary<String, Smallint>.Create;

  e1Data.Date  := TControllerFactory.New.ContaAPagar.MenorVencimentoAPagar;
  e2Data.Date  := Date;
  FProcessando := False;

  cdsPagamentoLOTE.CreateDataSet;

  // Configurar tabela de pesquisa
  Tabela
    .Display('numlanc', 'Número', '###0000000', TAlignment.taCenter)
    .Display('VALORPAG', 'Despesa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORMULTA', 'Multa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORPAGTOT', 'Pago (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_APAGAR', 'A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('selecionar', 'Quitar', TAlignment.taCenter, False);

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FormaPagto', 'codigo', 'codigo_descricao');

  aEmpresa := TControllerFactory.New.EmpresaView;
  Self.Caption := Self.Caption + ' - ' + aEmpresa.GetEmpresaFantasia(aEmpresa.DAO.Usuario.Empresa.CNPJ);
end;

procedure TViewQueryContaAPagar.FormDestroy(Sender: TObject);
begin
  FQuitarLista.Clear;
  FQuitarLista.DisposeOf;
  inherited;
end;

procedure TViewQueryContaAPagar.dbgDadosDblClick(Sender: TObject);
begin
  if dtsPesquisa.AutoEdit then
    if (not dtsPesquisa.DataSet.IsEmpty) then
    begin
      dtsPesquisa.DataSet.Edit;
      if ( dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
      begin
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 1;
        FQuitarLista.AddOrSetValue(dtsPesquisa.DataSet.FieldByName('lancamento').AsString, 1);
      end
      else
      begin
        dtsPesquisa.DataSet.FieldByName('selecionar').AsInteger := 0;
        if FQuitarLista.ContainsKey(dtsPesquisa.DataSet.FieldByName('lancamento').AsString) then
          FQuitarLista.Remove(dtsPesquisa.DataSet.FieldByName('lancamento').AsString);
      end;

      dtsPesquisa.DataSet.Post;
      FQuitarLista.TrimExcess;
    end;
end;

procedure TViewQueryContaAPagar.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #32) and (not dtsPesquisa.DataSet.IsEmpty) then
    dbgDadosDblClick(Sender)
  else
    inherited;
end;

procedure TViewQueryContaAPagar.dbNumeroChequeButtonClick(Sender: TObject);
var
  aCheque : TChequeBaixa;
begin
  if not (cdsPagamentoLOTE.State in [dsEdit, dsInsert]) then
    cdsPagamentoLOTE.Edit;

  if SelecionarChequeBaixa(Self, aCheque) then
  begin
    cdsPagamentoLOTE.FieldByName('ControleCheque').AsInteger := aCheque.Codigo;
    cdsPagamentoLOTE.FieldByName('NumeroCheque').AsString    := aCheque.Numero;
    cdsPagamentoLOTE.FieldByName('BancoFebraban').AsString   := aCheque.Banco;
    cdsPagamentoLOTE.FieldByName('DataPagto').AsDateTime     := aCheque.Data;
  end;
end;

procedure TViewQueryContaAPagar.dtsPagamentoLOTEDataChange(Sender: TObject; Field: TField);
begin
  if (Field <> nil) and (Field = Field.DataSet.FieldByName('FormaPagto')) then
    dbNumeroCheque.Enabled := (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0);
end;

procedure TViewQueryContaAPagar.dtsPesquisaStateChange(Sender: TObject);
begin
  inherited;
  BtnQuitar.Enabled := (not dtsPesquisa.DataSet.IsEmpty) and (StrToIntDef(CdsPesquisaSelecionados.AsString, 0) > 0);
end;

procedure TViewQueryContaAPagar.btnFecharClick(Sender: TObject);
begin
  if FProcessando then
    Abort;

  inherited;
end;

procedure TViewQueryContaAPagar.BtnQuitarClick(Sender: TObject);
var
  iBancoBoleto : Integer;
begin
  inherited;

  if FProcessando then
    Abort;

  CxAno    := 0;
  CxNumero := 0;
  CxContaCorrente := 0;

  if dtsPesquisa.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Não há registros de despesas para quitação!')
  else
  if StrToIntDef(CdsPesquisaSelecionados.AsString, 0) < 2 then
  begin
    TServiceMessage.ShowWarning('Favor selecionar no mínimo 2 registros para baixa em lote!');
    dbgDados.SetFocus;
  end
  else
  begin
    if not (dtsPagamentoLOTE.DataSet.State in [dsEdit, dsInsert]) then
      dtsPagamentoLOTE.DataSet.Edit;

    if (dtsPagamentoLOTE.DataSet.FieldByName('DataPagto').IsNull or (dtsPagamentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime = EncodeDate(1899, 12, 30))) then
    begin
      TServiceMessage.ShowWarning('Favor informar a Data de Pagamento para os lançamentos selecionados!');
      dbDataPagto.SetFocus;
    end
    else
    if (dtsPagamentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime > Date) then
    begin
      TServiceMessage.ShowWarning('Não é permitido o registro de pagamentos futuros!');
      dbDataPagto.SetFocus;
    end
    else
    if dtsPagamentoLOTE.DataSet.FieldByName('FormaPagto').IsNull then
    begin
      TServiceMessage.ShowWarning('Favor informar a Forma de Pagamento para os lançamentos selecionados!');
      dbFormaPagto.SetFocus;
    end
    else
    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(dtsPagamentoLOTE.DataSet.FieldByName('NumeroCheque').AsString) = EmptyStr) ) then
    begin
      TServiceMessage.ShowWarning('Favor informar o Número do Cheque!');
      if dbNumeroCheque.Visible and dbNumeroCheque.Enabled then
        dbNumeroCheque.SetFocus;
    end
    else
    if ( Trim(dtsPagamentoLOTE.DataSet.FieldByName('HistoricoGeral').AsString) = EmptyStr ) then
    begin
      TServiceMessage.ShowWarning('Favor informar um histório geral para os lançamentos selecionados!');
      dbHistorico.SetFocus;
    end
    else
    begin
      if (not Assigned(FControllerCaixa)) then
        FControllerCaixa := TControllerFactory.New.Caixa;

      if (not Assigned(FControllerBanco)) then
        FControllerBanco := TControllerFactory.New.Banco;

      if (not FControllerCaixa.CaixaAberto(
        FControllerPagamento.DAO.Usuario.Empresa.CNPJ,
        FControllerPagamento.DAO.Usuario.Login,
        dtsPagamentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime,
        dtsPagamentoLOTE.DataSet.FieldByName('FormaPagto').AsInteger,
        CxAno,
        CxNumero,
        CxContaCorrente
      )) then
        TServiceMessage.ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(FControllerPagamento.DAO.Usuario.Login) + ' na forma de pagamento desta quitação.')
      else
      begin
        if TServiceMessage.ShowConfirmation('Quitação por Lote', 'Confirma a quitação dos lançamentos de despesas selecionados?') then
        begin
          if (dtsPagamentoLOTE.DataSet.FieldByName('BancoFebraban').AsString <> EmptyStr) then
          begin
            iBancoBoleto := FControllerBanco.GetBancoBoletoCodigo(
                FControllerPagamento.DAO.Usuario.Empresa.CNPJ,
                dtsPagamentoLOTE.DataSet.FieldByName('BancoFebraban').AsString
              );

            if (iBancoBoleto = 0) then
              dtsPagamentoLOTE.DataSet.FieldByName('BancoBoleto').Clear
            else
              dtsPagamentoLOTE.DataSet.FieldByName('BancoBoleto').AsInteger := iBancoBoleto;
          end;

          try
            dtsPagamentoLOTE.DataSet.Post;
            QuitarDespesa;
          finally
            cdsPagamentoLOTE.Delete;
            ExecutarPesquisa;
          end;
        end;
      end;
    end;
  end;
end;

procedure TViewQueryContaAPagar.QuitarDespesa;
var
  aLancamento,
  aHistorico : String;
  cTotalPago : Currency;
begin
  BtnQuitar.Enabled := False;
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Quitando pagamentos selecionados...');

  Application.ProcessMessages;

  dtsPesquisa.DataSet.Last;
  dtsPesquisa.DataSet.First;
  dtsPesquisa.DataSet.DisableControls;

  try
    try
      FProcessando := True;

      cTotalPago := 0.0;

      Pagamentos
        .DAO
          .ParamsByName('ano', 0)
          .ParamsByName('controle', 0)
          .Open;

      while not dtsPesquisa.DataSet.Eof do
      begin
        if FQuitarLista.ContainsKey(dtsPesquisa.DataSet.FieldByName('lancamento').AsString) then
        begin
          // 1. Gerar Registro de Pagamento
          Pagamentos.DAO.DataSet.Append;

          aHistorico := Trim(cdsPagamentoLOTEHistoricoGeral.AsString);

          if (Copy(aHistorico, Length(aHistorico), 1) = '.') then
            aHistorico := Copy(aHistorico, 1, Length(aHistorico) - 1);

          Pagamentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger     := CdsPesquisaANOLANC.AsInteger;
          Pagamentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger     := CdsPesquisaNUMLANC.AsInteger;
          Pagamentos.DAO.DataSet.FieldByName('EMPRESA').AsString      := CdsPesquisaEMPRESA.AsString;
          Pagamentos.DAO.DataSet.FieldByName('SEQ').AsInteger         := 0; // Pagamentos.Sequencial('SEQ');
          Pagamentos.DAO.DataSet.FieldByName('DATA_PAGTO').AsDateTime := cdsPagamentoLOTEDataPagto.Value;
          Pagamentos.DAO.DataSet.FieldByName('HISTORICO').AsString    := Trim(dbHistorico.Text);
          Pagamentos.DAO.DataSet.FieldByName('USUARIO').AsString      := Pagamentos.DAO.Usuario.Login;
          Pagamentos.DAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency    := CdsPesquisaVALOR_APAGAR.AsCurrency;
          Pagamentos.DAO.DataSet.FieldByName('FORMA_PAGTO').AsInteger     := cdsPagamentoLOTEFormaPagto.AsInteger;
          Pagamentos.DAO.DataSet.FieldByName('FORMA_PAGTO_DESC').AsString := Trim(dbFormaPagto.Text);

          Pagamentos.DAO.DataSet.Post;
          Pagamentos.DAO.ApplyUpdates;
          Pagamentos.DAO.CommitUpdates;

          // 2. Gerar Registro de Movimento de Caixa (Tesouraria)
          Pagamentos.GerarMovimentoCaixa(FControllerPagamento.DAO.Usuario.Login);
          Pagamentos.DAO.CommitTransaction;

          cTotalPago := cTotalPago + CdsPesquisaVALOR_APAGAR.AsCurrency;
        end;

        dtsPesquisa.DataSet.Next;
      end;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        TServiceMessage.ShowError(E.Message);
      end;
    end;
  finally
    FProcessando      := False;
    BtnQuitar.Enabled := True;

    dtsPesquisa.DataSet.First;
    dtsPesquisa.DataSet.EnableControls;

    // 3. Gerar/Atualizar Saldo do Dia
    if ( (cTotalPago > 0.0) and (CxContaCorrente > 0) ) then
      Pagamentos.GerarSaldoConta(CxContaCorrente, cdsPagamentoLOTEDataPagto.AsDateTime);

    TServiceMessage.ShowInformation('Quitação por Lote relalizado com sucesso!');
    ExecutarPesquisa;
  end;
end;

procedure TViewQueryContaAPagar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
    Self.Close
end;

function TViewQueryContaAPagar.Pagamentos: IControllerPagamento;
begin
  if not Assigned(FControllerPagamento) then
  begin
    FControllerPagamento := TControllerFactory.New.Pagamento;
    FControllerPagamento
        .DAO
        .Where('p.anolanc = :ano')
        .Where('p.numlanc = :controle')
        .OrderBy('p.seq');
  end;

  Result := FControllerPagamento;
end;

initialization
  FormFunction.RegisterForm('ViewQueryContaAPagar', TViewQueryContaAPagar);

end.
