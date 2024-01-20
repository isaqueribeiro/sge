unit SGE.Controller.Impressao.DataModule.Contrato;

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
  TDataModuleContrato = class(TDataModule)
    FrChequeA4: TfrxReport;
    FrChequeA5: TfrxReport;
    FrdCheque: TfrxDBDataset;
    CdsCheque: TClientDataSet;
    CdsChequeCONTROLE: TIntegerField;
    CdsChequeEMPRESA: TStringField;
    CdsChequeTIPO: TSmallintField;
    CdsChequeBANCO: TStringField;
    CdsChequeBANCO_LOGO: TBlobField;
    CdsChequeAGENCIA: TStringField;
    CdsChequeCONTA: TStringField;
    CdsChequeNUMERO: TStringField;
    CdsChequeFORNECEDOR: TIntegerField;
    CdsChequeCLIENTE: TIntegerField;
    CdsChequeDATA_EMISSAO: TDateField;
    CdsChequeDATA_APRESENTACAO: TDateField;
    CdsChequeDATA_COMPENSACAO: TDateField;
    CdsChequeVALOR: TFMTBCDField;
    CdsChequeVALOR_EXTENSO: TStringField;
    CdsChequeNOMINAL_A: TStringField;
    CdsChequeDATA_CADASTRO: TDateField;
    CdsChequeUSUARIO_CADASTRO: TStringField;
    CdsChequeSTATUS: TSmallintField;
    CdsChequeOBS: TMemoField;
    CdsChequeSTATUS_DESCRICAO: TStringField;
    CdsChequeBANCO_NOME: TStringField;
    CdsChequeEMISSOR_NOME: TStringField;
    CdsChequeEMISSOR_CNPJ: TStringField;
    CdsChequeEMISSOR_PF: TSmallintField;
    DspCheque: TDataSetProvider;
    QryCheque: TFDQuery;
    QryChequeCONTROLE: TIntegerField;
    QryChequeEMPRESA: TStringField;
    QryChequeTIPO: TSmallintField;
    QryChequeBANCO: TStringField;
    QryChequeBANCO_LOGO: TBlobField;
    QryChequeAGENCIA: TStringField;
    QryChequeCONTA: TStringField;
    QryChequeNUMERO: TStringField;
    QryChequeFORNECEDOR: TIntegerField;
    QryChequeCLIENTE: TIntegerField;
    QryChequeDATA_EMISSAO: TDateField;
    QryChequeDATA_APRESENTACAO: TDateField;
    QryChequeDATA_COMPENSACAO: TDateField;
    QryChequeNOMINAL_A: TStringField;
    QryChequeDATA_CADASTRO: TDateField;
    QryChequeUSUARIO_CADASTRO: TStringField;
    QryChequeSTATUS: TSmallintField;
    QryChequeOBS: TMemoField;
    QryChequeSTATUS_DESCRICAO: TStringField;
    QryChequeBANCO_NOME: TStringField;
    QryChequeEMISSOR_NOME: TStringField;
    QryChequeEMISSOR_CNPJ: TStringField;
    QryChequeEMISSOR_PF: TSmallintField;
    QryChequeVALOR: TFMTBCDField;
    QryRelacaoContratos: TFDQuery;
    frdsRelacaoContratos: TfrxDBDataset;
    frRelacaoContratos: TfrxReport;
    ACBrExtenso: TACBrExtenso;
    CdsRelacaoContratos: TClientDataSet;
    DspRelacaoContratos: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
    procedure ReportGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
    FVersao : IVersao;
    FHeader : Boolean;
    FTitulo  ,
    FPeriodo : String;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);

    function GetFastReport(aModelo : TModeloPapel) : TfrxReport;
  public
    { Public declarations }
    procedure VisualizarContrato(aModelo : TModeloPapel; const aHeader : Boolean = TRUE);
    procedure VisualizarRelacaoContratos(aEmpresa: String; aDataInicial, aDataFinal: TDateTime);

    function CarregarContrato(aControle : Int64) : Boolean;
    function CarregarRelacaoContratos(aEmpresa : String; aDataInicial, aDataFinal: TDateTime) : Boolean;
  end;

