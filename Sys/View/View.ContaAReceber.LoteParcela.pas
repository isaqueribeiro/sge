unit View.ContaAReceber.LoteParcela;

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
  SGE.Controller.Impressao.ContaAReceber;


type
  TViewContaAReceberLoteParcela = class(TfrmGrPadrao)
    tmrAlerta: TTimer;
    lblInforme: TLabel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    GrpBxLancamento: TGroupBox;
    cdsDadosNominais: TClientDataSet;
    cdsDadosNominaisEmpresa: TStringField;
    cdsDadosNominaisNumeroParcelas: TIntegerField;
    cdsDadosNominaisValorTotal: TCurrencyField;
    cdsDadosNominaisEmissao: TDateTimeField;
    cdsDadosNominaisDiaVencimento: TSmallintField;
    cdsDadosNominaisNumeroDias: TIntegerField;
    Bevel1: TBevel;
    dtsDadosNominais: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCliente: TLabel;
    dbCliente: TJvDBComboEdit;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    cdsDadosNominaisFormaPagto: TSmallintField;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
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
    cdsDadosNominaisCliente: TIntegerField;
    cdsDadosNominaisClienteNome: TStringField;
    cdsDadosNominaisClienteCNPJ: TStringField;
    cdsDadosNominaisBanco: TIntegerField;
    cdsParcelasCompetencia: TIntegerField;
    dbgParcelasTblCompetencia: TcxGridDBColumn;
    dtsCompetencia: TDataSource;
    Label1: TLabel;
    dbTipoReceita: TDBLookupComboBox;
    cdsDadosNominaisTipoReceita: TSmallintField;
    dtsTpReceita: TDataSource;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsBanco: TDataSource;
    cmTipoValor: TComboBox;
    cdsParcelasCodBanco: TIntegerField;
    dbObservacao: TDBEdit;
    lblObservacao: TLabel;
    cdsDadosNominaisObservacao: TStringField;
    procedure tmrAlertaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsDadosNominaisNewRecord(DataSet: TDataSet);
    procedure BtnGerarClick(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsParcelasDiaSemanaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtsParcelasDataChange(Sender: TObject; Field: TField);
    procedure dbgParcelasEnter(Sender: TObject);
    procedure dbgParcelasExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dtsParcelasStateChange(Sender: TObject);
  private
    { Private declarations }
    FLote : String;
    FController : IControllerContaAReceber;
    FControllerEmpresaView : IControllerEmpresa;
    FControllerFormaPagto  ,
    FControllerCondicaoPagtoView,
    FControllerTipoReceita : IControllerCustom;
    FControllerCompetencia : IControllerCompetencia;
    FControllerBanco : IControllerBanco;

    procedure CarregarLista(const pDataSet : TDataSet);
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoReceita(const ApenasAtivos : Boolean);

    function GerarLancamentos : Boolean;
  public
    { Public declarations }
    property Lote : String read FLote;

    procedure RegistrarRotinaSistema; override;
  end;

  function GerarLoteParcelas(const AOnwer : TComponent;
    var aEmpresa, aLote : String;
    var aCliente : Integer;
    var aDataEmissao, aVencimentoFirst, aVencimentoLast : TDateTime) : Boolean;

(*
  Tabelas:
  - TBCONTREC
  - TBEMPRESA
  - TBCLIENTE
  - TBBANCO_BOLETO
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA

  Procedures:

*)

implementation

{$R *.dfm}

uses
  System.DateUtils,
  UDMRecursos,
  View.CampoRequisitado,
  View.Cliente,
  SGE.Controller,
  SGE.Controller.Helper,
  SGE.Controller.Factory,
  Service.Message;

function GerarLoteParcelas(const AOnwer : TComponent;
  var aEmpresa, aLote : String;
  var aCliente : Integer;
  var aDataEmissao, aVencimentoFirst, aVencimentoLast : TDateTime) : Boolean;
var
  AForm : TViewContaAReceberLoteParcela;
begin
  AForm := TViewContaAReceberLoteParcela.Create(AOnwer);
  try
    AForm.cdsDadosNominais.Append;
    Result := (AForm.ShowModal = mrOk);

    if Result then
    begin
      aEmpresa := AForm.cdsDadosNominaisEmpresa.AsString;
      aLote    := AForm.Lote;
      aCliente := AForm.cdsDadosNominaisCliente.AsInteger;
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

procedure TViewContaAReceberLoteParcela.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TViewContaAReceberLoteParcela.btnConfirmarClick(Sender: TObject);
begin
  if TServiceMessage.ShowConfirmation('Confirma que o lote de parcelas seja gravada na programação de Contas A Receber?') then
    if GerarLancamentos then
      ModalResult := mrOk;
end;

procedure TViewContaAReceberLoteParcela.BtnGerarClick(Sender: TObject);
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
          29: sVencimento := '28/' + Copy(sVencimento, 4, 5);
          30: sVencimento := '29/' + Copy(sVencimento, 4, 5);
          31: sVencimento := '30/' + Copy(sVencimento, 4, 5);
        end;

        if not TryStrToDate(sVencimento, dVencimento) then
          Case StrToInt(Copy(sVencimento, 1, 2)) of
            29: sVencimento := '28/' + Copy(sVencimento, 4, 5);
            30: sVencimento := '29/' + Copy(sVencimento, 4, 5);
            31: sVencimento := '30/' + Copy(sVencimento, 4, 5);
          end;

        if not TryStrToDate(sVencimento, dVencimento) then
          Case StrToInt(Copy(sVencimento, 1, 2)) of
            29: sVencimento := '28/' + Copy(sVencimento, 4, 5);
            30: sVencimento := '29/' + Copy(sVencimento, 4, 5);
            31: sVencimento := '30/' + Copy(sVencimento, 4, 5);
          end;
      end;

      Case RdGrpVencimentoFimSemana.ItemIndex of
        1:
          Case DayOfWeek(dVencimento) of
            1: dVencimento := dVencimento - 2; // Movendo de Domingo para Sexta
            7: dVencimento := dVencimento - 1; // Movendo de Sábado para Sexta
          end;

        2:
          Case DayOfWeek(dVencimento) of
            1: dVencimento := dVencimento + 1; // Movendo de Domingo para Segunda
            7: dVencimento := dVencimento + 2; // Movendo de Sábado para Segunda
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

procedure TViewContaAReceberLoteParcela.CarregarFormaPagto(
  const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAReceberLoteParcela.CarregarLista(
  const pDataSet: TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
end;

procedure TViewContaAReceberLoteParcela.CarregarTipoReceita(
  const ApenasAtivos: Boolean);
begin
  FControllerTipoReceita.DAO.DataSet.Close;
  FControllerTipoReceita.DAO.DataSet.Filter   := '(ativo = 1)';
  FControllerTipoReceita.DAO.DataSet.Filtered := ApenasAtivos;
  FControllerTipoReceita.DAO.DataSet.Open;
end;

procedure TViewContaAReceberLoteParcela.cdsDadosNominaisNewRecord(
  DataSet: TDataSet);
begin
  cdsDadosNominaisEmpresa.AsString         := FController.DAO.Usuario.Empresa.CNPJ;
  cdsDadosNominaisFormaPagto.AsInteger     := FController.DAO.Configuracao.Padrao.FormaPagtoID;
  cdsDadosNominaisNumeroParcelas.AsInteger := 2;
  cdsDadosNominaisValorTotal.AsCurrency    := 0.0;
  cdsDadosNominaisEmissao.AsDateTime       := Date;
  cdsDadosNominaisPrimeiroVencimento.AsDateTime := cdsDadosNominaisEmissao.AsDateTime;
  cdsDadosNominaisDiaVencimento.AsInteger  := 5;
  cdsDadosNominaisNumeroDias.AsInteger     := 30;
  cdsDadosNominaisCliente.Clear;
  cdsDadosNominaisClienteNome.Clear;
  cdsDadosNominaisClienteCNPJ.Clear;
  cdsDadosNominaisBanco.Clear;
end;

procedure TViewContaAReceberLoteParcela.cdsParcelasDiaSemanaGetText(
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

procedure TViewContaAReceberLoteParcela.dbClienteButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if not (cdsDadosNominais.State in [dsEdit, dsInsert]) then
    cdsDadosNominais.Edit;

  if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
  begin
    cdsDadosNominaisCliente.AsInteger    := iCodigo;
    cdsDadosNominaisClienteNome.AsString := sNome;
    cdsDadosNominaisClienteCNPJ.AsString := sCNPJ;
  end;
end;

procedure TViewContaAReceberLoteParcela.dbgParcelasEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TViewContaAReceberLoteParcela.dbgParcelasExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if (cdsParcelas.State in [dsEdit, dsInsert]) then
    cdsParcelas.Post;
end;

procedure TViewContaAReceberLoteParcela.dtsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  if Field = cdsParcelasVencimento then
    if (cdsParcelas.State in [dsEdit, dsInsert]) then
      cdsParcelasDiaSemana.AsInteger := DayOfWeek(Field.AsDateTime);
end;

procedure TViewContaAReceberLoteParcela.dtsParcelasStateChange(Sender: TObject);
begin
  btnConfirmar.Enabled := (not (cdsParcelas.State in [dsEdit, dsInsert]))
    and (cdsParcelas.RecordCount > 0);
end;

procedure TViewContaAReceberLoteParcela.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.ContaAReceber;

  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerFormaPagto  := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;
  FControllerCompetencia := TControllerFactory.New.Competencia;
  FControllerTipoReceita := TControllerFactory.New.TipoReceita;
  FControllerBanco       := TControllerFactory.New.Banco;

  inherited;

  cdsDadosNominais.CreateDataSet;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'Empresa', 'cnpj', 'razao');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FormaPagto', 'codigo', 'codigo_descricao');

  TController(FControllerBanco)
    .LookupComboBox(dbBanco, dtsBanco, 'Banco', 'bco_cod', 'bco_nome_agencia_conta');

  TController(FControllerCompetencia)
    .LookupComboBox(dbgParcelasTblCompetencia, dtsCompetencia, 'Competencia', 'cmp_num', 'cmp_desc');

  TController(FControllerTipoReceita)
    .LookupComboBox(dbTipoReceita, dtsTpReceita, 'TipoReceita', 'codigo', 'descricao');
end;

function TViewContaAReceberLoteParcela.GerarLancamentos: Boolean;
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
        FieldByName('CLIENTE').AsInteger  := cdsDadosNominaisCliente.AsInteger;
        FieldByName('CNPJ').AsString      := cdsDadosNominaisClienteCNPJ.AsString;
        FieldByName('PARCELA').AsInteger  := cdsParcelasParcela.AsInteger;
        FieldByName('TIPPAG').AsString    := dbFormaPagto.Text;
        FieldByName('HISTORIC').AsString  := '---' + #13 + cdsParcelasObservacao.AsString + #13 + Format(aParcela, [cdsParcelasParcela.AsString]) + #13 + '---' + #13;
        FieldByName('NOTFISC').AsString   := cdsDadosNominaisNotaFiscal.AsString;
        FieldByName('DTEMISS').AsDateTime := cdsDadosNominaisEmissao.AsDateTime;
        FieldByName('DTVENC').AsDateTime  := cdsParcelasVencimento.AsDateTime;
        FieldByName('COMPETENCIA_APURACAO').AsInteger := cdsParcelasCompetencia.AsInteger;
        FieldByName('VALORREC').AsCurrency    := cdsParcelasValorParcela.AsCurrency;
        FieldByName('VALORRECTOT').AsCurrency := 0.0;
        FieldByName('VALORSALDO').AsCurrency  := cdsParcelasValorParcela.AsCurrency;
        FieldByName('NOMEEMP').AsString       := dbEmpresa.Text;
        FieldByName('FORMA_PAGTO').AsInteger  := cdsDadosNominaisFormaPagto.AsInteger;
        FieldByName('BAIXADO').AsInteger      := 0;
        FieldByName('ENVIADO').AsInteger      := 0;
        FieldByName('CODTPREC').AsInteger     := cdsDadosNominaisTipoReceita.AsInteger;
        FieldByName('SITUACAO').AsInteger     := 1;
        FieldByName('LOTE').AsString          := Lote;

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

procedure TViewContaAReceberLoteParcela.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewContaAReceberLoteParcela.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
