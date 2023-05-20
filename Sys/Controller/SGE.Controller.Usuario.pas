unit SGE.Controller.Usuario;

interface

uses
  System.SysUtils,
  Data.DB,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  Controller.Usuario,
  UConstantesDGE;

type
  TControllerusuario = class(TController, IControllerUsuario)
    private
      FBusca : IModelDAOCustom;

      function SenhaFormatada(Value : String) : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerUsuario;

      function LoginExiste(const Login : String) : Boolean;
      function Carregar(const Login : String) : IControllerusuario;
      function SalvarNovaSenha : IControllerusuario;
//
//      function GetTipo(aCodigo : Integer) : TTipoCFOP;
//      function GetGerarDuplicata(aCodigo : Integer) : Boolean;
//      function GetDevolucao(aCodigo : Integer) : Boolean;
//      function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

implementation

{ TControllerusuario }

function TControllerusuario.Carregar(const Login: String): IControllerusuario;
begin
  Result := Self;
  FDAO
    .Close
    .ClearWhere;

  FDAO
    .Where('upper(u.nome) = upper(:nome)')
    .ParamsByName('nome', Login.Trim.ToUpper)
    .Open;
end;

constructor TControllerusuario.Create;
begin
  inherited Create(TModelDAOFactory.New.Usuario);
end;

destructor TControllerusuario.Destroy;
begin
  inherited;
end;

function TControllerusuario.LoginExiste(const Login: String): Boolean;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select  ')
    .SQL('  u.nome')
    .SQL('from TBUSERS u')
    .SQL('where (u.nome = :login)')
    .ParamsByName('login', Login)
    .Open;

  Result := not FBusca.DataSet.IsEmpty;
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

function TControllerusuario.SalvarNovaSenha: IControllerusuario;
var
  aSenha  : String;
  aValida : Boolean;
begin
  Result := Self;

  if (FDAO.DataSet.State = TDataSetState.dsEdit) then
  begin
    if Trim(FDAO.DataSet.FieldByName('SENHA_ATUAL').AsString).IsEmpty then
      FDAO.DataSet.FieldByName('SENHA_ATUAL').Clear;

    if Trim(FDAO.DataSet.FieldByName('SENHA_NOVA').AsString).IsEmpty then
      FDAO.DataSet.FieldByName('SENHA_NOVA').Clear;

    if Trim(FDAO.DataSet.FieldByName('SENHA_CONFIRMAR').AsString).IsEmpty then
      FDAO.DataSet.FieldByName('SENHA_CONFIRMAR').Clear;

    FDAO.DataSet.FieldByName('SENHA_NOVA').AsString      := Trim(FDAO.DataSet.FieldByName('SENHA_NOVA').AsString);
    FDAO.DataSet.FieldByName('SENHA_CONFIRMAR').AsString := Trim(FDAO.DataSet.FieldByName('SENHA_CONFIRMAR').AsString);

    // Verificar senha atual
    aSenha  := Trim(FDAO.DataSet.FieldByName('SENHA_ATUAL').AsString);
    aValida := (AnsiCompareStr(FDAO.DataSet.FieldByName('SENHA').AsString, aSenha) = 0)
            or (AnsiCompareStr(FDAO.DataSet.FieldByName('SENHA').AsString, SenhaFormatada(aSenha)) = 0);

    if not aValida then
      raise Exception.Create('A Senha informada como atual é inválida!');

    // Verificar nova senha
    aSenha  := Trim(FDAO.DataSet.FieldByName('SENHA_NOVA').AsString);
    aValida := (AnsiCompareStr(FDAO.DataSet.FieldByName('SENHA').AsString, aSenha) = 0)
            or (AnsiCompareStr(FDAO.DataSet.FieldByName('SENHA').AsString, SenhaFormatada(aSenha)) = 0);

    if aValida then
      raise Exception.Create('A nova senha não pode ser igual a antiga!');

    if (AnsiCompareStr(FDAO.DataSet.FieldByName('SENHA_NOVA').AsString, FDAO.DataSet.FieldByName('SENHA_CONFIRMAR').AsString) <> 0  ) then
      raise Exception.Create('A nova senha não confere!');

    aSenha := Trim(FDAO.DataSet.FieldByName('SENHA_NOVA').AsString);

    FDAO.DataSet.FieldByName('ALTERAR_SENHA').AsInteger := 0; // Não
    FDAO.DataSet.FieldByName('SENHA').AsString          := SenhaFormatada(aSenha);

    FDAO.DataSet.Post;

    FDAO.ApplyUpdates;
    FDAO.CommitUpdates;
    FDAO.CommitTransaction;
  end;
end;

function TControllerusuario.SenhaFormatada(Value : String) : String;
begin
  Result := TUsuarioController.GetInstance().GetSenhaFormatada(Value, False);
end;

end.
