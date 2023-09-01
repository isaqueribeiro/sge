unit SGE.Controller.Impressao.DataModule.RequisicaoAlmox;

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
  TDataModuleRequisicaoAlmox = class(TDataModule)
    frdRequisicaoAlmox: TfrxDBDataset;
    frrRequisicaoAlmox: TfrxReport;
    frrManifestoAlmox: TfrxReport;
    qryRequisicaoAlmox: TFDQuery;
    qryDestinatario: TFDQuery;
    frdCliente: TfrxDBDataset;
    frrOrdemEntregaA4: TfrxReport;
    frrOrdemEntregaA5: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
    procedure frrRequisicaoAlmoxGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
    FVersao : IVersao;
    procedure SetVariablesDefault(const pFastReport : TfrxReport);
    procedure CarregarRequisicaoAlmoxarifado(aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean);
  public
    { Public declarations }
    procedure VisualizarRequisicaoAlmox;
    procedure VisualizarManifestoAlmox;
    procedure VisualizarOrdemEntrega(const aFormato : TModeloPapel = TModeloPapel.mrPapelA4);

    function CarregarRequisicaoAlmox(aEmpresa : String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean): Boolean;
    function CarregarManifestoAlmox(aEmpresa: String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean): Boolean;
    function CarregarOrdemEntrega(aEmpresa: String; aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean): Boolean;
  end;

var
  DataModuleRequisicaoAlmox: TDataModuleRequisicaoAlmox;

implementation

uses
  UDMBusiness,
  UDMNFe,
  UDMRecursos;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleRequisicaoAlmox }

function TDataModuleRequisicaoAlmox.CarregarManifestoAlmox(aEmpresa: String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Manifesto', EmptyStr);

  CarregarRequisicaoAlmoxarifado(aAno, aCodigo, aCliente, aTodosItens);
  Result := (not qryRequisicaoAlmox.IsEmpty);
end;

function TDataModuleRequisicaoAlmox.CarregarOrdemEntrega(aEmpresa: String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Manifesto', EmptyStr);

  CarregarRequisicaoAlmoxarifado(aAno, aCodigo, aCliente, aTodosItens);
  Result := (not qryRequisicaoAlmox.IsEmpty);
end;

function TDataModuleRequisicaoAlmox.CarregarRequisicaoAlmox(aEmpresa : String; aAno, aCodigo, aCliente: Integer;
  const aTodosItens: Boolean): Boolean;
begin
  DMNFe.AbrirEmitente(aEmpresa);
  DMBusiness.ConfigurarEmail(aEmpresa, EmptyStr, 'Requisição ao Estoque (Almoxarifado)', EmptyStr);

  CarregarRequisicaoAlmoxarifado(aAno, aCodigo, aCliente, aTodosItens);
  Result := (not qryRequisicaoAlmox.IsEmpty);
end;

procedure TDataModuleRequisicaoAlmox.CarregarRequisicaoAlmoxarifado(aAno, aCodigo, aCliente: Integer; const aTodosItens: Boolean);
begin
  with qryDestinatario do
  begin
    Close;
    ParamByName('codigo').AsInteger := aCliente;
    Open;
  end;

  with qryRequisicaoAlmox do
  begin
    Close;
    ParamByName('ano').AsSmallInt := aAno;
    ParamByName('cod').AsInteger  := aCodigo;
    ParamByName('todos_itens').AsSmallInt := IfThen(aTodosItens, 1, 0);
    Open;
  end;
end;

procedure TDataModuleRequisicaoAlmox.DataModuleCreate(Sender: TObject);
begin
  FVersao := TVersaoController.GetInstance();
end;

procedure TDataModuleRequisicaoAlmox.frrRequisicaoAlmoxGetValue(const VarName: string; var Value: Variant);
begin
  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + FVersao.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := gUsuarioLogado.Login;
end;

procedure TDataModuleRequisicaoAlmox.SetVariablesDefault(const pFastReport: TfrxReport);

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

procedure TDataModuleRequisicaoAlmox.VisualizarManifestoAlmox;
begin
  SetVariablesDefault(frrManifestoAlmox);
  frrManifestoAlmox.PrepareReport;
  frrManifestoAlmox.ShowReport;
end;

procedure TDataModuleRequisicaoAlmox.VisualizarOrdemEntrega(const aFormato : TModeloPapel);
begin
  if (aFormato = TModeloPapel.mrPapelA4) then
  begin
    SetVariablesDefault(frrOrdemEntregaA4);
    frrOrdemEntregaA4.PrepareReport;
    frrOrdemEntregaA4.ShowReport;
  end
  else
  if (aFormato = TModeloPapel.mrPapelA5) then
  begin
    SetVariablesDefault(frrOrdemEntregaA5);
    frrOrdemEntregaA5.PrepareReport;
    frrOrdemEntregaA5.ShowReport;
  end;
end;

procedure TDataModuleRequisicaoAlmox.VisualizarRequisicaoAlmox;
begin
  SetVariablesDefault(frrRequisicaoAlmox);
  frrRequisicaoAlmox.PrepareReport;
  frrRequisicaoAlmox.ShowReport;
end;

end.
