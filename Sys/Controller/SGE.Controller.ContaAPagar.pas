unit SGE.Controller.ContaAPagar;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Contas A Pagar
  TControllerContaAPagar = class(TController, IControllerContaAPagar)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContaAPagar;

      procedure GerarDuplicatas(aAnoCOmpra, aNumCompra : Integer);
      procedure CarregarPagamentos; virtual; abstract;

      function Pagamentos : IControllerCustom; virtual; abstract;
  end;

implementation

{ TControllerContaAPagar }

constructor TControllerContaAPagar.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAPagar);
end;

destructor TControllerContaAPagar.Destroy;
begin
  inherited;
end;

class function TControllerContaAPagar.New: IControllerContaAPagar;
begin
  Result := Self.Create;
end;

procedure TControllerContaAPagar.GerarDuplicatas(aAnoCompra, aNumCompra: Integer);
var
  aDAO : IModelDAOCustom;
begin
  try
    aDAO := TModelDAOFactory.New.Busca;
    aDAO
      .Clear
      .SQL('Select')
      .SQL('    g.fornecedor ')
      .SQL('  , g.notafiscal ')
      .SQL('  , g.parcelas   ')
      .SQL('  , g.valor_total')
      .SQL('  , g.parcela    ')
      .SQL('  , g.emissao    ')
      .SQL('  , g.vencimento ')
      .SQL('  , g.valor_documento')
      .SQL('  , g.forma_pagto    ')
      .SQL('  , g.condicao_pagto ')
      .SQL('  , g.data_entrada   ')
      .SQL('  , g.ano_lanc       ')
      .SQL('  , g.num_lanc       ')
      .SQL('from SET_GERAR_DUPLICATAS(:anocompra, :numcompra) g')
      .ParamsByName('anocompra', aAnoCompra)
      .ParamsByName('numcompra', aNumCompra)
      .OpenOrExecute;
  finally
    aDAO.CommitTransaction
  end;
end;

end.
