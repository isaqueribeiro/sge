unit SGI.Model.DAO.ProdutoAlmoxarifado;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Produtos no estoque do almoxarifado
  TModelDAOProdutoAlmoxarifado = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOProdutoAlmoxarifado }

constructor TModelDAOProdutoAlmoxarifado.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select  ')
        .Add('    p.cod ')
        .Add('  , p.descri ')
        .Add('  , p.descri_apresentacao ')
        .Add('  , p.codunidade ')
        .Add('  , p.codunidade_fracionada ')
        .Add('  , u.unp_descricao ')
        .Add('  , u.unp_sigla ')
        .Add('  , g.lote_id   ')
        .Add('  , g.fracionador ')
        .Add('  , g.estoque ')
        .Add('  , g.reserva ')
        .Add('  , g.disponivel  ')
        .Add('  , g.custo_total ')
        .Add('  , g.custo_reserva    ')
        .Add('  , g.custo_disponivel ')
        .Add('from GET_ESTOQUE_ALMOX_DISPONIVEL (:empresa, :centro_custo, null, :lote, :lote_guid, :req_ano, :req_cod) g ')
        .Add('  inner join TBPRODUTO p on (p.cod = g.produto) ')
        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade_fracionada) ')
      .&End
      .ParamByName('empresa', Usuario.Empresa.CNPJ)
      .ParamByName('centro_custo', 0)
      .ParamByName('req_ano', 0)
      .ParamByName('req_cod', 0)
    .Close;

  FConn.Query.ParamByNameClear('lote');
  FConn.Query.ParamByNameClear('lote_guid');
end;

destructor TModelDAOProdutoAlmoxarifado.Destroy;
begin
  inherited;
end;

class function TModelDAOProdutoAlmoxarifado.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
