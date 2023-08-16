unit SGE.Controller.CentroCusto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerCentroCusto = class(TController, IControllerCentroCusto)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCentroCusto;

      procedure SetCentroCustoGeral(aEmpresa : String);

      function Listar(aEmpresa : String) : IModelDAOCustom;
      function Carregar(aCodigo : Integer) : IControllerCentroCusto;
  end;

  // Table Detail
  TControllerCentroCustoEmpresa = class(TController, IControllerCustom)
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
  System.Classes,
  UConstantesDGE,
  Controller.Factory;

{ TControllerCentroCusto }

function TControllerCentroCusto.Carregar(aCodigo: Integer): IControllerCentroCusto;
begin
  Result := Self;

  DAO
    .Close
    .ClearWhere;

  DAO
    .SQL('where (c.codigo = :codigo)')
    .ParamsByName('codigo', aCodigo)
    .Open;
end;

constructor TControllerCentroCusto.Create;
begin
  inherited Create(TModelDAOFactory.New.CentroCusto);
end;

destructor TControllerCentroCusto.Destroy;
begin
  inherited;
end;

function TControllerCentroCusto.Listar(aEmpresa: String): IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select')
    .SQL('    c.codigo   ')
    .SQL('  , c.descricao')
    .SQL('  , ci.nome    ')
    .SQL('from TBCENTRO_CUSTO c')
    .SQL('  left join TBCENTRO_CUSTO_EMPRESA e on (e.centro_custo = c.codigo)')
    .SQL('  left join TBCLIENTE ci on (ci.codigo = c.codcliente)')
    .SQL('  ')
    .SQL('where (e.empresa = :empresa)   ')
    .SQL('  or (c.codcliente is not null)')
    .SQL('  ')
    .SQL('order by')
    .SQL('    2   ')
    .ParamsByName('empresa', aEmpresa.Trim)
    .Open;

  Result := FBusca;
end;

class function TControllerCentroCusto.New: IControllerCentroCusto;
begin
  Result := Self.Create;
end;

procedure TControllerCentroCusto.SetCentroCustoGeral(aEmpresa: String);
var
  aScriptSQL : TStringList;
  aUsuario   : String;
begin
  aScriptSQL := TStringList.Create;
  aUsuario   := TFactoryController.getInstance().getUsuarioController().Login;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('execute block');
    aScriptSQL.Add('as');
    aScriptSQL.Add('  declare variable cc Integer;');
    aScriptSQL.Add('  declare variable ep varchar(18);');
    aScriptSQL.Add('begin');
    aScriptSQL.Add('  cc = ' + IntToStr(CENTRO_CUSTO_ESTOQUE_GERAL) + ';');
    aScriptSQL.Add('  ep = ' + aEmpresa.QuotedString + '; ');

    aScriptSQL.Add('  /* Cadastrar Centro de Custo 1 */');

    aScriptSQL.Add('  if (not exists(');
    aScriptSQL.Add('    Select');
    aScriptSQL.Add('      c.descricao');
    aScriptSQL.Add('    from TBCENTRO_CUSTO c');
    aScriptSQL.Add('    where c.codigo = :cc');
    aScriptSQL.Add('  )) then');
    aScriptSQL.Add('  begin');
    aScriptSQL.Add('    Insert into TBCENTRO_CUSTO (');
    aScriptSQL.Add('        codigo     ');
    aScriptSQL.Add('      , descricao  ');
    aScriptSQL.Add('      , ativo      ');
    aScriptSQL.Add('      , codcliente ');
    aScriptSQL.Add('    ) values (');
    aScriptSQL.Add('        :cc');
    aScriptSQL.Add('      , ' + QuotedStr(CENTRO_CUSTO_ESTOQUE_GERAL_DSC) + ' ');
    aScriptSQL.Add('      , 1');
    aScriptSQL.Add('      , null');
    aScriptSQL.Add('    );');
    aScriptSQL.Add('  end');

    aScriptSQL.Add('  /* Associar Centro de Custo 1 a Empresa */');

    aScriptSQL.Add('  if (not exists(');
    aScriptSQL.Add('    Select');
    aScriptSQL.Add('      ce.centro_custo');
    aScriptSQL.Add('    from TBCENTRO_CUSTO_EMPRESA ce');
    aScriptSQL.Add('    where ce.centro_custo = :cc');
    aScriptSQL.Add('      and ce.empresa      = :ep');
    aScriptSQL.Add('  )) then');
    aScriptSQL.Add('  begin');
    aScriptSQL.Add('    Insert Into TBCENTRO_CUSTO_EMPRESA (');
    aScriptSQL.Add('        centro_custo ');
    aScriptSQL.Add('      , empresa      ');
    aScriptSQL.Add('      , selecionar   ');
    aScriptSQL.Add('    ) values (');
    aScriptSQL.Add('        :cc');
    aScriptSQL.Add('      , :ep');
    aScriptSQL.Add('      , 1');
    aScriptSQL.Add('    );');
    aScriptSQL.Add('  end');
    aScriptSQL.Add('end');
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

{ TControllerCentroCustoEmpresa }

constructor TControllerCentroCustoEmpresa.Create;
begin
  inherited Create(TModelDAOFactory.New.CentroCustoEmpresa);
end;

destructor TControllerCentroCustoEmpresa.Destroy;
begin
  inherited;
end;

class function TControllerCentroCustoEmpresa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
