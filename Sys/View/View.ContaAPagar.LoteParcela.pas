unit View.ContaAPagar.LoteParcela;

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

  cxControls,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  cxDBData,
  cxDBLookupComboBox,
  cxCalendar,
  cxCurrencyEdit,
  cxTextEdit,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,

  ACBrBase,
  ACBrExtenso,

  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog,

  UGrPadrao,
  UConstantesDGE,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Interfaces,
  SGE.Controller.Impressao.ContaAPagar, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxScrollbarAnnotations;

type
  TViewContaAPagarLoteParcela = class(TfrmGrPadrao)
    tmrAlerta: TTimer;
    lblInforme: TLabel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    GrpBxLancamento: TGroupBox;
    cdsDadosNominais: TClientDataSet;
    cdsDadosNominaisEmpresa: TStringField;
    cdsDadosNominaisFornecedor: TIntegerField;
    cdsDadosNominaisNumeroParcelas: TIntegerField;
    cdsDadosNominaisValorTotal: TCurrencyField;
    cdsDadosNominaisEmissao: TDateTimeField;
    cdsDadosNominaisDiaVencimento: TSmallintField;
    cdsDadosNominaisNumeroDias: TIntegerField;
    Bevel1: TBevel;
    dtsDadosNominais: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    dbFornecedor: TJvDBComboEdit;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    cdsDadosNominaisFornecedorNome: TStringField;
    cdsDadosNominaisFormaPagto: TSmallintField;
    cdsDadosNominaisCondicaoPagto: TSmallintField;
    cdsDadosNominaisTipoDespesa: TIntegerField;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    pnlParcelas: TPanel;
    GrpBxParametros: TGroupBox;
    lblNumeroParcelasX: TLabel;
    lblDiaVencimentoX: TLabel;
    dbNumeroParcelas: TDBEdit;
    dbValorTotal: TDBEdit;
    dbDiaVencimento: TDBEdit;
    lblNumeroDiasX: TLabel;
    dbNumeroDias: TDBEdit;
    Label4: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    GrpBxParcelas: TGroupBox;
    BtnGerar: TcxButton;
    cdsParcelas: TClientDataSet;
    dtsParcelas: TDataSource;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    cdsDadosNominaisNotaFiscal: TStringField;
    cdsParcelasParcela: TSmallintField;
    cdsParcelasVencimento: TDateTimeField;
    cdsParcelasDiaSemana: TSmallintField;
    cdsParcelasValorParcela: TCurrencyField;
    dbgParcelasTbl: TcxGridDBTableView;
    dbgParcelasLv: TcxGridLevel;
    dbgParcelas: TcxGrid;
    cdsParcelasObservacao: TStringField;
    dbgParcelasTblParcela: TcxGridDBColumn;
    dbgParcelasTblVencimento: TcxGridDBColumn;
    dbgParcelasTblDiaSemana: TcxGridDBColumn;
    dbgParcelasTblValorParcela: TcxGridDBColumn;
    dbgParcelasTblObservacao: TcxGridDBColumn;
    cdsDadosNominaisPrimeiroVencimento: TDateTimeField;
    RdGrpVencimentoFimSemana: TRadioGroup;
    dbPrimeiroVencimento: TJvDBDateEdit;
    lblPrimeiroVencimentoX: TLabel;
    cdsParcelasCompetencia: TIntegerField;
    dbgParcelasTblCompetencia: TcxGridDBColumn;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    dtsCompetencia: TDataSource;
    dtsTpDespesa: TDataSource;
    cmTipoValor: TComboBox;
    cdsDadosNominaisObservacao: TStringField;
    lblObservacao: TLabel;
    dbObservacao: TDBEdit;
    procedure tmrAlertaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsDadosNominaisNewRecord(DataSet: TDataSet);
    procedure BtnGerarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsParcelasDiaSemanaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtsParcelasDataChange(Sender: TObject; Field: TField);
    procedure dbgParcelasEnter(Sender: TObject);
    procedure dbgParcelasExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dtsParcelasStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FLote : String;
    FController : IControllerContaAPagar;
    FControllerEmpresaView : IControllerEmpresa;
    FControllerFormaPagto  ,
    FControllerCondicaoPagtoView,
    FControllerTipoDespesa : IControllerCustom;
    FControllerCompetencia : IControllerCompetencia;

    procedure CarregarLista(const pDataSet : TDataSet);
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoDespesa(const ApenasAtivos : Boolean);

    function GerarLancamentos : Boolean;
  public
    { Public declarations }
    property Lote : String read FLote;

    procedure RegistrarRotinaSistema; override;
  end;

  function GerarLoteParcelas(const AOnwer : TComponent;
    var aEmpresa, aLote : String;
    var aFornecedor : Integer;
    var aDataEmissao, aVencimentoFirst, aVencimentoLast : TDateTime) : Boolean;

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

