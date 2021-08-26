unit SGE.Controller.Produto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerProduto = class(TController, IControllerProduto)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerProduto;

      procedure AtualizarMetafonema(aDescricao, aApresentacao, aCodigo : String);
      procedure AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo : String);
      procedure AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);
  end;

  // Table
  TControllerGrupoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerSecaoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerFabricanteProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerUnidadeProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Origem do Produto (View)
  TControllerOrigemProdutoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo do Produto
  TControllerTipoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Veículo
  TControllerTipoVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Cor de Veículo
  TControllerCorVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Combustível do Veículo
  TControllerCombustivelVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  Controller.Factory,
  UFuncoes,
  UConstantesDGE;

{ TControllerProduto }

procedure TControllerProduto.AtualizarMetafonema(aDescricao, aApresentacao, aCodigo: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    metafonema = ' + Metafonema(Trim(aDescricao.Trim + ' ' + aApresentacao.Trim)).QuotedString);
    aScriptSQL.Add('where cod = ' + aCodigo.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerProduto.AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    nome_amigo = ' + Trim(aDescricao.Trim + ' ' + aApresentacao.Trim).QuotedString);
    aScriptSQL.Add('where cod = ' + aCodigo.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerProduto.AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    tabela_ibpt = ' + IfThen(aIdNCM.Trim = '0', 'null', aIdNCM.Trim));
    aScriptSQL.Add('  , ncm_sh      = ' + IfThen((aCodigoNCM.Trim = EmptyStr) or (aCodigoNCM.Trim = TRIBUTO_NCM_SH_PADRAO) or (aCodigoNCM = '10203000'), 'null', aCodigoNCM.Trim.QuotedString));
    aScriptSQL.Add('where cod = ' + aCodigoProduto.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

constructor TControllerProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.Produto);
end;

destructor TControllerProduto.Destroy;
begin
  inherited;
end;

class function TControllerProduto.New: IControllerProduto;
begin
  Result := Self.Create;
end;

{ TControllerGrupoProduto }

constructor TControllerGrupoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.GrupoProduto);
end;

destructor TControllerGrupoProduto.Destroy;
begin
  inherited;
end;

class function TControllerGrupoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerSecaoProduto }

constructor TControllerSecaoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.SecaoProduto);
end;

destructor TControllerSecaoProduto.Destroy;
begin
  inherited;
end;

class function TControllerSecaoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerFabricanteProduto }

constructor TControllerFabricanteProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.FabricanteProduto);
end;

destructor TControllerFabricanteProduto.Destroy;
begin
  inherited;
end;

class function TControllerFabricanteProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerUnidadeProduto }

constructor TControllerUnidadeProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.UnidadeProduto);
end;

destructor TControllerUnidadeProduto.Destroy;
begin
  inherited;
end;

class function TControllerUnidadeProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerOrigemProdutoView }

constructor TControllerOrigemProdutoView.Create;
begin
  inherited Create(TModelDAOFactory.New.OrigemProdutoView);
end;

destructor TControllerOrigemProdutoView.Destroy;
begin
  inherited;
end;

class function TControllerOrigemProdutoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoProduto }

constructor TControllerTipoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoProduto);
end;

destructor TControllerTipoProduto.Destroy;
begin
  inherited;
end;

class function TControllerTipoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoVeiculo }

constructor TControllerTipoVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoVeiculo);
end;

destructor TControllerTipoVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerTipoVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCorVeiculo }

constructor TControllerCorVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.CorVeiculo);
end;

destructor TControllerCorVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerCorVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCombustivelVeiculo }

constructor TControllerCombustivelVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.CombustivelVeiculo);
end;

destructor TControllerCombustivelVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerCombustivelVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
