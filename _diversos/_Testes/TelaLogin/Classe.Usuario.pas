unit Classe.Usuario;

interface

Uses
  System.SysUtils, Classe.Pessoa;

type
  TUsuario = class(TPessoa)
    private
      FFuncao   : Integer;
      FVendedor : TPessoa;
      FLogado   : Boolean;
      FEmpresa  : String;
      FAlterarValorVenda: Boolean;
      FLogin    : String;
      procedure SetAlterarValorVenda(const Value: Boolean);
      procedure SetEmpresa(const Value: String);
      procedure SetFuncao(const Value: Integer);
      procedure SetLogado(const Value: Boolean);
      procedure SetLogin(const Value: String);
      procedure SetVendedor(const Value: TPessoa);
    public
      constructor Instanciar;

      property Login    : String read FLogin write SetLogin;
      property Funcao   : Integer read FFuncao write SetFuncao;
      property Empresa  : String read FEmpresa write SetEmpresa;
      property Vendedor : TPessoa read FVendedor write SetVendedor;
      property Logado   : Boolean read FLogado write SetLogado;
      property AlterarValorVenda : Boolean read FAlterarValorVenda write SetAlterarValorVenda;
  end;

implementation

{ TUsuario }

constructor TUsuario.Instanciar;
begin
  inherited Instanciar;
  FVendedor := TPessoa.Instanciar;
end;

procedure TUsuario.SetAlterarValorVenda(const Value: Boolean);
begin
  FAlterarValorVenda := Value;
end;

procedure TUsuario.SetEmpresa(const Value: String);
begin
  FEmpresa := Value.Trim();
end;

procedure TUsuario.SetFuncao(const Value: Integer);
begin
  FFuncao := Value;
end;

procedure TUsuario.SetLogado(const Value: Boolean);
begin
  FLogado := Value;
end;

procedure TUsuario.SetLogin(const Value: String);
begin
  FLogin := Value.Trim().ToLower();
end;

procedure TUsuario.SetVendedor(const Value: TPessoa);
begin
  FVendedor := Value;
end;

end.
