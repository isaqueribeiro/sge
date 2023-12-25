unit SGE.Controller.Contrato;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Contratos de Produtos/Serviços com Clentes e Fornecedores
  TControllerContrato = class(TController, IControllerContrato)
    private
      FBusca : IModelDAOCustom;
      FItens : IControllerCustom;
      FNotas : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContrato;

      function Busca : IModelDAOCustom;
      function NumeroDuplicado(const aContrato : TContrato) : Boolean;
      function Itens : IControllerCustom;
      function Notas : IControllerCustom;

      procedure CarregarItens;
      procedure CarregarNotas;
  end;

  // Produtos/Serviços do Contrato
  TControllerContratoItem = class(TController, IControllerContratoItem)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContratoItem;

      function Busca : IModelDAOCustom;
  end;

  // Notas de vendas ligadas ao Contrato
  TControllerContratoNotas = class(TController, IControllerContratoNotas)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContratoNotas;

      function Busca : IModelDAOCustom;
  end;

implementation

uses
  System.SysUtils;

{ TControllerContrato }

function TControllerContrato.Busca: IModelDAOCustom;
begin
  Result := FBusca;
end;

procedure TControllerContrato.CarregarItens;
begin
  if not Assigned(FItens) then
    FItens := TControllerContratoItem.New;

  FItens
    .DAO
    .Close
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CONTROLE').AsLargeInt)
    .Open;
end;

procedure TControllerContrato.CarregarNotas;
begin
  if not Assigned(FNotas) then
    FNotas := TControllerContratoNotas.New;

  FNotas
    .DAO
    .Close
    .ParamsByName('contrato', FDAO.DataSet.FieldByName('CONTROLE').AsLargeInt)
    .Open;
end;

constructor TControllerContrato.Create;
begin
  inherited Create(TModelDAOFactory.New.Contrato);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerContrato.Destroy;
begin
  inherited;
end;

function TControllerContrato.Itens: IControllerCustom;
begin
  if not Assigned(FItens) then
    FItens := TControllerContratoItem.New;

  Result := FItens;
end;

class function TControllerContrato.New: IControllerContrato;
begin
  Result := Self.Create;
end;

function TControllerContrato.Notas: IControllerCustom;
begin
  if not Assigned(FNotas) then
    FNotas := TControllerContratoNotas.New;

  Result := FNotas;
end;

function TControllerContrato.NumeroDuplicado(const aContrato: TContrato): Boolean;
begin
  try
    FBusca.DataSet.Close;
    FBusca
      .Clear
      .SQL('Select')
      .SQL('    c.controle')
      .SQL('  , c.empresa ')
      .SQL('  , c.numero  ')
      .SQL('  , coalesce(cli.cnpj, frn.cnpj)     as cnpj ')
      .SQL('  , coalesce(cli.nome, frn.nomeforn) as razao')
      .SQL('  , coalesce(cli.nomefant, frn.nomefant) as fantasia')
      .SQL('from TBCONTRATO c')
      .SQL('  left join TBCLIENTE cli on (cli.codigo = c.cliente)')
      .SQL('  left join TBFORNECEDOR frn on (frn.codforn = c.fornecedor)')
      .Where('(c.controle != ' + aContrato.Controle.ToString + ')')
      .Where('(c.numero    = ' + aContrato.Numero.Trim.QuotedString + ')');

    if (aContrato.Cliente > 0) then
      FBusca
        .Where('(c.cliente = ' + aContrato.Cliente.ToString + ')')
    else
    if (aContrato.Fornecedor > 0) then
      FBusca
        .Where('(c.fornecedor = ' + aContrato.Fornecedor.ToString + ')');

    FBusca
      .Open;
  finally
    Result := not FBusca.DataSet.IsEmpty;
  end;
end;

{ TControllerContratoItem }

function TControllerContratoItem.Busca: IModelDAOCustom;
begin
  Result := FBusca;
end;

constructor TControllerContratoItem.Create;
begin
  inherited Create(TModelDAOFactory.New.ContratoItem);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerContratoItem.Destroy;
begin
  inherited;
end;

class function TControllerContratoItem.New: IControllerContratoItem;
begin
  Result := Self.Create;
end;

{ TControllerContratoNotas }

function TControllerContratoNotas.Busca: IModelDAOCustom;
begin
  Result := FBusca;
end;

constructor TControllerContratoNotas.Create;
begin
  inherited Create(TModelDAOFactory.New.ContratoNotas);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerContratoNotas.Destroy;
begin
  inherited;
end;

class function TControllerContratoNotas.New: IControllerContratoNotas;
begin
  Result := Self.Create;
end;

end.
