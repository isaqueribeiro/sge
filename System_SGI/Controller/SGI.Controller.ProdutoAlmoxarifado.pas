unit SGI.Controller.ProdutoAlmoxarifado;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Requisições ao Almoxarifado
  TControllerProdutoAlmoxarifado = class(TController, IControllerProdutoAlmoxarifado)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerProdutoAlmoxarifado;

      function Carregar(aEmpresa : String; aCentroCusto, aCodigo : Integer;
        aRequisicaoAno : Smallint; aRequisicaoControle : Integer) : IControllerProdutoAlmoxarifado;
  end;

implementation

{ TControllerProdutoAlmoxarifado }

function TControllerProdutoAlmoxarifado.Carregar(aEmpresa: String; aCentroCusto, aCodigo: Integer;
  aRequisicaoAno: Smallint; aRequisicaoControle: Integer): IControllerProdutoAlmoxarifado;
begin
  Result := Self;

  FDAO
    .Close
    .ClearWhere;

  FDAO
    .Close
    .Where('p.codigo = :produto')
    .ParamsByName('empresa',  aEmpresa)
    .ParamsByName('centro_custo', aCentroCusto)
    .ParamsByName('produto', aCodigo)
    .ParamsByName('req_ano', aRequisicaoAno)
    .ParamsByName('req_cod', aRequisicaoControle)
    .Open;
end;

constructor TControllerProdutoAlmoxarifado.Create;
begin
  inherited Create(TModelDAOFactory.New.ProdutoAlmoxarifado);
end;

destructor TControllerProdutoAlmoxarifado.Destroy;
begin
  inherited;
end;

class function TControllerProdutoAlmoxarifado.New: IControllerProdutoAlmoxarifado;
begin
  Result := Self.Create;
end;

end.
