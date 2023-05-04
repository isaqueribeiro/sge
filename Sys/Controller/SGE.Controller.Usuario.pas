unit SGE.Controller.Usuario;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  TControllerusuario = class(TController, IControllerUsuario)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerUsuario;
//
//      function GetTipo(aCodigo : Integer) : TTipoCFOP;
//      function GetGerarDuplicata(aCodigo : Integer) : Boolean;
//      function GetDevolucao(aCodigo : Integer) : Boolean;
//      function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

implementation

{ TControllerusuario }

constructor TControllerusuario.Create;
begin
  inherited Create(TModelDAOFactory.New.Usuario);
end;

destructor TControllerusuario.Destroy;
begin
  inherited;
end;

//function TControllerusuario.Get(aCodigo: Integer): IModelDAOCustom;
//begin
//  if not Assigned(FBusca) then
//    FBusca := TModelDAOFactory.New.Busca;
//
//  FBusca
//    .Clear
//    .SQL('Select       ')
//    .SQL('  c.cfop_cod,')
//    .SQL('  c.cfop_descricao,         ')
//    .SQL('  c.cfop_resumido,          ')
//    .SQL('  c.cfop_especificacao,     ')
//    .SQL('  c.cfop_informacao_fisco,  ')
//    .SQL('  c.cfop_tipo,              ')
//    .SQL('  c.cfop_cst_padrao_entrada,')
//    .SQL('  c.cfop_cst_padrao_saida,  ')
//    .SQL('  c.cfop_devolucao,         ')
//    .SQL('  c.cfop_remessa,           ')
//    .SQL('  c.cfop_faturar_remessa,   ')
//    .SQL('  c.cfop_retorno_interno,   ')
//    .SQL('  c.cfop_retorno_externo,   ')
//    .SQL('  c.cfop_gerar_titulo,      ')
//    .SQL('  c.cfop_gerar_duplicata,   ')
//    .SQL('  c.cfop_altera_custo_produto, ')
//    .SQL('  c.cfop_altera_estoque_produto')
//    .SQL('from TBCFOP c')
//    .SQL('where c.cfop_cod = :codigo')
//    .ParamsByName('codigo', aCodigo)
//    .Open;
//
//  Result := FBusca;
//end;
//
//function TControllerusuario.GetDevolucao(aCodigo: Integer): Boolean;
//begin
//  Result := (Self.Get(aCodigo).DataSet.FieldByName('cfop_devolucao').AsInteger = FLAG_SIM)
//end;
//
//function TControllerusuario.GetGerarDuplicata(aCodigo: Integer): Boolean;
//begin
//  Result := (Self.Get(aCodigo).DataSet.FieldByName('cfop_gerar_duplicata').AsInteger = FLAG_SIM)
//end;
//
//function TControllerusuario.GetTipo(aCodigo: Integer): TTipoCFOP;
//begin
//  Result := TTipoCFOP(Self.Get(aCodigo).DataSet.FieldByName('cfop_tipo').AsInteger);
//end;

class function TControllerusuario.New: IControllerUsuario;
begin
  Result := Self.Create;
end;

end.
