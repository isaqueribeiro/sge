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
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCliente;

      procedure BloquearClientes;
      procedure BloquearCliente(aCodigo : Integer; aLog : String);
      procedure DesbloquearCliente(aCodigo : Integer; aLog : String);

      function CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
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
    aScriptSQL.Add('      and r.Cliente  <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO));
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