var
  DataModuleContrato: TDataModuleContrato;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleContrato }

uses
  UDMBusiness,
  UDMNFe,
  UDMRecursos;

function TDataModuleContrato.CarregarContrato(aControle: Int64): Boolean;
var
  aLogo : String;
begin
  FTitulo  := 'ESPELHO DO CONTRATO';
  FPeriodo := EmptyStr;

  with CdsCheque do
  begin
    Close;
    ParamByName('cheque').AsLargeInt := aControle;
    Open;
  end;

  Result := (not CdsCheque.IsEmpty);

  if Result then
  begin
    aLogo := ExtractFilePath(ParamStr(0)) + 'Imagens\' + CdsChequeBANCO.AsString + '.jpg';

    if not FileExists(aLogo) then
      aLogo := ExtractFilePath(ParamStr(0)) + 'Imagens\Colorido\' + CdsChequeBANCO.AsString + '.bmp';

    if FileExists(aLogo) then
    begin
      CdsCheque.Edit;
      CdsChequeBANCO_LOGO.LoadFromFile( aLogo );
      CdsCheque.Post;
    end;
  end;
end;

function TDataModuleContrato.CarregarRelacaoContratos(aEmpresa : String; aDataInicial, aDataFinal: TDateTime) : Boolean;
begin
  FTitulo  := 'RELAÇÃO DE CONTRATOS';
  FPeriodo := FormatDateTime('dd/mm/yyyy', aDataInicial) + ' a ' + FormatDateTime('dd/mm/yyyy', aDataFinal);

  WaitAMoment(WAIT_AMOMENT_PrintPrepare);
  try
    DMNFe.AbrirEmitente(aEmpresa);
    DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Relação de Contratos', EmptyStr);

    with CdsRelacaoContratos, Params do
    begin
      Close;
      ParamByName('empresa').AsString := aEmpresa;
      ParamByName('data_inicial').AsDateTime := aDataInicial;
      ParamByName('data_final').AsDateTime   := aDataFinal;
      Open;
    end;

    Result := (not CdsRelacaoContratos.IsEmpty);
  finally
    WaitAMomentFree;
  end;
end;

procedure TDataModuleContrato.DataModuleCreate(Sender: TObject);
begin
  FVersao := TVersaoController.GetInstance();
  FHeader := True;
end;

function TDataModuleContrato.GetFastReport(aModelo: TModeloPapel): TfrxReport;
begin
  case aModelo of
    TModeloPapel.mrPapelA4 : Result := FrChequeA4;
    TModeloPapel.mrPapelA5 : Result := FrChequeA5;
  end;
end;

procedure TDataModuleContrato.ReportGetValue(const VarName: string; var Value: Variant);
begin
  if VarName.ToLower.Equals('titulo') then
    Value := FTitulo;

  if VarName.ToLower.Equals('periodo') then
    Value := FPeriodo;
end;

procedure TDataModuleContrato.SetVariablesDefault(const pFastReport: TfrxReport);

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

procedure TDataModuleContrato.VisualizarContrato(aModelo: TModeloPapel; const aHeader: Boolean);
begin
  SetVariablesDefault(GetFastReport(aModelo));
  FHeader := aHeader;

  with GetFastReport(aModelo) do
  begin
    PrepareReport;
    ShowReport;
  end;
end;

procedure TDataModuleContrato.VisualizarRelacaoContratos(aEmpresa: String; aDataInicial, aDataFinal: TDateTime);
begin
  SetVariablesDefault(frRelacaoContratos);
  frRelacaoContratos.PrepareReport;
  frRelacaoContratos.ShowReport;
end;

end.
