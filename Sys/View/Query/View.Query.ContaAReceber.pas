unit View.Query.ContaAReceber;

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
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxButtons,

  View.PadraoPesquisa,
  Model.Constantes,
  SGE.Controller.Interfaces;

type
  TViewQueryContaAReceber = class(TViewPadraoPesquisa)
    lblData: TLabel;
    PnlControleQuitacao: TPanel;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaSelecionados: TAggregateField;
    dtsFormaPagto: TDataSource;
    dtsRecebimentoLOTE: TDataSource;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    CdsPesquisaANOLANC: TSmallintField;
    CdsPesquisaNUMLANC: TIntegerField;
    CdsPesquisaPARCELA: TSmallintField;
    CdsPesquisaDTEMISS: TDateField;
    CdsPesquisaDTVENC: TDateField;
    CdsPesquisaDTREC: TDateField;
    CdsPesquisaSELECIONAR: TSmallintField;
    CdsPesquisaLANCAMENTO: TStringField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaSAIDA: TStringField;
    CdsPesquisaSAIDA_ANO: TSmallintField;
    CdsPesquisaSAIDA_NUMERO: TIntegerField;
    CdsPesquisaSAIDA_DOC_TIPO: TStringField;
    CdsPesquisaSAIDA_DOC: TStringField;
    CdsPesquisaSAIDA_DOC_NUMERO: TLargeintField;
    CdsPesquisaSAIDA_DOC_SERIE: TStringField;
    CdsPesquisaSAIDA_CLIENTE: TStringField;
    CdsPesquisaSAIDA_CLIENTE_CNPJ: TStringField;
    CdsPesquisaTIPPAG: TStringField;
    CdsPesquisaVALORREC: TFMTBCDField;
    CdsPesquisaVALORMULTA: TFMTBCDField;
    CdsPesquisaVALORRECTOT: TFMTBCDField;
    CdsPesquisaVALORSALDO: TFMTBCDField;
    CdsPesquisaVALOR_ARECEBER: TFMTBCDField;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    GrpBxControleQuitacao: TGroupBox;
    lblDataPagto: TLabel;
    lblFormaPagto: TLabel;
    lblHistorico: TLabel;
    lblNumeroCheque: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbHistorico: TDBMemo;
    dbDataPagto: TJvDBDateEdit;
    dbNumeroCheque: TJvDBComboEdit;
    BtnQuitar: TcxButton;
    cdsRecebimentoLOTE: TClientDataSet;
    cdsRecebimentoLOTEDataPagto: TDateTimeField;
    cdsRecebimentoLOTEFormaPagto: TIntegerField;
    cdsRecebimentoLOTEHistoricoGeral: TMemoField;
    cdsRecebimentoLOTEControleCheque: TIntegerField;
    cdsRecebimentoLOTENumeroCheque: TStringField;
    cdsRecebimentoLOTEBancoFebraban: TStringField;
    cdsRecebimentoLOTEBancoBoleto: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure CdsPesquisaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnQuitarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbNumeroChequeButtonClick(Sender: TObject);
    procedure dtsPesquisaStateChange(Sender: TObject);
  private
    { Private declarations }
    FControllerFormaPagto  : IControllerCustom;
    FControllerRecebimento : IControllerRecebimento;
    FControllerCaixa : IControllerCaixa;
    FControllerBanco : IControllerBanco;

    CxAno    ,
    CxNumero ,
    CxContaCorrente : Integer;
    FProcessando : Boolean;
    FQuitarLista : TDictionary<String, Smallint>;

    procedure QuitarReceita;

    function Recebimentos : IControllerRecebimento;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBCONTREC
  - TBCONTREC_BAIXA
  - TBEMPRESA
  - TBCLIENTE
  - TBVENDAS
  - TBFORMPAGTO
  - TBBANCO_BOLETO

  Views:

  Procedures:

*)

var
  ViewQueryContaAReceber: TViewQueryContaAReceber;

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
  
function TViewQueryContaAReceber.ExecutarPesquisa: Boolean;
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

procedure TViewQueryContaAReceber.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not FProcessando;
end;

procedure TViewQueryContaAReceber.FormCreate(Sender: TObject);
var
  aEmpresa : ICOntrollerEmpresa;
