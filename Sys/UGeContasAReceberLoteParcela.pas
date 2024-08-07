unit UGeContasAReceberLoteParcela;

interface

uses
  UGrPadrao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Data.DB, Datasnap.DBClient,
  Vcl.DBCtrls, JvToolEdit, JvDBControls, Vcl.Mask, JvExMask, IBX.IBQuery, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxDBLookupComboBox,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar, cxCurrencyEdit, cxTextEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;


type
  TfrmGeContasAReceberLoteParcela = class(TfrmGrPadrao)
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
    lblValorTotalX: TLabel;
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
    fdQryTipoReceita: TFDQuery;
    dtsTpReceita: TDataSource;
    fdQryEmpresa: TFDQuery;
    dtsEmpresa: TDataSource;
    fdQryFormaPagto: TFDQuery;
    dtsFormaPagto: TDataSource;
    fdQryBanco: TFDQuery;
    dtsBanco: TDataSource;
    fdQryCompetencia: TFDQuery;
    cdsContaAReceber: TFDQuery;
    updContaAReceber: TFDUpdateSQL;
    cdsContaAReceberANOLANC: TSmallintField;
    cdsContaAReceberNUMLANC: TFDAutoIncField;
    cdsContaAReceberEMPRESA: TStringField;
    cdsContaAReceberCLIENTE: TIntegerField;
    cdsContaAReceberCNPJ: TStringField;
    cdsContaAReceberCODTPREC: TSmallintField;
    cdsContaAReceberFORMA_PAGTO: TSmallintField;
    cdsContaAReceberHISTORIC: TMemoField;
    cdsContaAReceberDTEMISS: TDateField;
    cdsContaAReceberDTVENC: TDateField;
    cdsContaAReceberCOMPETENCIA_APURACAO: TIntegerField;
    cdsContaAReceberPARCELA: TSmallintField;
    cdsContaAReceberBAIXADO: TSmallintField;
    cdsContaAReceberENVIADO: TSmallintField;
    cdsContaAReceberSITUACAO: TSmallintField;
    cdsContaAReceberLOTE: TStringField;
    cdsContaAReceberVALORREC: TFMTBCDField;
    cdsContaAReceberVALORRECTOT: TFMTBCDField;
    cdsContaAReceberVALORSALDO: TFMTBCDField;
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
  UConstantesDGE, UDMRecursos, UDMBusiness, UGrCampoRequisitado,
  View.Cliente, DateUtils;

function GerarLoteParcelas(const AOnwer : TComponent;
  var aEmpresa, aLote : String;
  var aCliente : Integer;
  var aDataEmissao, aVencimentoFirst, aVencimentoLast : TDateTime) : Boolean;
var
  AForm : TfrmGeContasAReceberLoteParcela;
begin
  AForm := TfrmGeContasAReceberLoteParcela.Create(AOnwer);
  try
    AForm.cdsDadosNominais.Append;
    Result := (AForm.ShowModal = mrOk);

    if Result then
    begin
      aEmpresa     := AForm.cdsDadosNominaisEmpresa.AsString;
      aLote        := AForm.Lote;
      aCliente     := AForm.cdsDadosNominaisCliente.AsInteger;
      aDataEmissao := AForm.cdsDadosNominaisEmissao.AsDateTime;

      AForm.cdsParcelas.First;
      aVencimentoFirst := AForm.cdsParcelasVencimento.AsDateTime;

      AForm.cdsParcelas.Last;
      aVencimentoLast  := AForm.cdsParcelasVencimento.AsDateTime;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeContasAReceberLoteParcela.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmGeContasAReceberLoteParcela.btnConfirmarClick(Sender: TObject);
begin
  if ShowConfirmation('Confirma que o lote de parcelas seja gravada na programa��o de Contas A Receber?') then
    if GerarLancamentos then
      ModalResult := mrOk;
end;

procedure TfrmGeContasAReceberLoteParcela.BtnGerarClick(Sender: TObject);
var
  I : Integer;
  sValorParc  ,
  sVencimento : String;
  dDataTemp   ,
  dVencimento : TDateTime;
  cValorParc  ,
  cValorTotal : Currency;
