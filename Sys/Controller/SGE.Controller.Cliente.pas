unit SGE.Controller.Cliente;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerCliente = class(TController, IControllerCliente)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCliente;

      procedure BloquearClientes;
      procedure BloquearCliente(aCodigo : Integer; aLog : String);
      procedure DesbloquearCliente(aCodigo : Integer; aLog : String);

      function CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
      function Get(aCodigo : Integer) : IModelDAOCustom; overload;
      function Get(aCNPJ : String) : IModelDAOCustom; overload;
  end;

  // Table
  TControllerClienteTotalCompras = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerClienteTitulos = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerClienteEstoque = class(TController, IControllerCustom)
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

{ TControllerCliente }

function TControllerCliente.CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
var
  aDAO : IModelDAOCustom;
begin
  aDAO := TModelDAOFactory.New.Cliente;
  aDAO.ClearWhere;
  aDAO
    .Where('cl.Cnpj    = ' + CpfCnpj.Trim.QuotedString)
    .Where('cl.Codigo != ' + Codigo.ToString)
    .Open;

  Result := not aDAO.DataSet.IsEmpty;

  if Result then
  begin
    aCodigo := aDAO.DataSet.FieldByName('Codigo').AsInteger;
    aNome   := aDAO.DataSet.FieldByName('Nome').AsString;
  end;
end;

constructor TControllerCliente.Create;
begin
  inherited Create(TModelDAOFactory.New.Cliente);
end;

destructor TControllerCliente.Destroy;
begin
  inherited;
end;

function TControllerCliente.Get(aCNPJ: String): IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select')
    .SQL('    f.codigo')
    .SQL('  , f.tipo  ')
    .SQL('  , f.pessoa_fisica')
    .SQL('  , f.cnpj    ')
    .SQL('  , f.nome    ')
    .SQL('  , f.nomefant')
    .SQL('  , f.inscest ')
    .SQL('  , f.inscmun ')
    .SQL('  , f.ender   ')
    .SQL('  , f.complemento')
    .SQL('  , f.bairro     ')
    .SQL('  , f.cep        ')
    .SQL('  , f.cidade     ')
    .SQL('  , f.uf         ')
    .SQL('  , f.fone       ')
    .SQL('  , f.fonecel    ')
    .SQL('  , f.fonecomerc ')
    .SQL('  , f.email      ')
    .SQL('  , f.site       ')
    .SQL('  , f.tlg_tipo   ')
    .SQL('  , f.log_cod    ')
    .SQL('  , f.bai_cod    ')
    .SQL('  , f.cid_cod    ')
    .SQL('  , f.est_cod    ')
    .SQL('  , f.numero_end ')
    .SQL('  , f.pais_id    ')
    .SQL('  , f.valor_limite_compra')
    .SQL('  , f.bloqueado')
    .SQL('  , f.bloqueado_data   ')
    .SQL('  , f.bloqueado_motivo ')
    .SQL('  , f.bloqueado_usuario')
    .SQL('  , f.bloqueado_automatico')
    .SQL('  , f.desbloqueado_data   ')
    .SQL('  , f.vendedor_cod')
    .SQL('  , f.usuario')
    .SQL('  , f.emitir_nfe_devolucao ')
    .SQL('  , f.custo_oper_percentual')
    .SQL('  , f.custo_oper_frete ')
    .SQL('  , f.custo_oper_outros')
    .SQL('  , f.entrega_fracionada_venda')
    .SQL('  , f.banco  ')
    .SQL('  , f.agencia')
    .SQL('  , f.cc   ')
    .SQL('  , f.praca')
    .SQL('  , f.dtcad')
    .SQL('  , f.observacao')
    .SQL('  , f.ativo')
    .SQL('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), f.Ender ) as Logradouro')
    .SQL('  , b.Bai_nome')
    .SQL('  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome')
    .SQL('  , coalesce(u.Est_nome, f.Uf) as Est_nome')
    .SQL('  , p.Pais_nome')
    .SQL('from TBCLIENTE f')
    .SQL('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.tlg_tipo)')
    .SQL('  left join TBLOGRADOURO l on (l.Log_cod = f.log_cod)')
    .SQL('  left join TBBAIRRO b on (b.Bai_cod = f.bai_cod)')
    .SQL('  left join TBCIDADE c on (c.Cid_cod = f.cid_cod)')
    .SQL('  left join TBESTADO u on (u.Est_cod = f.est_cod)')
    .SQL('  left join TBPAIS p on (p.Pais_id = f.pais_id)')
    .SQL('where (f.Cnpj = :Cnpj)')
    .ParamsByName('Cnpj', aCNPJ)
    .Open;

  Result := FBusca;