begin
  FController := TControllerQueryFactory.Instance.ContaAReceber; //.DataSource(dtsPesquisa);
  FControllerFormaPagto  := TControllerFactory.New.FormaPagto;
  FControllerRecebimento := TControllerFactory.New.Recebimento;

  inherited;

  DspPesquisa.DataSet := Controller.DataSet;

  CampoAtivo   := 'selecionar';
  FQuitarLista := TDictionary<String, Smallint>.Create;

  e1Data.Date  := TControllerFactory.New.ContaAPagar.MenorVencimentoAPagar;
  e2Data.Date  := Date;
  FProcessando := False;

  cdsRecebimentoLOTE.CreateDataSet;

  // Configurar tabela de pesquisa
  Tabela
    .Display('numlanc', 'Número', '###0000000', TAlignment.taCenter)
    .Display('VALORREC', 'Receita (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORMULTA', 'Multa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORRECTOT', 'Recebido (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_ARECEBER', 'A Receber (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('selecionar', 'Quitar', TAlignment.taCenter, False);

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FormaPagto', 'codigo', 'codigo_descricao');

  aEmpresa := TControllerFactory.New.EmpresaView;
  Self.Caption := Self.Caption + ' - ' + aEmpresa.GetEmpresaFantasia(aEmpresa.DAO.Usuario.Empresa.CNPJ);
end;

procedure TViewQueryContaAReceber.CdsPesquisaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if Sender.AsInteger = 0 then
      Text := '.'
    else
      Text := 'X';  
end;

procedure TViewQueryContaAReceber.dbgDadosDblClick(Sender: TObject);
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

procedure TViewQueryContaAReceber.dbgDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #32) and (not dtsPesquisa.DataSet.IsEmpty) then
    dbgDadosDblClick(Sender)
  else
    inherited;
end;

procedure TViewQueryContaAReceber.dbNumeroChequeButtonClick(Sender: TObject);
var
  aCheque : TChequeBaixa;
begin
  if not (cdsRecebimentoLOTE.State in [dsEdit, dsInsert]) then
    cdsRecebimentoLOTE.Edit;

  if SelecionarChequeBaixa(Self, aCheque) then
  begin
    cdsRecebimentoLOTE.FieldByName('ControleCheque').AsInteger := aCheque.Codigo;
    cdsRecebimentoLOTE.FieldByName('NumeroCheque').AsString    := aCheque.Numero;
    cdsRecebimentoLOTE.FieldByName('BancoFebraban').AsString   := aCheque.Banco;
    cdsRecebimentoLOTE.FieldByName('DataPagto').AsDateTime     := aCheque.Data;
  end;
end;

procedure TViewQueryContaAReceber.dtsPesquisaStateChange(Sender: TObject);
begin
  inherited;
  BtnQuitar.Enabled := (not dtsPesquisa.DataSet.IsEmpty) and (StrToIntDef(CdsPesquisaSelecionados.AsString, 0) > 0);
end;

procedure TViewQueryContaAReceber.BtnQuitarClick(Sender: TObject);
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
    if not (dtsRecebimentoLOTE.DataSet.State in [dsEdit, dsInsert]) then
      dtsRecebimentoLOTE.DataSet.Edit;

    if (dtsRecebimentoLOTE.DataSet.FieldByName('DataPagto').IsNull or (dtsRecebimentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime = EncodeDate(1899, 12, 30))) then
    begin
      TServiceMessage.ShowWarning('Favor informar a Data de Recebimento para os lançamentos selecionados!');
      dbDataPagto.SetFocus;
    end
    else
    if (dtsRecebimentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime > Date) then
    begin
      TServiceMessage.ShowWarning('Não é permitido o registro de recebimentos futuros!');
      dbDataPagto.SetFocus;
    end
    else
    if dtsRecebimentoLOTE.DataSet.FieldByName('FormaPagto').IsNull then
    begin
      TServiceMessage.ShowWarning('Favor informar a Forma de Pagamento para os lançamentos selecionados!');
      dbFormaPagto.SetFocus;
    end
    else
    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(dtsRecebimentoLOTE.DataSet.FieldByName('NumeroCheque').AsString) = EmptyStr) ) then
    begin
      TServiceMessage.ShowWarning('Favor informar o Número do Cheque!');
      if dbNumeroCheque.Visible and dbNumeroCheque.Enabled then
        dbNumeroCheque.SetFocus;
    end
    else
    if ( Trim(dtsRecebimentoLOTE.DataSet.FieldByName('HistoricoGeral').AsString) = EmptyStr ) then
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
        FControllerRecebimento.DAO.Usuario.Empresa.CNPJ,
        FControllerRecebimento.DAO.Usuario.Login,
        dtsRecebimentoLOTE.DataSet.FieldByName('DataPagto').AsDateTime,
        dtsRecebimentoLOTE.DataSet.FieldByName('FormaPagto').AsInteger,
        CxAno,
        CxNumero,
        CxContaCorrente
      )) then
        TServiceMessage.ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(FControllerRecebimento.DAO.Usuario.Login) + ' na forma de pagamento desta quitação.')
      else
      begin
        if TServiceMessage.ShowConfirmation('Quitação por Lote', 'Confirma a quitação dos lançamentos de receitas selecionados?') then
        begin
          if (dtsRecebimentoLOTE.DataSet.FieldByName('BancoFebraban').AsString <> EmptyStr) then
          begin
            iBancoBoleto := FControllerBanco.GetBancoBoletoCodigo(
                FControllerRecebimento.DAO.Usuario.Empresa.CNPJ,
                dtsRecebimentoLOTE.DataSet.FieldByName('BancoFebraban').AsString
              );

            if (iBancoBoleto = 0) then
              dtsRecebimentoLOTE.DataSet.FieldByName('BancoBoleto').Clear
            else
              dtsRecebimentoLOTE.DataSet.FieldByName('BancoBoleto').AsInteger := iBancoBoleto;
          end;

          try
            dtsRecebimentoLOTE.DataSet.Post;
            QuitarReceita;
          finally
            cdsRecebimentoLOTE.Delete;
            ExecutarPesquisa;
          end;
        end;
      end;
    end;
  end;
