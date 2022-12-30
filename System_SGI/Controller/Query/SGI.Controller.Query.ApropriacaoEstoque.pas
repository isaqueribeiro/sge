unit SGI.Controller.Query.ApropriacaoEstoque;

interface

uses
  System.SysUtils,
  System.Classes,
  Model.Constantes,
  SGE.Controller.Interfaces,
  SGE.Controller.Query,
  SGE.Model.DAO.Interfaces;

type
  TControllerQueryApropriacaoEstoqueTotal = class(TControllerQuery, IControllerQueryAproriacaoEstoque)
    private
      FCentroCusto : Integer;
      FCustomDAO   : IModelDAOQueryApropriacaoEstoque;
      function CustomDAO : IModelDAOQueryApropriacaoEstoque;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;

      function ApenasProdutoComEstoue(Value : Boolean) : IControllerQueryAproriacaoEstoque; virtual; abstract;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery; override;
      function CentroCusto(Value : Integer) : IControllerQueryAproriacaoEstoque;
      function Grupo(aCodigo : Integer) : IControllerQueryAproriacaoEstoque; virtual; abstract;
      function Fabricante(aCodigo : Integer) : IControllerQueryAproriacaoEstoque; virtual; abstract;
      function CalcularPercentuais(const aValorReferencia : Currency) : IControllerQueryAproriacaoEstoque; virtual; abstract;
      function AtualizarCusto(aProduto : String; aValorCusto : Currency; aSistema : SmallInt) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
      function AtualizarCusto(aData : TDateTime) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
  end;

  TControllerQueryApropriacaoEstoqueGrupo = class(TControllerQuery, IControllerQueryAproriacaoEstoque)
    private
      FCentroCusto ,
      FGrupo       ,
      FFabricante  : Integer;
      FCustomDAO : IModelDAOQueryApropriacaoEstoque;
      function CustomDAO : IModelDAOQueryApropriacaoEstoque;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;

      function ApenasProdutoComEstoue(Value : Boolean) : IControllerQueryAproriacaoEstoque;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery; override;
      function CentroCusto(Value : Integer) : IControllerQueryAproriacaoEstoque;
      function Grupo(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function Fabricante(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function CalcularPercentuais(const aValorReferencia : Currency) : IControllerQueryAproriacaoEstoque;
      function AtualizarCusto(aProduto : String; aValorCusto : Currency; aSistema : SmallInt) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
      function AtualizarCusto(aData : TDateTime) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
  end;

  TControllerQueryApropriacaoEstoqueFabricante = class(TControllerQuery, IControllerQueryAproriacaoEstoque)
    private
      FCentroCusto ,
      FGrupo       ,
      FFabricante  : Integer;
      FCustomDAO : IModelDAOQueryApropriacaoEstoque;
      function CustomDAO : IModelDAOQueryApropriacaoEstoque;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;

      function ApenasProdutoComEstoue(Value : Boolean) : IControllerQueryAproriacaoEstoque;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery; override;
      function CentroCusto(Value : Integer) : IControllerQueryAproriacaoEstoque;
      function Grupo(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function Fabricante(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function CalcularPercentuais(const aValorReferencia : Currency) : IControllerQueryAproriacaoEstoque;
      function AtualizarCusto(aProduto : String; aValorCusto : Currency; aSistema : SmallInt) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
      function AtualizarCusto(aData : TDateTime) : IControllerQueryAproriacaoEstoque; overload; virtual; abstract;
  end;

  TControllerQueryApropriacaoEstoqueProduto = class(TControllerQuery, IControllerQueryAproriacaoEstoque)
    private
      FCentroCusto ,
      FGrupo       ,
      FFabricante  : Integer;
      FCustomDAO : IModelDAOQueryApropriacaoEstoque;
      function CustomDAO : IModelDAOQueryApropriacaoEstoque;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;

      function ApenasProdutoComEstoue(Value : Boolean) : IControllerQueryAproriacaoEstoque;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery; override;
      function CentroCusto(Value : Integer) : IControllerQueryAproriacaoEstoque;
      function Grupo(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function Fabricante(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
      function CalcularPercentuais(const aValorReferencia : Currency) : IControllerQueryAproriacaoEstoque;
      function AtualizarCusto(aProduto : String; aValorCusto : Currency; aSistema : SmallInt) : IControllerQueryAproriacaoEstoque; overload;
      function AtualizarCusto(aData : TDateTime) : IControllerQueryAproriacaoEstoque; overload;
  end;

implementation

uses
  SGE.Model.DAO.Query.Factory;

{ TControllerQueryApropriacaoEstoqueTotal }

function TControllerQueryApropriacaoEstoqueTotal.CentroCusto(Value: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FCentroCusto := Value;
end;

constructor TControllerQueryApropriacaoEstoqueTotal.Create;
begin
  FCustomDAO   := TModelDAOQueryFactory.Instance.ApropriacaoEstoqueTotal;
  FCentroCusto := 999;
  inherited Create(FCustomDAO);
end;

function TControllerQueryApropriacaoEstoqueTotal.CustomDAO: IModelDAOQueryApropriacaoEstoque;
begin
  Supports(DAO, IModelDAOQueryApropriacaoEstoque, Result);
end;

destructor TControllerQueryApropriacaoEstoqueTotal.Destroy;
begin
  inherited;
end;

function TControllerQueryApropriacaoEstoqueTotal.Execute(aTipo: TTipoPesquisa; aFiltro: String): IControllerQuery;
begin
  Result := Self;
  CustomDAO.ExecuteCustom(aTipo, FCentroCusto, aFiltro);
end;

class function TControllerQueryApropriacaoEstoqueTotal.New: IControllerQuery;
begin
  Result := Self.Create;
end;

{ TControllerQueryApropriacaoEstoqueGrupo }

function TControllerQueryApropriacaoEstoqueGrupo.ApenasProdutoComEstoue(
  Value: Boolean): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  CustomDAO.ApenasProdutoComEstoque(Value);
end;

function TControllerQueryApropriacaoEstoqueGrupo.CalcularPercentuais(
  const aValorReferencia: Currency): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;

  if (not DAO.DataSet.IsEmpty) then
    CustomDAO.CalcularPercentuais(aValorReferencia);
end;

function TControllerQueryApropriacaoEstoqueGrupo.CentroCusto(Value: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FCentroCusto := Value;
end;

constructor TControllerQueryApropriacaoEstoqueGrupo.Create;
begin
  FCustomDAO   := TModelDAOQueryFactory.Instance.ApropriacaoEstoqueGrupo;
  FCentroCusto := 999;
  FGrupo      := -1;
  FFabricante := -1;
  inherited Create(FCustomDAO);
end;

function TControllerQueryApropriacaoEstoqueGrupo.CustomDAO: IModelDAOQueryApropriacaoEstoque;
begin
  Supports(DAO, IModelDAOQueryApropriacaoEstoque, Result);
end;

destructor TControllerQueryApropriacaoEstoqueGrupo.Destroy;
begin
  inherited;
end;

function TControllerQueryApropriacaoEstoqueGrupo.Execute(aTipo: TTipoPesquisa; aFiltro: String): IControllerQuery;
begin
  Result := Self;
  CustomDAO
    .Grupo(FGrupo)
    .Fabricante(FFabricante)
    .ExecuteCustom(aTipo, FCentroCusto, aFiltro);
end;

function TControllerQueryApropriacaoEstoqueGrupo.Fabricante(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FFabricante := aCodigo;
end;

function TControllerQueryApropriacaoEstoqueGrupo.Grupo(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FGrupo := aCodigo;
end;

class function TControllerQueryApropriacaoEstoqueGrupo.New: IControllerQuery;
begin
  Result := Self.Create;
end;

{ TControllerQueryApropriacaoEstoqueFabricante }

function TControllerQueryApropriacaoEstoqueFabricante.ApenasProdutoComEstoue(
  Value: Boolean): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  CustomDAO.ApenasProdutoComEstoque(Value);
end;

function TControllerQueryApropriacaoEstoqueFabricante.CalcularPercentuais(
  const aValorReferencia: Currency): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;

  if (not DAO.DataSet.IsEmpty) then
    CustomDAO.CalcularPercentuais(aValorReferencia);
end;

function TControllerQueryApropriacaoEstoqueFabricante.CentroCusto(Value: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FCentroCusto := Value;
end;

constructor TControllerQueryApropriacaoEstoqueFabricante.Create;
begin
  FCustomDAO   := TModelDAOQueryFactory.Instance.ApropriacaoEstoqueFabricante;
  FCentroCusto := 999;
  FGrupo       := -1;
  FFabricante  := -1;
  inherited Create(FCustomDAO);
end;

function TControllerQueryApropriacaoEstoqueFabricante.CustomDAO: IModelDAOQueryApropriacaoEstoque;
begin
  Supports(DAO, IModelDAOQueryApropriacaoEstoque, Result);
end;

destructor TControllerQueryApropriacaoEstoqueFabricante.Destroy;
begin
  inherited;
end;

function TControllerQueryApropriacaoEstoqueFabricante.Execute(aTipo: TTipoPesquisa; aFiltro: String): IControllerQuery;
begin
  Result := Self;
  CustomDAO
    .Grupo(FGrupo)
    .Fabricante(FFabricante)
    .ExecuteCustom(aTipo, FCentroCusto, aFiltro);
end;

function TControllerQueryApropriacaoEstoqueFabricante.Fabricante(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FFabricante := aCodigo;
end;

function TControllerQueryApropriacaoEstoqueFabricante.Grupo(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FGrupo := aCodigo;
end;

class function TControllerQueryApropriacaoEstoqueFabricante.New: IControllerQuery;
begin
  Result := Self.Create;
end;

{ TControllerQueryApropriacaoEstoqueProduto }

function TControllerQueryApropriacaoEstoqueProduto.ApenasProdutoComEstoue(
  Value: Boolean): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  CustomDAO.ApenasProdutoComEstoque(Value);
end;

function TControllerQueryApropriacaoEstoqueProduto.AtualizarCusto(aProduto: String; aValorCusto: Currency;
  aSistema: SmallInt): IControllerQueryAproriacaoEstoque;
var
  aScriptSQL : TStringList;
begin
  Result := Self;

  aScriptSQL := TStringList.Create;
  try
    // Atualizar o Custo do produto manualmente
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Execute Procedure SET_ATUALIZAR_CUSTO_PRODUTO (');
    aScriptSQL.Add(' ' + aProduto.Trim.QuotedString + ', ');
    aScriptSQL.Add(' ' + StringReplace(FormatFloat('#########################0.00', aValorCusto), ',', '.', [rfReplaceAll]) + ', ');
    aScriptSQL.Add(' ' + aSistema.ToString );
    aScriptSQL.Add(')');
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

function TControllerQueryApropriacaoEstoqueProduto.AtualizarCusto(aData: TDateTime): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;

  // 1. Atualização do Custo das Apropriações de Estoque por Entrada
  FDAO.ExecuteScriptSQL('Execute Procedure SP_UPD_CUSTO_APROP_ENTRADA(' + FormatDateTime('YYYY', aData) + ')');
  // 2. Atualização do Custo das Apropriações de Estoque por Autorizações
  FDAO.ExecuteScriptSQL('Execute Procedure SP_UPD_CUSTO_APROP_AUTORIZ(' + FormatDateTime('YYYY', aData) + ')');
  // 3. Atualização do Custo do Estoque de Almoxarifado
  FDAO.ExecuteScriptSQL('Execute Procedure SP_UPD_CUSTO_ESTOQUE_APROP(' + FormatDateTime('YYYY', aData) + ')');
  // 4. Atualização do Custo das Requisições ao Almoxarifado
  FDAO.ExecuteScriptSQL('Execute Procedure SP_UPD_CUSTO_ESTOQUE_REQUI(' + FormatDateTime('YYYY', aData) + ')');
  // 5. Atualização do Custo dos Inventários
  FDAO.ExecuteScriptSQL('Execute Procedure SP_UPD_CUSTO_INVENTARIO_ALMOX(' + FormatDateTime('YYYY', aData) + ')');

  FDAO.CommitTransaction;
end;

function TControllerQueryApropriacaoEstoqueProduto.CalcularPercentuais(
  const aValorReferencia: Currency): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;

  if (not DAO.DataSet.IsEmpty) then
    CustomDAO.CalcularPercentuais(aValorReferencia);
end;

function TControllerQueryApropriacaoEstoqueProduto.CentroCusto(Value: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FCentroCusto := Value;
end;

constructor TControllerQueryApropriacaoEstoqueProduto.Create;
begin
  FCustomDAO   := TModelDAOQueryFactory.Instance.ApropriacaoEstoqueProduto;
  FCentroCusto := 999;
  FGrupo       := -1;
  FFabricante  := -1;
  inherited Create(FCustomDAO);
end;

function TControllerQueryApropriacaoEstoqueProduto.CustomDAO: IModelDAOQueryApropriacaoEstoque;
begin
  Supports(DAO, IModelDAOQueryApropriacaoEstoque, Result);
end;

destructor TControllerQueryApropriacaoEstoqueProduto.Destroy;
begin
  inherited;
end;

function TControllerQueryApropriacaoEstoqueProduto.Execute(aTipo: TTipoPesquisa; aFiltro: String): IControllerQuery;
begin
  Result := Self;
  CustomDAO
    .Grupo(FGrupo)
    .Fabricante(FFabricante)
    .ExecuteCustom(aTipo, FCentroCusto, aFiltro);
end;

function TControllerQueryApropriacaoEstoqueProduto.Fabricante(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FFabricante := aCodigo;
end;

function TControllerQueryApropriacaoEstoqueProduto.Grupo(aCodigo: Integer): IControllerQueryAproriacaoEstoque;
begin
  Result := Self;
  FGrupo := aCodigo;
end;

class function TControllerQueryApropriacaoEstoqueProduto.New: IControllerQuery;
begin
  Result := Self.Create;
end;

end.