end;

function TControllerCliente.Get(aCodigo: Integer): IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select')
    .SQL('    f.codigo')
    .SQL('  , f.tipo  ')
    .SQL('  , f.pessoa_fisica')
    .SQL('  , f.cnpj    ')
    .SQL('  , f.nome    ')
    .SQL('  , f.nomefant')
    .SQL('  , f.inscest ')
    .SQL('  , f.inscmun ')
    .SQL('  , f.ender   ')
    .SQL('  , f.complemento')
    .SQL('  , f.bairro     ')
    .SQL('  , f.cep        ')
    .SQL('  , f.cidade     ')
    .SQL('  , f.uf         ')
    .SQL('  , f.fone       ')
    .SQL('  , f.fonecel    ')
    .SQL('  , f.fonecomerc ')
    .SQL('  , f.email      ')
    .SQL('  , f.site       ')
    .SQL('  , f.tlg_tipo   ')
    .SQL('  , f.log_cod    ')
    .SQL('  , f.bai_cod    ')
    .SQL('  , f.cid_cod    ')
    .SQL('  , f.est_cod    ')
    .SQL('  , f.numero_end ')
    .SQL('  , f.pais_id    ')
    .SQL('  , f.valor_limite_compra')
    .SQL('  , f.bloqueado')
    .SQL('  , f.bloqueado_data   ')
    .SQL('  , f.bloqueado_motivo ')
    .SQL('  , f.bloqueado_usuario')
    .SQL('  , f.bloqueado_automatico')
    .SQL('  , f.desbloqueado_data   ')
    .SQL('  , f.vendedor_cod')
    .SQL('  , f.usuario')
    .SQL('  , f.emitir_nfe_devolucao ')
    .SQL('  , f.custo_oper_percentual')
    .SQL('  , f.custo_oper_frete ')
    .SQL('  , f.custo_oper_outros')
    .SQL('  , f.entrega_fracionada_venda')
    .SQL('  , f.banco  ')
    .SQL('  , f.agencia')
    .SQL('  , f.cc   ')
    .SQL('  , f.praca')
    .SQL('  , f.dtcad')
    .SQL('  , f.observacao')
    .SQL('  , f.ativo')
    .SQL('  , coalesce( cast(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome as varchar(250)), f.Ender ) as Logradouro')
    .SQL('  , b.Bai_nome')
    .SQL('  , coalesce(c.Cid_nome, f.Cidade) as Cid_nome')
    .SQL('  , coalesce(u.Est_nome, f.Uf) as Est_nome')
    .SQL('  , p.Pais_nome')
    .SQL('from TBCLIENTE f')
    .SQL('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = f.tlg_tipo)')
    .SQL('  left join TBLOGRADOURO l on (l.Log_cod = f.log_cod)')
    .SQL('  left join TBBAIRRO b on (b.Bai_cod = f.bai_cod)')
    .SQL('  left join TBCIDADE c on (c.Cid_cod = f.cid_cod)')
    .SQL('  left join TBESTADO u on (u.Est_cod = f.est_cod)')
    .SQL('  left join TBPAIS p on (p.Pais_id = f.pais_id)')
    .SQL('where (f.codigo = :codigo)')
    .ParamsByName('codigo', aCodigo)
    .Open;

  Result := FBusca;
end;

class function TControllerCliente.New: IControllerCliente;
begin
  Result := Self.Create;
end;

