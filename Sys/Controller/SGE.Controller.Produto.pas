unit SGE.Controller.Produto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
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

implementation

uses
  Controller.Factory;

{ TControllerProduto }

constructor TControllerProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.Produto);
end;

destructor TControllerProduto.Destroy;
begin
  inherited;
end;

class function TControllerProduto.New: IControllerCustom;
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

end.
