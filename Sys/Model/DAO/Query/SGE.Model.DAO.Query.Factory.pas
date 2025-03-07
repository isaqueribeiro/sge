unit SGE.Model.DAO.Query.Factory;

interface

uses
  SGE.Model.DAO.Query.Interfaces,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryFactory = class (TInterfacedObject, IModelDAOQueryFactory)
    strict private
      class var _instance : IModelDAOQueryFactory;
    private
      FApropriacaoEstoqueGrupo     ,
      FApropriacaoEstoqueFabricante,
      FApropriacaoEstoqueProduto   ,
      FApropriacaoEstoqueTotal     : IModelDAOQueryApropriacaoEstoque;
      FCaixa,
      FCaixaMovimento   ,
      FFornecedorCliente,
      FContaAPagar      ,
      FContaAReceber    : IModelDAOQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IModelDAOQueryFactory;

      function ApropriacaoEstoqueGrupo : IModelDAOQueryApropriacaoEstoque;
      function ApropriacaoEstoqueFabricante : IModelDAOQueryApropriacaoEstoque;
      function ApropriacaoEstoqueProduto : IModelDAOQueryApropriacaoEstoque;
      function ApropriacaoEstoqueTotal   : IModelDAOQueryApropriacaoEstoque;
      function Caixa : IModelDAOQuery;
      function CaixaMovimento : IModelDAOQuery;
      function FornecedorCliente : IModelDAOQuery;
      function ContaAPagar : IModelDAOQuery;
      function ContaAReceber : IModelDAOQuery;
  end;

implementation

{ TModelDAOQueryFactory }

uses
  System.SysUtils,
  SGI.Model.DAO.Query.ApropriacaoEstoque,
  SGE.Model.DAO.Query.FornecedorCliente,
  SGE.Model.DAO.Query.Caixa,
  SGE.Model.DAO.Query.ContaAPagar,
  SGE.Model.DAO.Query.ContaAReceber;

constructor TModelDAOQueryFactory.Create;
begin
  ;
end;

destructor TModelDAOQueryFactory.Destroy;
begin
  inherited;
end;

class function TModelDAOQueryFactory.Instance: IModelDAOQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TModelDAOQueryFactory.ApropriacaoEstoqueFabricante: IModelDAOQueryApropriacaoEstoque;
begin
  if not Assigned(FApropriacaoEstoqueFabricante) then
    FApropriacaoEstoqueFabricante := TModelDAOQueryApropriacaoEstoqueFabricante.New;

  Result := FApropriacaoEstoqueFabricante;
end;

function TModelDAOQueryFactory.ApropriacaoEstoqueGrupo: IModelDAOQueryApropriacaoEstoque;
begin
  if not Assigned(FApropriacaoEstoqueGrupo) then
    FApropriacaoEstoqueGrupo := TModelDAOQueryApropriacaoEstoqueGrupo.New;

  Result := FApropriacaoEstoqueGrupo;
end;
function TModelDAOQueryFactory.ApropriacaoEstoqueProduto: IModelDAOQueryApropriacaoEstoque;
begin
  if not Assigned(FApropriacaoEstoqueProduto) then
    FApropriacaoEstoqueProduto := TModelDAOQueryApropriacaoEstoqueProduto.New;

  Result := FApropriacaoEstoqueProduto;
end;

function TModelDAOQueryFactory.ApropriacaoEstoqueTotal: IModelDAOQueryApropriacaoEstoque;
begin
  if not Assigned(FApropriacaoEstoqueTotal) then
    FApropriacaoEstoqueTotal := TModelDAOQueryApropriacaoEstoqueTotal.New;

  Result := FApropriacaoEstoqueTotal;
end;

function TModelDAOQueryFactory.FornecedorCliente: IModelDAOQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TModelDAOQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

function TModelDAOQueryFactory.Caixa: IModelDAOQuery;
begin
  if not Assigned(FCaixa) then
    FCaixa := TModelDAOQueryCaixa.New;

  Result := FCaixa;
end;

function TModelDAOQueryFactory.CaixaMovimento: IModelDAOQuery;
begin
  if not Assigned(FCaixaMovimento) then
    FCaixaMovimento := TModelDAOQueryCaixaMovimento.New;

  Result := FCaixaMovimento;
end;

function TModelDAOQueryFactory.ContaAPagar: IModelDAOQuery;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TModelDAOQueryContaAPagar.New;

  Result := FContaAPagar;
end;

function TModelDAOQueryFactory.ContaAReceber: IModelDAOQuery;
begin
  if not Assigned(FContaAReceber) then
    FContaAReceber := TModelDAOQueryContaAreceber.New;

  Result := FContaAReceber;
end;

end.
