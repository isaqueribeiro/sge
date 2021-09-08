unit SGE.Controller.AutorizacaoCompra;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Autorizações de Compras/Serviços
  TControllerAutorizacaoCompra = class(TController, IControllerAutorizacaoCompra)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerAutorizacaoCompra;
      function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerAutorizacaoCompra;
  end;

  // Itens da Autorizações de Compras/Serviços
  TControllerAutorizacaoCompraProdutoServico = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerAutorizacaoCompra;
  end;

implementation

{ TControllerAutorizacaoCompra }

constructor TControllerAutorizacaoCompra.Create;
begin
  inherited Create(TModelDAOFactory.New.AutorizacaoCompra);
end;

destructor TControllerAutorizacaoCompra.Destroy;
begin
  inherited;
end;

class function TControllerAutorizacaoCompra.New: IControllerAutorizacaoCompra;
begin
  Result := Self.Create;
end;

function TControllerAutorizacaoCompra.ProdutosParaEntrada(aTipoItem: TTipoItem; aAno, aCodigo: Integer;
  aEmpresa: String): IControllerAutorizacaoCompra;
begin
  ;
end;

end.