procedure TControllerCliente.BloquearClientes;
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCLIENTE Set');
    aScriptSQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    aScriptSQL.Add('  , Bloqueado = 1');
    aScriptSQL.Add('  , Bloqueado_automatico = 1');
    aScriptSQL.Add('  , Bloqueado_data = Current_date');
    aScriptSQL.Add('  , Bloqueado_usuario = user');
    aScriptSQL.Add('  , Usuario = user');
    aScriptSQL.Add('  , Desbloqueado_data = null');
    aScriptSQL.Add('  , Bloqueado_motivo = ' + QuotedStr(CLIENTE_BLOQUEADO_PORDEBITO));
    aScriptSQL.Add('where Bloqueado = 0');
    aScriptSQL.Add('  and ((Desbloqueado_data is null) or (Desbloqueado_data <> Current_date))');
    aScriptSQL.Add('  and Codigo in (');
    aScriptSQL.Add('    Select Distinct');
    aScriptSQL.Add('      r.Cliente');
    aScriptSQL.Add('    from TBCONTREC r');
    aScriptSQL.Add('    where r.Parcela  > 0'); // Parcelas a prazo
    aScriptSQL.Add('      and r.Situacao = 1'); // Situação ativa
    aScriptSQL.Add('      and r.Baixado  = 0'); // Títulos não baixados (em aberto)
    aScriptSQL.Add('      and r.Cliente != ' + IntToStr(CONSUMIDOR_FINAL_CODIGO));
    // O cliente encontra-se bloqueado por haver títulos em atraso.
    aScriptSQL.Add('      and r.Dtvenc < Current_date');
    aScriptSQL.Add('  )');
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerCliente.BloquearCliente(aCodigo: Integer; aLog: String);
var
  aScriptSQL  : TStringList;
  aUsuario : STring;
begin
  aScriptSQL := TStringList.Create;
  aUsuario   := TFactoryController.getInstance().getUsuarioController().Login;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCLIENTE Set');
    aScriptSQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    aScriptSQL.Add('  , Desbloqueado_data = Null');
    aScriptSQL.Add('  , Bloqueado = 1');
    aScriptSQL.Add('  , Bloqueado_automatico = 0');
    aScriptSQL.Add('  , Bloqueado_data = Current_date');
    aScriptSQL.Add('  , Bloqueado_usuario = ' + aUsuario.QuotedString);
    aScriptSQL.Add('  , Usuario = ' + aUsuario.QuotedString);

    if aLog.Trim.IsEmpty then
      aScriptSQL.Add('  , Bloqueado_motivo = Null')
    else
      aScriptSQL.Add('  , Bloqueado_motivo = ' + aLog.Trim.QuotedString);

    aScriptSQL.Add('where Codigo = ' + aCodigo.ToString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerCliente.DesbloquearCliente(aCodigo: Integer; aLog: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCLIENTE Set');
    aScriptSQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    aScriptSQL.Add('  , Desbloqueado_data = Current_date');
    aScriptSQL.Add('  , Bloqueado = 0');
    aScriptSQL.Add('  , Bloqueado_automatico = 0');
    aScriptSQL.Add('  , Bloqueado_data = Null');
    aScriptSQL.Add('  , Bloqueado_usuario = Null');
    aScriptSQL.Add('  , Usuario = ' + TFactoryController.getInstance().getUsuarioController().Login.QuotedString);

    if Trim(aLog) = EmptyStr then
      aScriptSQL.Add('  , Bloqueado_motivo = Null')
    else
      aScriptSQL.Add('  , Bloqueado_motivo = ' + aLog.Trim.QuotedString);

    aScriptSQL.Add('where Codigo = ' + aCodigo.ToString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

{ TControllerClienteTotalCompras }

constructor TControllerClienteTotalCompras.Create;
begin
  inherited Create(TModelDAOFactory.New.ClienteTotalCompras);
end;

destructor TControllerClienteTotalCompras.Destroy;
begin
  inherited;
end;

class function TControllerClienteTotalCompras.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClienteTitulos }

constructor TControllerClienteTitulos.Create;
begin
  inherited Create(TModelDAOFactory.New.ClienteTitulos);
end;

destructor TControllerClienteTitulos.Destroy;
begin
  inherited;
end;

class function TControllerClienteTitulos.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClienteEstoque }

constructor TControllerClienteEstoque.Create;
begin
  inherited Create(TModelDAOFactory.New.ClienteEstoque);
end;

destructor TControllerClienteEstoque.Destroy;
begin
  inherited;
end;

class function TControllerClienteEstoque.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