begin
  if ( not CamposRequiridos(Self, TClientDataSet(cdsDadosNominais), Self.Caption) ) then
  begin
    if cdsDadosNominaisNumeroParcelas.AsInteger < 2 then
    begin
      ShowWarning('N�mero de parcelas inv�lido para este processo.');
      Exit;
    end
    else
    if cdsDadosNominaisValorTotal.AsCurrency < 1.0 then
    begin
      ShowWarning('Valor Total das parcelas inv�lido para este processo.');
      Exit;
    end
    else
    if ((cdsDadosNominaisDiaVencimento.AsInteger < 1) or (cdsDadosNominaisDiaVencimento.AsInteger > 31))
      and (cdsDadosNominaisNumeroDias.AsInteger = 0) then
    begin
      ShowWarning('Dia de vencimento inv�lido.');
      Exit;
    end
    else
    if (cdsDadosNominaisNumeroDias.AsInteger < 1) and (cdsDadosNominaisDiaVencimento.AsInteger = 0) then
    begin
      ShowWarning('Periodicidade em dias inv�lida para gerar vencimentos.');
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

    cValorParc  := cdsDadosNominaisValorTotal.AsCurrency / cdsDadosNominaisNumeroParcelas.AsInteger;
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
            7: dVencimento := dVencimento - 1; // Movendo de S�bado para Sexta
          end;

        2:
          Case DayOfWeek(dVencimento) of
            1: dVencimento := dVencimento + 1; // Movendo de Domingo para Segunda
            7: dVencimento := dVencimento + 2; // Movendo de S�bado para Segunda
          end;
      end;

      cdsParcelas.Append;
      cdsParcelasParcela.AsInteger       := I;
      cdsParcelasCompetencia.AsInteger   := GetCompetenciaID(dVencimento - 30);
      cdsParcelasVencimento.AsDateTime   := dVencimento;
      cdsParcelasValorParcela.AsCurrency := cValorParc;
      cdsParcelas.Post;

      dDataTemp   := dDataTemp + cdsDadosNominaisNumeroDias.AsInteger;
      cValorTotal := cValorTotal + cValorParc;
    end;

    cdsParcelas.First;

    // (FINAL) --> Gerar Parcelas

    if ( cValorTotal <> cdsDadosNominaisValorTotal.AsCurrency ) then
    begin
      cdsParcelas.Last;
      cdsParcelas.Edit;
      cdsParcelasValorParcela.AsCurrency := cdsParcelasValorParcela.AsCurrency + (cdsDadosNominaisValorTotal.AsCurrency - cValorTotal);
      cdsParcelas.Post;
      cdsParcelas.First;
    end;

    dbgParcelas.SetFocus;
    dbgParcelasTblCompetencia.Focused := True;
  end;
end;

procedure TfrmGeContasAReceberLoteParcela.CarregarFormaPagto(
  const pEmpresa: String);
begin
  with fdQryFormaPagto, Params do
  begin
    Close;
    ParamByName('empresa').AsString := Trim(pEmpresa);
    Open;

    Last;
    First;
  end;
end;