implementation

{$R *.dfm}

uses
  System.DateUtils,
  UDMRecursos,
  View.CampoRequisitado,
  View.Fornecedor,
  SGE.Controller,
  SGE.Controller.Helper,
  SGE.Controller.Factory,
  Service.Message;

function GerarLoteParcelas(const AOnwer : TComponent;
  var aEmpresa, aLote : String;
  var aFornecedor : Integer;
  var aDataEmissao, aVencimentoFirst, aVencimentoLast : TDateTime) : Boolean;
var
  AForm : TViewContaAPagarLoteParcela;
begin
  AForm := TViewContaAPagarLoteParcela.Create(AOnwer);
  try
    AForm.cdsDadosNominais.Append;
    Result := (AForm.ShowModal = mrOk);

    if Result then
    begin
      aEmpresa     := AForm.cdsDadosNominaisEmpresa.AsString;
      aLote        := AForm.Lote;
      aFornecedor  := AForm.cdsDadosNominaisFornecedor.AsInteger;
      aDataEmissao := AForm.cdsDadosNominaisEmissao.AsDateTime;

      AForm.cdsParcelas.First;
      aVencimentoFirst := AForm.cdsParcelasVencimento.AsDateTime;

      AForm.cdsParcelas.Last;
      aVencimentoLast  := AForm.cdsParcelasVencimento.AsDateTime;
    end;
  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewContaAPagarLoteParcela.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TViewContaAPagarLoteParcela.btnConfirmarClick(Sender: TObject);
begin
  if TServiceMessage.ShowConfirmation('Confirma que o lote de parcelas seja gravada na programação de Contas A Pagar?') then
    if GerarLancamentos then
      ModalResult := mrOk;
end;

procedure TViewContaAPagarLoteParcela.BtnGerarClick(Sender: TObject);
var
  I : Integer;
  sValorParc  ,
  sVencimento : String;
  dDataTemp   ,
  dVencimento : TDateTime;
  cValorTotalTemp,
  cValorParc  ,
  cValorTotal : Currency;
