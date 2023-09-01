unit Classe.Usuario;

interface

Uses
  System.SysUtils,

  Classe.Pessoa,
  Classe.PessoaFisica,
  Classe.Empresa,
  Classe.Funcao,

  Interacao.Pessoa,
  Interacao.Usuario,
  Interacao.Funcao,
  Interacao.Empresa;

type
  TUsuario = class(TPessoa, IUsuarioModel)
    strict private
      class var _instance : IUsuarioModel;
    private
      FLocalId: String;
      FUUID   : TGUID;
      FLogin  ,
      FEmail  ,
      FSenha  : String;
      FFuncao : IFuncao;
      FCentroCusto : Integer;
      FLogado ,
      FAlterarValorVenda : Boolean;
      FVendedor : IPessoaFisicaModel;
      FEmpresa  : IEmpresaModel;

      function LocalId(const Value: String) : IUsuarioModel; overload;
      function LocalId : String; overload;

      function UUID(const Value: TGUID)     : IUsuarioModel; overload;
      function UUID : TGUID; overload;

      function Login(const Value: String) : IUsuarioModel; overload;
      function Login : String; overload;

      function Email(const Value: String)   : IUsuarioModel; overload;
      function Email : String; overload;

      function Senha(const Value: String) : IUsuarioModel; overload;
      function Senha : String; overload;

      function Funcao(const Value: Integer) : IUsuarioModel; overload;
      function Funcao(const Value: IFuncao) : IUsuarioModel; overload;
      function Funcao : IFuncao; overload;

      function Empresa(const aCNPJ: String) : IUsuarioModel; overload;
      function Empresa(const Value: IEmpresaModel)  : IUsuarioModel; overload;
      function Empresa : IEmpresaModel; overload;
      function CNPJ : String;
      function RazaoSocial : String;

      function Vendedor(const aCodigo: Integer) : IUsuarioModel; overload;
      function Vendedor(const Value: IPessoaFisicaModel) : IUsuarioModel; overload;
      function Vendedor : IPessoaFisicaModel; overload;

      function CentroCusto(const Value: Integer)  : IUsuarioModel; overload;
      function CentroCusto : Integer; overload;

      function Logado(const Value: Boolean)  : IUsuarioModel; overload;
      function Logado : Boolean; overload;

      function AlterarValorVenda(const Value: Boolean)  : IUsuarioModel; overload;
      function AlterarValorVenda : Boolean; overload;

    protected
      constructor Create;
    public
      destructor Destroy; override;

      class function New : IUsuarioModel;
  end;

implementation


{ TUsuario }

function TUsuario.AlterarValorVenda: Boolean;
begin
  Result := FAlterarValorVenda;
end;

function TUsuario.AlterarValorVenda(const Value: Boolean): IUsuarioModel;
begin
  Result := Self;
  FAlterarValorVenda := Value;
end;

function TUsuario.CentroCusto: Integer;
begin
  Result := FCentroCusto;
end;

function TUsuario.CentroCusto(const Value: Integer): IUsuarioModel;
begin
  Result := Self;
  FCentroCusto := Value;
end;

function TUsuario.CNPJ: String;
begin
  Result := FEmpresa.CNPJ;
end;

constructor TUsuario.Create;
begin
  inherited Create;
  FLocalId := EmptyStr;
  FUUID    := TGUID.Empty;
  FLogin   := EmptyStr;
  FEmail   := EmptyStr;
  FSenha   := EmptyStr;
  FLogado  := False;
  FAlterarValorVenda := False;

  FFuncao   := TFuncao.New;
  FVendedor := TPessoaFisica.New;
  FEmpresa  := TEmpresa.New;
  FCentroCusto := 0;
end;

destructor TUsuario.Destroy;
begin
  inherited;
end;

function TUsuario.Email: String;
begin
  Result := FEmail;
end;

function TUsuario.Email(const Value: String): IUsuarioModel;
begin
  Result := Self;
  FEmail := Value.Trim.ToLower;
end;

function TUsuario.Empresa: IEmpresaModel;
begin
  Result := FEmpresa;
end;

function TUsuario.Empresa(const Value: IEmpresaModel): IUsuarioModel;
begin
  Result   := Self;
  FEmpresa := Value;
end;

function TUsuario.Funcao(const Value: Integer): IUsuarioModel;
begin
  Result := Self;
  FFuncao.Codigo(Value);
end;

function TUsuario.Funcao(const Value: IFuncao): IUsuarioModel;
begin
  Result  := Self;
  FFuncao := Value;
end;

function TUsuario.Empresa(const aCNPJ: String): IUsuarioModel;
begin
  if aCNPJ.Trim().Equals(EmptyStr) then
    raise Exception.Create('Empresa n�o informada');

  Result := Self;
  FEmpresa.CNPJ(aCNPJ);
end;

function TUsuario.LocalId: String;
begin
  Result := FLocalId;
end;

function TUsuario.LocalId(const Value: String): IUsuarioModel;
begin
  Result   := Self;
  FLocalId := Value.Trim;
end;

function TUsuario.Logado: Boolean;
begin
  Result := FLogado;
end;

function TUsuario.Logado(const Value: Boolean): IUsuarioModel;
begin
  Result  := Self;
  FLogado := Value;
end;

function TUsuario.Login: String;
begin
  Result := FLogin.ToUpper;
end;

class function TUsuario.New: IUsuarioModel;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TUsuario.RazaoSocial: String;
begin
  Result := FEmpresa.RazaoSocial;
end;

function TUsuario.Login(const Value: String): IUsuarioModel;
begin
  if Value.Trim().Equals(EmptyStr) then
    raise Exception.Create('Login n�o informado');

  Result := Self;
  FLogin := Value.Trim().ToLower();
end;

function TUsuario.Senha(const Value: String): IUsuarioModel;
begin
  if Value.Trim().Equals(EmptyStr) then
    raise Exception.Create('Senha n�o informada');

  Result := Self;
  FSenha := Value.Trim();
end;

function TUsuario.Senha: String;
begin
  Result := FSenha;
end;

function TUsuario.UUID: TGUID;
begin
  Result := FUUID;
end;

function TUsuario.UUID(const Value: TGUID): IUsuarioModel;
begin
  Result := Self;
  FUUID  := Value;
end;

function TUsuario.Vendedor: IPessoaFisicaModel;
begin
  Result := FVendedor;
end;

function TUsuario.Vendedor(const aCodigo: Integer): IUsuarioModel;
begin
  Result := Self;
  FVendedor.Codigo(aCodigo);
end;

function TUsuario.Vendedor(const Value: IPessoaFisicaModel): IUsuarioModel;
begin
  Result    := Self;
  FVendedor := Value;
end;

function TUsuario.Funcao: IFuncao;
begin
  Result := FFuncao;
end;

end.
