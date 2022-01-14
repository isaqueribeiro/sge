unit SGE.Controller.Impressao.DataModule.ContaAPagar;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Variants,

  Vcl.Forms,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  ACBrBase,
  ACBrExtenso,
  frxClass,
  frxDBSet,

  Interacao.Versao,
  Controller.Versao,
  UConstantesDGE;

type
  TDataModuleContaAPagar = class(TDataModule)
    FrReciboPagamentoA4: TfrxReport;
    FrReciboPagamentoA5: TfrxReport;
    FrdReciboPagamento: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    cdsReciboPagamento: TClientDataSet;
    cdsReciboPagamentoANOLANC: TSmallintField;
    cdsReciboPagamentoNUMLANC: TIntegerField;
    cdsReciboPagamentoPARCELA: TSmallintField;
    cdsReciboPagamentoCODFORN: TSmallintField;
    cdsReciboPagamentoNOMEEMP: TStringField;
    cdsReciboPagamentoNOMEFORN: TStringField;
    cdsReciboPagamentoPESSOA_FISICA: TSmallintField;
    cdsReciboPagamentoCNPJ: TStringField;
    cdsReciboPagamentoNOTFISC: TStringField;
    cdsReciboPagamentoTIPPAG: TStringField;
    cdsReciboPagamentoDTEMISS: TDateField;
    cdsReciboPagamentoDTVENC: TDateField;
    cdsReciboPagamentoDTPAG: TDateField;
    cdsReciboPagamentoBANCO: TSmallintField;
    cdsReciboPagamentoBCO_NOME: TStringField;
    cdsReciboPagamentoNUMCHQ: TStringField;
    cdsReciboPagamentoPAGO_: TStringField;
    cdsReciboPagamentoDOCBAIX: TStringField;
    cdsReciboPagamentoQUITADO: TSmallintField;
    cdsReciboPagamentoCODTPDESP: TSmallintField;
    cdsReciboPagamentoSEQ: TSmallintField;
    cdsReciboPagamentoDATA_PAGTO: TDateField;
    cdsReciboPagamentoFORMA_PAGTO: TSmallintField;
    cdsReciboPagamentoFORMA_PAGTO_DESC: TStringField;
    cdsReciboPagamentoHISTORICO: TMemoField;
    cdsReciboPagamentoVALORPAG: TFMTBCDField;
    cdsReciboPagamentoVALOR_BAIXA: TFMTBCDField;
    cdsReciboPagamentoVALOR_BAIXA_EXTENSO: TStringField;
    dspReciboPagamento: TDataSetProvider;
    qryReciboPagamento: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ReciboGetValue(const VarName: string; var Value: Variant);
    procedure cdsReciboPagamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FVersao : IVersao;
    FHeader : Boolean;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);

    function GetFastReport(aModelo : TModeloRecibo) : TfrxReport;
    procedure FrReciboPagamentoA4GetValue(const VarName: string; var Value: Variant);
  public
    { Public declarations }
    function CarregarReciboPagamento(aAno, aControle, aBaixa : Integer) : Boolean;

    procedure VisualizarReciboPagamento(aModelo : TModeloRecibo; const aHeader : Boolean = TRUE);
  end;

var
  DataModuleContaAPagar: TDataModuleContaAPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  UDMBusiness,
  UDMNFe;

{ TDataModuleContaAPagar }

function TDataModuleContaAPagar.CarregarReciboPagamento(aAno, aControle, aBaixa: Integer): Boolean;
begin
  with cdsReciboPagamento do
  begin
    Close;
    ParamByName('ano').AsInteger    := aAno;
    ParamByName('numero').AsInteger := aControle;
    ParamByName('baixa').AsInteger  := aBaixa;
    Open;
  end;

  Result := (not cdsReciboPagamento.IsEmpty);
end;

procedure TDataModuleContaAPagar.cdsReciboPagamentoCalcFields(DataSet: TDataSet);
begin
  cdsReciboPagamentoVALOR_BAIXA_EXTENSO.AsString :=
    AnsiUpperCase(ACBrExtenso.ValorToTexto(cdsReciboPagamentoVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

procedure TDataModuleContaAPagar.DataModuleCreate(Sender: TObject);
begin
  FVersao := TVersaoController.GetInstance();
  FHeader := True;
end;

procedure TDataModuleContaAPagar.FrReciboPagamentoA4GetValue(const VarName: string; var Value: Variant);
begin

end;

function TDataModuleContaAPagar.GetFastReport(aModelo: TModeloRecibo): TfrxReport;
begin
  case aModelo of
    TModeloRecibo.mrPapelA4 : Result := FrReciboPagamentoA4;
    TModeloRecibo.mrPapelA5 : Result := FrReciboPagamentoA5;
  end;
end;

procedure TDataModuleContaAPagar.ReciboGetValue(const VarName: string; var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'RECIBO';

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + FVersao.FileVersion;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FHeader, 1, 0);
end;

procedure TDataModuleContaAPagar.SetVariablesDefault(const pFastReport: TfrxReport);

  function VariableExist(VariableName : String) : Boolean;
  begin
    Result := (pFastReport.Variables.IndexOf(VariableName) > -1);
  end;

begin
  if Assigned(pFastReport) then
  begin
    if (pFastReport.ReportOptions.Name) = EmptyStr then
      pFastReport.ReportOptions.Name := Application.Title;

    if (pFastReport.ReportOptions.Author) = EmptyStr then
      pFastReport.ReportOptions.Author := gUsuarioLogado.Login;

    if ( not VariableExist(CATEGORY_VAR) ) then
      pFastReport.Variables.AddVariable(EmptyStr, CATEGORY_VAR, null);

    if ( not VariableExist(VAR_TITLE) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_TITLE, EmptyStr);

    if ( not VariableExist(VAR_SUBTITLE) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_SUBTITLE, EmptyStr);

    if ( not VariableExist(VAR_PERIODO) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_PERIODO, EmptyStr);

    if ( not VariableExist(VAR_EMPRESA) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_EMPRESA, GetEmpresaNomeDefault);

    if ( not VariableExist(VAR_USER) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_USER, gUsuarioLogado.Login);

    if ( not VariableExist(VAR_DEPARTAMENTO) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_DEPARTAMENTO, EmptyStr);

    if ( not VariableExist(VAR_TODOS) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_TODOS, 1);

    if ( not VariableExist(VAR_APENASCONSOLIDADO) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_APENASCONSOLIDADO, 0);

    if ( not VariableExist(VAR_SYSTEM) ) then
      pFastReport.Variables.AddVariable(CATEGORY_VAR, VAR_SYSTEM, Application.Title + ' - versão ' + FVersao.FileVersion);
  end;
end;

procedure TDataModuleContaAPagar.VisualizarReciboPagamento(aModelo: TModeloRecibo;
  const aHeader : Boolean);
begin
  SetVariablesDefault(GetFastReport(aModelo));
  FHeader := aHeader;

  with GetFastReport(aModelo) do
  begin
    PrepareReport;
    ShowReport;
  end;
end;

end.