begin
  if ( not CamposRequiridos(Self, TClientDataSet(cdsDadosNominais), Self.Caption) ) then
  begin
    if cdsDadosNominaisNumeroParcelas.AsInteger < 2 then
    begin
      TServiceMessage.ShowWarning('Número de parcelas inválido para este processo.');
      Exit;
    end
    else
    if cdsDadosNominaisValorTotal.AsCurrency < 1.0 then
    begin
      TServiceMessage.ShowWarning('Valor Total das parcelas inválido para este processo.');
      Exit;
    end
    else
    if ((cdsDadosNominaisDiaVencimento.AsInteger < 1) or (cdsDadosNominaisDiaVencimento.AsInteger > 31))
      and (cdsDadosNominaisNumeroDias.AsInteger = 0) then
    begin
      TServiceMessage.ShowWarning('Dia de vencimento inválido.');
      Exit;
    end
    else
    if (cdsDadosNominaisNumeroDias.AsInteger < 1) and (cdsDadosNominaisDiaVencimento.AsInteger = 0) then
    begin
      TServiceMessage.ShowWarning('Periodicidade em dias inválida para gerar vencimentos.');
      Exit;
    end;

    if cdsDadosNominais.State in [dsEdit, dsInsert] then
      cdsDadosNominais.Post;

    // Definir tabela vazia de Parcelas

    if not cdsParcelas.Active then
      cdsParcelas.CreateDataSet
    else
    while not cdsParcelas.Eof do
      cdsParcelas.Delete;

    // (INICIO) --> Gerar Parcelas

    if (cmTipoValor.ItemIndex = 0) then
    begin
      cValorParc      := cdsDadosNominaisValorTotal.AsCurrency;
      cValorTotalTemp := (cValorParc * cdsDadosNominaisNumeroParcelas.AsInteger);
    end
    else
    begin
      cValorParc      := cdsDadosNominaisValorTotal.AsCurrency / cdsDadosNominaisNumeroParcelas.AsInteger;
      cValorTotalTemp := cdsDadosNominaisValorTotal.AsCurrency;
    end;

    sValorParc  := FormatFloat('#############0.000', cValorParc);
    cValorParc  := StrToCurr(Copy(sValorParc, 1, Length(sValorParc) - 1));
    cValorTotal := 0.0;
    dDataTemp   := cdsDadosNominaisPrimeiroVencimento.AsDateTime;

    for I := 1 to cdsDadosNominaisNumeroParcelas.AsInteger do
    begin
      if ( cdsDadosNominaisDiaVencimento.AsInteger > 0 ) then
        sVencimento := FormatFloat('00"/"', cdsDadosNominaisDiaVencimento.AsInteger) +
          FormatDateTime('mm/yyyy', dDataTemp)
      else
        sVencimento := FormatDateTime('dd/mm/yyyy', dDataTemp);

      if not TryStrToDate(sVencimento, dVencimento) then
      begin
        Case StrToInt(Copy(sVencimento, 1, 2)) of
          29 : sVencimento := '28/' + Copy(sVencimento, 4, 5);
          30 : sVencimento := '29/' + Copy(sVencimento, 4, 5);
          31 : sVencimento := '30/' + Copy(sVencimento, 4, 5);
        end;

        if not TryStrToDate(sVencimento, dVencimento) then
          Case StrToInt(Copy(sVencimento, 1, 2)) of
            29 : sVencimento := '28/' + Copy(sVencimento, 4, 5);
            30 : sVencimento := '29/' + Copy(sVencimento, 4, 5);
            31 : sVencimento := '30/' + Copy(sVencimento, 4, 5);
          end;

        if not TryStrToDate(sVencimento, dVencimento) then
          Case StrToInt(Copy(sVencimento, 1, 2)) of
            29 : sVencimento := '28/' + Copy(sVencimento, 4, 5);
            30 : sVencimento := '29/' + Copy(sVencimento, 4, 5);
            31 : sVencimento := '30/' + Copy(sVencimento, 4, 5);
          end;
      end;

      Case RdGrpVencimentoFimSemana.ItemIndex of
        1:
          Case DayOfWeek(dVencimento) of
            1 : dVencimento := dVencimento - 2; // Movendo de Domingo para Sexta
            7 : dVencimento := dVencimento - 1; // Movendo de Sábado para Sexta
          end;

        2:
          Case DayOfWeek(dVencimento) of
            1 : dVencimento := dVencimento + 1; // Movendo de Domingo para Segunda
            7 : dVencimento := dVencimento + 2; // Movendo de Sábado para Segunda
          end;
      end;

      cdsParcelas.Append;
      cdsParcelasParcela.AsInteger       := I;
      cdsParcelasCompetencia.AsInteger   := FControllerCompetencia.GetID(dVencimento - 30);
      cdsParcelasVencimento.AsDateTime   := dVencimento;
      cdsParcelasValorParcela.AsCurrency := cValorParc;
      cdsParcelasObservacao.AsString     := Trim(cdsDadosNominaisObservacao.AsString).ToUpper;
      cdsParcelas.Post;

      dDataTemp   := dDataTemp + cdsDadosNominaisNumeroDias.AsInteger;
      cValorTotal := cValorTotal + cValorParc;
    end;

    cdsParcelas.First;

    // (FINAL) --> Gerar Parcelas

    // Ajustar valor da última parcela com o valor residual
    if ( cValorTotal <> cValorTotalTemp ) then
    begin
      cdsParcelas.Last;
      cdsParcelas.Edit;
      cdsParcelasValorParcela.AsCurrency := cdsParcelasValorParcela.AsCurrency + (cValorTotalTemp - cValorTotal);
      cdsParcelas.Post;
      cdsParcelas.First;
    end;

    dbgParcelas.SetFocus;
    dbgParcelasTblCompetencia.Focused := True;
  end;