end;

procedure TViewQueryContaAReceber.QuitarReceita;
var
  aLancamento,
  aHistorico : String;
  cTotalPago : Currency;
begin
  BtnQuitar.Enabled := False;
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Quitando recebimentos selecionados...');

  Application.ProcessMessages;

  dtsPesquisa.DataSet.Last;
  dtsPesquisa.DataSet.First;
  dtsPesquisa.DataSet.DisableControls;

  try
    try
      FProcessando := True;

      cTotalPago := 0.0;

      Recebimentos
        .DAO
          .ParamsByName('ano', 0)
          .ParamsByName('controle', 0)
          .Open;

      while not dtsPesquisa.DataSet.Eof do
      begin
        if FQuitarLista.ContainsKey(dtsPesquisa.DataSet.FieldByName('lancamento').AsString) then
        begin
          // 1. Gerar Registro de Pagamento
          Recebimentos.DAO.DataSet.Append;

          aHistorico := Trim(cdsRecebimentoLOTEHistoricoGeral.AsString);

          if (Copy(aHistorico, Length(aHistorico), 1) = '.') then
            aHistorico := Copy(aHistorico, 1, Length(aHistorico) - 1);

          Recebimentos.DAO.DataSet.FieldByName('ANOLANC').AsInteger     := CdsPesquisaANOLANC.AsInteger;
          Recebimentos.DAO.DataSet.FieldByName('NUMLANC').AsInteger     := CdsPesquisaNUMLANC.AsInteger;
          Recebimentos.DAO.DataSet.FieldByName('EMPRESA').AsString      := CdsPesquisaEMPRESA.AsString;
          Recebimentos.DAO.DataSet.FieldByName('SEQ').AsInteger         := 0; // Recebimentos.Sequencial('SEQ');
          Recebimentos.DAO.DataSet.FieldByName('DATA_PAGTO').AsDateTime := cdsRecebimentoLOTEDataPagto.Value;
          Recebimentos.DAO.DataSet.FieldByName('HISTORICO').AsString    := Trim(dbHistorico.Text);
          Recebimentos.DAO.DataSet.FieldByName('USUARIO').AsString      := Recebimentos.DAO.Usuario.Login;
          Recebimentos.DAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency    := CdsPesquisaVALOR_ARECEBER.AsCurrency;
          Recebimentos.DAO.DataSet.FieldByName('FORMA_PAGTO').AsInteger     := cdsRecebimentoLOTEFormaPagto.AsInteger;
          Recebimentos.DAO.DataSet.FieldByName('FORMA_PAGTO_DESC').AsString := Trim(dbFormaPagto.Text);

          Recebimentos.DAO.DataSet.Post;
          Recebimentos.DAO.ApplyUpdates;
          Recebimentos.DAO.CommitUpdates;

          // 2. Gerar Registro de Movimento de Caixa (Tesouraria)
          Recebimentos.GerarMovimentoCaixa(FControllerRecebimento.DAO.Usuario.Login);
          Recebimentos.DAO.CommitTransaction;

          cTotalPago := cTotalPago + CdsPesquisaVALOR_ARECEBER.AsCurrency;
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
      Recebimentos.GerarSaldoConta(CxContaCorrente, cdsRecebimentoLOTEDataPagto.AsDateTime);

    TServiceMessage.ShowInformation('Quitação por Lote relalizado com sucesso!');
    ExecutarPesquisa;
  end;
end;

function TViewQueryContaAReceber.Recebimentos: IControllerRecebimento;
begin
  if not Assigned(FControllerRecebimento) then
  begin
    FControllerRecebimento := TControllerFactory.New.Recebimento;
    FControllerRecebimento
        .DAO
        .Where('p.anolanc = :ano')
        .Where('p.numlanc = :controle')
        .OrderBy('p.seq');
  end;

  Result := FControllerRecebimento;
end;

procedure TViewQueryContaAReceber.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    Self.Close
end;

initialization
  FormFunction.RegisterForm('ViewQueryContaAReceber', TViewQueryContaAReceber);

end.
