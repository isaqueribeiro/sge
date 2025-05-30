unit SGI.Controller.Impressao.DataModule.SolicitacaoCompra;

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

  frxClass,
  frxDBSet,

  Interacao.Versao,
  Controller.Versao,
  UConstantesDGE;

type
  TDataModuleSolicitacaoCompra = class(TDataModule)
    qrySolicitacaoCompra: TFDQuery;
    frdSolicitacaoCompra: TfrxDBDataset;
    frrSolicitacaoCompra: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
    procedure frrSolicitacaoCompraGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
    FVersao : IVersao;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
  public
    { Public declarations }
    procedure VisualizarSolicitacaoCompra;

    function CarregarSolicitacaoCompra(aEmpresa : String; aAno, aCodigo : Integer) : Boolean;
  end;

var
  DataModuleSolicitacaoCompra: TDataModuleSolicitacaoCompra;

implementation

uses
  UDMBusiness,
  UDMNFe,
  UDMRecursos;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDataModuleSolicitacaoCompra.CarregarSolicitacaoCompra(aEmpresa: String; aAno, aCodigo: Integer): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Solicitação de Compra/Serviço', EmptyStr);

  with qrySolicitacaoCompra do
  begin
    Close;
    ParamByName('ano').AsInteger := aAno;
    ParamByName('cod').AsInteger := aCodigo;
    ParamByName('emp').AsString  := aEmpresa;
    Open;
  end;

  Result := (not qrySolicitacaoCompra.IsEmpty);
end;

procedure TDataModuleSolicitacaoCompra.DataModuleCreate(Sender: TObject);
begin
  FVersao := TVersaoController.GetInstance();
end;

procedure TDataModuleSolicitacaoCompra.frrSolicitacaoCompraGetValue(const VarName: string; var Value: Variant);
begin
  if (VarName = VAR_SYSTEM) then
    Value := Application.Title + ' - versão ' + FVersao.FileVersion;

  if (VarName = VAR_USER) then
    Value := gUsuarioLogado.Login;
end;

procedure TDataModuleSolicitacaoCompra.SetVariablesDefault(const pFastReport: TfrxReport);

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

procedure TDataModuleSolicitacaoCompra.VisualizarSolicitacaoCompra;
begin
  SetVariablesDefault(frrSolicitacaoCompra);
  frrSolicitacaoCompra.PrepareReport;
  frrSolicitacaoCompra.ShowReport;
end;

end.