end;

procedure TViewContaAPagarLoteParcela.CarregarFormaPagto(
  const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAPagarLoteParcela.CarregarLista(const pDataSet: TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
end;

procedure TViewContaAPagarLoteParcela.CarregarTipoDespesa(
  const ApenasAtivos: Boolean);
begin
  FControllerTipoDespesa.DAO.DataSet.Close;
  FControllerTipoDespesa.DAO.DataSet.Filter   := '(ativo = 1)';
  FControllerTipoDespesa.DAO.DataSet.Filtered := ApenasAtivos;
  FControllerTipoDespesa.DAO.DataSet.Open;
end;

procedure TViewContaAPagarLoteParcela.cdsDadosNominaisNewRecord(
  DataSet: TDataSet);
begin
  cdsDadosNominaisEmpresa.AsString         := FController.DAO.Usuario.Empresa.CNPJ;
  cdsDadosNominaisFormaPagto.AsInteger     := FController.DAO.Configuracao.Padrao.FormaPagtoID;
  cdsDadosNominaisCondicaoPagto.AsInteger  := FController.DAO.Configuracao.Padrao.CondicaoPagtoID;
  cdsDadosNominaisNumeroParcelas.AsInteger := 2;
  cdsDadosNominaisValorTotal.AsCurrency    := 0.0;
  cdsDadosNominaisEmissao.AsDateTime       := Date;
  cdsDadosNominaisPrimeiroVencimento.AsDateTime := cdsDadosNominaisEmissao.AsDateTime;
  cdsDadosNominaisDiaVencimento.AsInteger  := 5;
  cdsDadosNominaisNumeroDias.AsInteger     := 30;
  cdsDadosNominaisFornecedor.Clear;
  cdsDadosNominaisFornecedorNome.Clear;
  cdsDadosNominaisTipoDespesa.Clear;
end;

procedure TViewContaAPagarLoteParcela.cdsParcelasDiaSemanaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      1 : Text := 'DOM';
      2 : Text := 'SEG';
      3 : Text := 'TER';
      4 : Text := 'QUA';
      5 : Text := 'QUI';
      6 : Text := 'SEX';
      7 : Text := 'SAB';
    end;
end;

procedure TViewContaAPagarLoteParcela.dbFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if not (cdsDadosNominais.State in [dsEdit, dsInsert]) then
    cdsDadosNominais.Edit;

  if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
  begin
    cdsDadosNominaisFornecedor.AsInteger    := iCodigo;
    cdsDadosNominaisFornecedorNome.AsString := sNome;
  end;
end;

procedure TViewContaAPagarLoteParcela.dbgParcelasEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TViewContaAPagarLoteParcela.dbgParcelasExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if (cdsParcelas.State in [dsEdit, dsInsert]) then
    cdsParcelas.Post;
end;

procedure TViewContaAPagarLoteParcela.dtsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  if Field = cdsParcelasVencimento then
    if (cdsParcelas.State in [dsEdit, dsInsert]) then
      cdsParcelasDiaSemana.AsInteger := DayOfWeek(Field.AsDateTime);
end;

procedure TViewContaAPagarLoteParcela.dtsParcelasStateChange(Sender: TObject);
begin
  btnConfirmar.Enabled := (not (cdsParcelas.State in [dsEdit, dsInsert]))
    and (cdsParcelas.RecordCount > 0);
end;

procedure TViewContaAPagarLoteParcela.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.ContaAPagar;

  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerFormaPagto  := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;
  FControllerCompetencia := TControllerFactory.New.Competencia;
  FControllerTipoDespesa := TControllerFactory.New.TipoDespesa;

  inherited;

  cdsDadosNominais.CreateDataSet;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'Empresa', 'cnpj', 'razao');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FormaPagto', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'CondicaoPagto', 'cond_cod', 'cond_descricao');

  TController(FControllerCompetencia)
    .LookupComboBox(dbgParcelasTblCompetencia, dtsCompetencia, 'Competencia', 'cmp_num', 'cmp_desc');

  TController(FControllerTipoDespesa)
    .LookupComboBox(dbTipoDespesa, dtsTpDespesa, 'TipoDespesa', 'codigo', 'descricao');
end;

procedure TViewContaAPagarLoteParcela.FormShow(Sender: TObject);
begin
  inherited;
  CarregarFormaPagto(FController.DAO.Usuario.Empresa.CNPJ);
  CarregarTipoDespesa(True);
end;

function TViewContaAPagarLoteParcela.GerarLancamentos: Boolean;
var
  bRetorno : Boolean;
  aParcela : String;
begin
  bRetorno := False;
  try
    with FController, DAO, DataSet do
    begin
      OpenEmpty;

      FLote := FormatDateTime('yyyymmdd hh:nn:ss', Now);
      FLote := StringReplace(StringReplace(FLote, ' ', '', [rfReplaceAll]), ':', '', [rfReplaceAll]);
      aParcela := 'PARCELA %s/' + IntToStr(cdsParcelas.RecordCount);

      cdsParcelas.First;

      while not cdsParcelas.Eof do
      begin
        Append;

        FieldByName('ANOLANC').AsInteger  := YearOf(cdsDadosNominaisEmissao.AsDateTime);
        FieldByName('EMPRESA').AsString   := cdsDadosNominaisEmpresa.AsString;
        FieldByName('CODFORN').AsInteger  := cdsDadosNominaisFornecedor.AsInteger;
        FieldByName('PARCELA').AsInteger  := cdsParcelasParcela.AsInteger;
        FieldByName('TIPPAG').AsString    := dbFormaPagto.Text;

        if Trim(cdsParcelasObservacao.AsString).IsEmpty then
          FieldByName('HISTORIC').AsString  := '---' + #13 + Format(aParcela, [cdsParcelasParcela.AsString]) + #13 + '---' + #13
        else
          FieldByName('HISTORIC').AsString  := '---' + #13 + cdsParcelasObservacao.AsString + #13 + Format(aParcela, [cdsParcelasParcela.AsString]) + #13 + '---' + #13;

        FieldByName('NOTFISC').AsString   := cdsDadosNominaisNotaFiscal.AsString;
        FieldByName('DTEMISS').AsDateTime := cdsDadosNominaisEmissao.AsDateTime;
        FieldByName('DTVENC').AsDateTime  := cdsParcelasVencimento.AsDateTime;
        FieldByName('COMPETENCIA_APURACAO').AsInteger := cdsParcelasCompetencia.AsInteger;
        FieldByName('VALORPAG').AsCurrency := cdsParcelasValorParcela.AsCurrency;
        FieldByName('VALORSALDO').AsCurrency  := cdsParcelasValorParcela.AsCurrency;
        FieldByName('NOMEEMP').AsString       := dbEmpresa.Text;
        FieldByName('FORMA_PAGTO').AsInteger    := cdsDadosNominaisFormaPagto.AsInteger;
        FieldByName('CONDICAO_PAGTO').AsInteger := cdsDadosNominaisCondicaoPagto.AsInteger;
        FieldByName('QUITADO').AsInteger        := 0;
        FieldByName('CODTPDESP').AsInteger      := cdsDadosNominaisTipoDespesa.AsInteger;
        FieldByName('SITUACAO').AsInteger       := 1;
        FieldByName('LOTE').AsString            := Lote;

        Post;
        ApplyUpdates;
        CommitUpdates;

        cdsParcelas.Next;
      end;

      CommitTransaction;

      bRetorno := True;
    end;
  finally
    Result := bRetorno;
  end;
end;

procedure TViewContaAPagarLoteParcela.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewContaAPagarLoteParcela.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
