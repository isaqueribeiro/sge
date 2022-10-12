unit SGE.Controller.Query.Factory;

interface

uses
  SGE.Controller.Query.Interfaces,
  SGE.Controller.Interfaces;

type
  TControllerQueryFactory = class (TInterfacedObject, IControllerQueryFactory)
    strict private
      class var _instance : IControllerQueryFactory;
    private
      {$IFDEF SGI}
      FApropriacaoEstoqueGrupo     ,
      FApropriacaoEstoqueFabricante,
      FApropriacaoEstoqueProduto   ,
      FApropriacaoEstoqueTotal     : IControllerQuery;
      {$ENDIF}
      FFornecedorCliente,
      FContaAPagar      ,
      FContaAReceber : IControllerQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IControllerQueryFactory;

      {$IFDEF SGI}
      function ApropriacaoEstoqueGrupo : IControllerQuery;
      function ApropriacaoEstoqueFabricante : IControllerQuery;
      function ApropriacaoEstoqueProduto : IControllerQuery;
      function ApropriacaoEstoqueTotal : IControllerQuery;
      {$ENDIF}
      function ContaAPagar : IControllerQuery;
      function ContaAReceber : IControllerQuery;
      function FornecedorCliente : IControllerQuery;
  end;

implementation

{ TControllerQueryFactory }

uses
  {$IFDEF SGI}
  SGI.Controller.Query.ApropriacaoEstoque,
  {$ENDIF}
  SGE.Controller.Query.FornecedorCliente,
  SGE.Controller.Query.ContaAPagar,
  SGE.Controller.Query.ContaAReceber;

constructor TControllerQueryFactory.Create;
begin
  ;
end;

destructor TControllerQueryFactory.Destroy;
begin
  inherited;
end;

class function TControllerQueryFactory.Instance: IControllerQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

{$IFDEF SGI}

function TControllerQueryFactory.ApropriacaoEstoqueFabricante: IControllerQuery;
begin
  if not Assigned(FApropriacaoEstoqueFabricante) then
    FApropriacaoEstoqueFabricante := TControllerQueryApropriacaoEstoqueFabricante.New;

  Result := FApropriacaoEstoqueFabricante;
end;

function TControllerQueryFactory.ApropriacaoEstoqueGrupo: IControllerQuery;
begin
  if not Assigned(FApropriacaoEstoqueGrupo) then
    FApropriacaoEstoqueGrupo := TControllerQueryApropriacaoEstoqueGrupo.New;

  Result := FApropriacaoEstoqueGrupo;
end;
function TControllerQueryFactory.ApropriacaoEstoqueProduto: IControllerQuery;
begin
  if not Assigned(FApropriacaoEstoqueProduto) then
    FApropriacaoEstoqueProduto := TControllerQueryApropriacaoEstoqueProduto.New;

  Result := FApropriacaoEstoqueProduto;
end;

function TControllerQueryFactory.ApropriacaoEstoqueTotal: IControllerQuery;
begin
  if not Assigned(FApropriacaoEstoqueTotal) then
    FApropriacaoEstoqueTotal := TControllerQueryApropriacaoEstoqueTotal.New;

  Result := FApropriacaoEstoqueTotal;
end;

{$ENDIF}

function TControllerQueryFactory.ContaAPagar: IControllerQuery;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TControllerQueryContaAPagar.New;

  Result := FContaAPagar;
end;

function TControllerQueryFactory.ContaAReceber: IControllerQuery;
begin
  if not Assigned(FContaAReceber) then
    FContaAReceber := TControllerQueryContaAReceber.New;

  Result := FContaAReceber;
end;

function TControllerQueryFactory.FornecedorCliente: IControllerQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TControllerQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

end.