procedure TfrmGeContasAReceberLoteParcela.CarregarLista(
  const pDataSet: TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
end;

procedure TfrmGeContasAReceberLoteParcela.CarregarTipoReceita(
  const ApenasAtivos: Boolean);
begin
  with fdQryTipoReceita, Params do
  begin
    Close;
    ParamByName('ativo').AsInteger := IfThen(ApenasAtivos, 1, 0);
    ParamByName('todos').AsInteger := IfThen(ApenasAtivos, 0, 1);
    Open;

    Last;
    First;
  end;
end;

procedure TfrmGeContasAReceberLoteParcela.cdsDadosNominaisNewRecord(
  DataSet: TDataSet);
begin
  cdsDadosNominaisEmpresa.AsString         := gUsuarioLogado.Empresa;
  cdsDadosNominaisFormaPagto.AsInteger     := GetFormaPagtoIDDefault;
  cdsDadosNominaisNumeroParcelas.AsInteger := 2;
  cdsDadosNominaisValorTotal.AsCurrency    := 0.0;
  cdsDadosNominaisEmissao.AsDateTime       := GetDateDB;
  cdsDadosNominaisPrimeiroVencimento.AsDateTime := cdsDadosNominaisEmissao.AsDateTime;
  cdsDadosNominaisDiaVencimento.AsInteger  := 5;
  cdsDadosNominaisNumeroDias.AsInteger     := 30;
  cdsDadosNominaisCliente.Clear;
  cdsDadosNominaisClienteNome.Clear;
  cdsDadosNominaisClienteCNPJ.Clear;
  cdsDadosNominaisBanco.Clear;
end;

procedure TfrmGeContasAReceberLoteParcela.cdsParcelasDiaSemanaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      1: Text := 'DOM';
      2: Text := 'SEG';
      3: Text := 'TER';
      4: Text := 'QUA';
      5: Text := 'QUI';
      6: Text := 'SEX';
      7: Text := 'SAB';
    end;
end;

procedure TfrmGeContasAReceberLoteParcela.dbClienteButtonClick(
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

procedure TfrmGeContasAReceberLoteParcela.dbgParcelasEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TfrmGeContasAReceberLoteParcela.dbgParcelasExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if (cdsParcelas.State in [dsEdit, dsInsert]) then
    cdsParcelas.Post;
end;

procedure TfrmGeContasAReceberLoteParcela.dtsParcelasDataChange(Sender: TObject;
  Field: TField);
begin
  if Field = cdsParcelasVencimento then
    if (cdsParcelas.State in [dsEdit, dsInsert]) then
      cdsParcelasDiaSemana.AsInteger := DayOfWeek(Field.AsDateTime);
end;

procedure TfrmGeContasAReceberLoteParcela.dtsParcelasStateChange(Sender: TObject);
begin
  btnConfirmar.Enabled := (not (cdsParcelas.State in [dsEdit, dsInsert]))
    and (cdsParcelas.RecordCount > 0);
end;

procedure TfrmGeContasAReceberLoteParcela.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsContaAReceber.UpdateOptions do
  begin
    AutoIncFields := 'NUMLANC';
    GeneratorName := 'GEN_CONTAREC_NUM_' + FormatFloat('0000', YearOf(Date));
  end;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryBanco);
  CarregarLista(fdQryCompetencia);
  CarregarFormaPagto(gUsuarioLogado.Empresa);
  CarregarTipoReceita(True);

  cdsDadosNominais.CreateDataSet;
end;

function TfrmGeContasAReceberLoteParcela.GerarLancamentos: Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    with cdsContaAReceber do
    begin
      Open;

      FLote := FormatDateTime('yyyymmdd hh:mm:ss', GetDateTimeDB);
      FLote := StringReplace(StringReplace(FLote, ' ', '', [rfReplaceAll]), ':', '', [rfReplaceAll]);

      cdsParcelas.First;
      while not cdsParcelas.Eof do
      begin
        Append;

        cdsContaAReceberANOLANC.Value  := YearOf(cdsDadosNominaisEmissao.AsDateTime);
        cdsContaAReceberEMPRESA.Value  := cdsDadosNominaisEmpresa.AsString;
        cdsContaAReceberCLIENTE.Value  := cdsDadosNominaisCliente.AsInteger;
        cdsContaAReceberCNPJ.Value     := cdsDadosNominaisClienteCNPJ.AsString;
        cdsContaAReceberCODTPREC.Value    := cdsDadosNominaisTipoReceita.AsInteger;
        cdsContaAReceberFORMA_PAGTO.Value := cdsDadosNominaisFormaPagto.AsInteger;
        cdsContaAReceberHISTORIC.Value    := '---' + #13 + cdsParcelasObservacao.AsString;
        cdsContaAReceberDTEMISS.Value  := cdsDadosNominaisEmissao.AsDateTime;
        cdsContaAReceberDTVENC.Value   := cdsParcelasVencimento.AsDateTime;
        cdsContaAReceberCOMPETENCIA_APURACAO.Value := cdsParcelasCompetencia.AsInteger;
        cdsContaAReceberVALORREC.Value := cdsParcelasValorParcela.AsCurrency;
        cdsContaAReceberVALORRECTOT.Value := 0.0;
        cdsContaAReceberVALORSALDO.Value  := cdsParcelasValorParcela.AsCurrency;
        cdsContaAReceberPARCELA.Value  := cdsParcelasParcela.AsInteger;
        cdsContaAReceberBAIXADO.Value  := 0;
        cdsContaAReceberENVIADO.Value  := 0;
        cdsContaAReceberSITUACAO.Value := 1;
        cdsContaAReceberLOTE.Value     := Lote;

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

procedure TfrmGeContasAReceberLoteParcela.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeContasAReceberLoteParcela.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
