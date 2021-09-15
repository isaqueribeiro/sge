unit SGE.Controller.Fornecedor;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerFornecedor = class(TController, IControllerFornecedor)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFornecedor;

      function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

  // Transportadoras ativas
  TControllerTransportadora = class(TController, IControllerCustom)
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

{ TControllerFornecedor }

constructor TControllerFornecedor.Create;
begin
  inherited Create(TModelDAOFactory.New.Fornecedor);
end;

destructor TControllerFornecedor.Destroy;
begin
  inherited;
end;

function TControllerFornecedor.Get(aCodigo: Integer): IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;
    
  FBusca
    .Clear
    .SQL('Select              ')
    .SQL('    f.Codforn       ')
    .SQL('  , f.Pessoa_fisica ')
    .SQL('  , f.Cnpj          ')
    .SQL('  , f.Nomeforn      ')
    .SQL('  , f.Nomefant      ')
    .SQL('  , f.Inscest       ')
    .SQL('  , f.Inscmun       ')
    .SQL('  , f.Ender         ')
    .SQL('  , f.Complemento   ')
    .SQL('  , f.Numero_end    ')
    .SQL('  , f.Cep           ')
    .SQL('  , f.Cidade        ')
    .SQL('  , f.Uf            ')
    .SQL('  , f.Fone          ')
    .SQL('  , f.FoneCel       ')
    .SQL('  , f.FoneFax       ')
    .SQL('  , f.Tlg_tipo      ')
    .SQL('  , f.Log_cod       ')
    .SQL('  , f.Bai_cod       ')
    .SQL('  , f.Cid_cod       ')
    .SQL('  , f.Est_cod       ')
    .SQL('  , f.Email         ')
    .SQL('  , f.Site          ')
    .SQL('  , f.Contato       ')
    .SQL('  , f.Pais_id       ')
    .SQL('  , f.Grf_cod       ')
    .SQL('  , f.Transportadora')
    .SQL('  , f.banco         ')
    .SQL('  , f.agencia       ')
    .SQL('  , f.cc            ')
    .SQL('  , f.praca         ')
    .SQL('  , f.banco_2       ')
    .SQL('  , f.agencia_2     ')
    .SQL('  , f.cc_2          ')
    .SQL('  , f.praca_2       ')
    .SQL('  , f.banco_3       ')
    .SQL('  , f.agencia_3     ')
    .SQL('  , f.cc_3          ')
    .SQL('  , f.praca_3       ')
    .SQL('  , f.observacao    ')
    .SQL('  , f.DtCad         ')
    .SQL('  , f.Faturamento_minimo')
    .SQL('  , f.ativo             ')
    .SQL('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), f.Ender ) as Logradouro')
    .SQL('  , b.Bai_nome')
    .SQL('  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome')
    .SQL('  , coalesce(u.Est_nome, f.Uf) as Est_nome    ')
    .SQL('  , p.Pais_nome                               ')
    .SQL('from TBFORNECEDOR f                           ')
    .SQL('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.Tlg_tipo)')
    .SQL('  left join TBLOGRADOURO l on (l.Log_cod = f.Log_cod)      ')
    .SQL('  left join TBBAIRRO b on (b.Bai_cod = f.Bai_cod)          ')
    .SQL('  left join TBCIDADE c on (c.Cid_cod = f.Cid_cod)          ')
    .SQL('  left join TBESTADO u on (u.Est_cod = f.Est_cod)          ')
    .SQL('  left join TBPAIS p on (p.Pais_id = f.Pais_id)            ')
    .SQL('where (f.Codforn = :codigo)')
    .ParamsByName('codigo', aCodigo)
    .Open;

  Result := FBusca;
end;

class function TControllerFornecedor.New: IControllerFornecedor;
begin
  Result := Self.Create;
end;

{ TControllerTransportadora }

constructor TControllerTransportadora.Create;
begin
  inherited Create(TModelDAOFactory.New.Transportadora);
end;

destructor TControllerTransportadora.Destroy;
begin
  inherited;
end;

class function TControllerTransportadora.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
