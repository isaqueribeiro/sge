unit SGI.Controller.Impressao.DataModule.CotacaoCompra;

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
  TDataModuleCotacaoCompra = class(TDataModule)
    qryCotacaoCompra: TFDQuery;
    frdCotacaoCompra: TfrxDBDataset;
    frrCotacaoCompra: TfrxReport;
    frrCotacaoCompraMapaPreco: TfrxReport;
    qryCotacaoCompraFornecedor: TFDQuery;
    frdCotacaoCompraFornecedor: TfrxDBDataset;
    qryCotacaoCompraFornecedorItem: TFDQuery;
    frdCotacaoCompraFornecedorItem: TfrxDBDataset;
    procedure ReportsGetValue(const VarName: string; var Value: Variant);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FVersao : IVersao;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
  public
    { Public declarations }
    procedure VisualizarCotacaoCompraServico;
    procedure VisualizarMapaCotacaoCompraServico;

    function CarregarCotacaoCompraServico(aEmpresa : String; aAno, aCodigo : Integer) : Boolean;
    function CarregarMapaCotacaoCompraServico(aEmpresa : String; aAno, aCodigo : Integer) : Boolean;
  end;

var
  DataModuleCotacaoCompra: TDataModuleCotacaoCompra;

implementation

uses
  UDMBusiness,
  UDMNFe,
  UDMRecursos;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleCotacaoCompra }

function TDataModuleCotacaoCompra.CarregarCotacaoCompraServico(aEmpresa: String; aAno, aCodigo: Integer): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Cotação de Compra/Serviço', EmptyStr);

  with qryCotacaoCompra do
  begin
    Close;
    ParamByName('ano').AsInteger := aAno;
    ParamByName('cod').AsInteger := aCodigo;
    ParamByName('emp').AsString  := aEmpresa;
    Open;
  end;

  with qryCotacaoCompraFornecedor do
  begin
    Close;
    ParamByName('ano').AsInteger   := aAno;
    ParamByName('cod').AsInteger   := aCodigo;
    ParamByName('emp').AsString    := aEmpresa;
    ParamByName('frn').AsInteger   := 0;
    ParamByName('todos').AsInteger := 0;
    Open;
  end;

  Result := (not qryCotacaoCompra.IsEmpty);
end;

function TDataModuleCotacaoCompra.CarregarMapaCotacaoCompraServico(aEmpresa: String; aAno, aCodigo: Integer): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Mapa de Preços da Cotação de Compra/Serviço', EmptyStr);

  with qryCotacaoCompra do
  begin
    Close;
    ParamByName('ano').AsInteger := aAno;
    ParamByName('cod').AsInteger := aCodigo;
    ParamByName('emp').AsString  := aEmpresa;
    Open;
  end;

  with qryCotacaoCompraFornecedor do
  begin
    Close;
    ParamByName('ano').AsInteger   := aAno;
    ParamByName('cod').AsInteger   := aCodigo;
    ParamByName('emp').AsString    := aEmpresa;
    ParamByName('frn').AsInteger   := 0;
    ParamByName('todos').AsInteger := 1;
    Open;
  end;

  with qryCotacaoCompraFornecedorItem do
  begin
    Close;
    ParamByName('ano').AsInteger   := aAno;
    ParamByName('cod').AsInteger   := aCodigo;
    ParamByName('emp').AsString    := aEmpresa;
    ParamByName('frn').AsInteger   := 0;
    ParamByName('todos').AsInteger := 1;
    Open;
  end;

  Result := (not qryCotacaoCompraFornecedorItem.IsEmpty);
end;

procedure TDataModuleCotacaoCompra.DataModuleCreate(Sender: TObject);
begin
  FVersao := TVersaoController.GetInstance();
end;

procedure TDataModuleCotacaoCompra.ReportsGetValue(const VarName: string; var Value: Variant);
begin
  if (VarName = VAR_SYSTEM) then
    Value := Application.Title + ' - versão ' + FVersao.FileVersion;

  if (VarName = VAR_USER) then
    Value := gUsuarioLogado.Login;
end;

procedure TDataModuleCotacaoCompra.SetVariablesDefault(const pFastReport: TfrxReport);

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

procedure TDataModuleCotacaoCompra.VisualizarCotacaoCompraServico;
begin
  SetVariablesDefault(frrCotacaoCompra);
  frrCotacaoCompra.PrepareReport;
  frrCotacaoCompra.ShowReport;
end;

procedure TDataModuleCotacaoCompra.VisualizarMapaCotacaoCompraServico;
begin
  SetVariablesDefault(frrCotacaoCompraMapaPreco);
  frrCotacaoCompraMapaPreco.PrepareReport;
  frrCotacaoCompraMapaPreco.ShowReport;
end;

end.
