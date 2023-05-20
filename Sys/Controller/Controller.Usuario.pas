unit Controller.Usuario;

interface

Uses
  FireDAC.Comp.Client, System.SysUtils, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  Interacao.Usuario, Interacao.Funcao, Interacao.Empresa,
  Classe.Usuario, Classe.Empresa;

type
  TUsuarioController = class(TInterfacedObject, IUsuario)
    strict private
      class var _instancia : TUsuarioCOntroller;
    private
      [weak]
      FModel : IUsuarioModel;
    protected
      constructor Create();
      destructor Destroy();
    public
      procedure LogOff;
      function Load(aConn : TFDConnection; aLogin : String) : IUsuario; overload;

      function EncriptSenha(const Value, Key : String) : String;
      function DecriptarSenha(const Value, Key : String) : String;
      function GetSenhaFormatada(const Value : String; const WithKey : Boolean) : String;

      function Autenticar : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aLogin, aSenha, aEmpresa : String) : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aLogin, aSenha : String; aEmpresa : TObject) : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aUsuario : IUsuarioModel) : Boolean; overload;

      function Logado   : Boolean;
      function LocalId : String;
      function UUID     : TGUID;
      function Login    : String;
      function Email    : String;
      function Nome     : String;
      function Empresa  : String;
      function Funcao   : Integer;
      function Vendedor : Integer;
      function AlterarValorVenda : Boolean;

      class function GetInstance() : TUsuarioController;
  end;

const
  USER_PASSWD_LIMITE  = 16;
  USER_PASSWD_ENCRIPT = 'x|';
  USER_PASSWD_DEFAULT = 'ABC123';
  USER_PASSWD_KEY     = 'ADONAI';

implementation

{ TUsuarioCOntroller }

function TUsuarioController.Load(aConn : TFDConnection; aLogin: String): IUsuario;
var
  aQry  : TFDQuery;
  aGuid : String;
begin
  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection  := aConn;
    aQry.Transaction := aConn.Transaction;

    with aQry do
    begin
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    u.nome   as login');
      SQL.Add('  , u.senha');
      SQL.Add('  , u.nomecompleto as nome');
      SQL.Add('  , u.codfuncao as funcao');
      SQL.Add('  , f.funcao    as nome_funcao');
      SQL.Add('  , u.vendedor');
      SQL.Add('  , v.nome as nome_vendador');
      SQL.Add('  , v.cpf  as cpf_vendedor');
      SQL.Add('  , u.perm_alterar_valor_venda as alterar_valor_venda');
      SQL.Add('  , u.usuario_app_id as uuid  ' );
      SQL.Add('  , e.ds_email       as email ' );
      SQL.Add('from TBUSERS u');
      SQL.Add('  left join TBFUNCAO f on (f.cod = u.codfuncao)');
      SQL.Add('  left join TBVENDEDOR v on (v.cod = u.vendedor)');
      SQL.Add('  left join SYS_USUARIO e on (e.id_usuario = u.usuario_app_id)');
      SQL.Add('where (u.ativo = 1)');
      SQL.Add('  and (lower(u.nome) = lower(:login))');
      SQL.EndUpdate;

      ParamByName('login').AsString := aLogin;

      if OpenOrExecute and (RecordCount > 0) then
      begin
        FModel
          .Nome( FieldByName('nome').AsString );

        aGuid := FieldByName('uuid').AsString;
        if aGuid.Trim.IsEmpty then
          aGuid := TGUID.Empty.ToString;

        FModel
          .UUID( StringToGUID(aGuid) )
          .Login( FieldByName('login').AsString )
          .Email( FieldByName('email').AsString )
          .Senha( FieldByName('senha').AsString )
          .Funcao( FieldByName('funcao').AsInteger )
          .Vendedor( FieldByName('vendedor').AsInteger )
          .AlterarValorVenda( FieldByName('alterar_valor_venda').AsInteger = 1 )
          .Logado(True);

        FModel
          .Vendedor
            .CPF( FieldByName('cpf_vendedor').AsString )
            .Codigo( FieldByName('vendedor').AsInteger )
            .Nome( FieldByName('nome_vendador').AsString );
      end;
    end;
  finally
    aQry.DisposeOf;
    Result := Self;
  end;
end;

function TUsuarioController.LocalId: String;
begin
  Result := FModel.LocalId;
end;

function TUsuarioController.Logado: Boolean;
begin
  Result := FModel.Logado;
end;

function TUsuarioController.Login: String;
begin
  Result := FModel.Login;
end;

procedure TUsuarioController.LogOff;
begin
  FModel
    .Login('empty')
    .Senha('empty')
    .Logado(False);
end;

function TUsuarioController.Nome: String;
begin
  Result := FModel.Nome;
end;

function TUsuarioController.UUID: TGUID;
begin
  Result := FModel.UUID;
end;

function TUsuarioController.Vendedor: Integer;
begin
  Result := FModel.Vendedor.Codigo;
end;

function TUsuarioCOntroller.Autenticar: Boolean;
begin
  Result := (not FModel.Login.IsEmpty) and (not FModel.Senha.IsEmpty);
end;

function TUsuarioCOntroller.Autenticar(aConn : TFDConnection; aLogin, aSenha, aEmpresa: String): Boolean;
begin
  if (aConn = nil) then
    Result := (FModel.Senha = GetSenhaFormatada(aSenha, False))
  else
  begin
    Self.Load(aConn, aLogin);
    Result := (FModel.Senha = GetSenhaFormatada(aSenha, False));
  end;

  FModel.Empresa(aEmpresa);
end;

function TUsuarioController.AlterarValorVenda: Boolean;
begin
  Result := FModel.AlterarValorVenda;
end;

function TUsuarioCOntroller.Autenticar(aConn : TFDConnection; aUsuario: IUsuarioModel): Boolean;
var
  aLogin ,
  aSenha : String;
begin
  aLogin := aUsuario.Login;
  aSenha := aUsuario.Senha;
  FModel := aUsuario;

  Self.Load(aConn, aLogin);

  Result := (FModel.Senha = GetSenhaFormatada(aSenha, False));
end;

function TUsuarioController.Autenticar(aConn : TFDConnection; aLogin, aSenha: String; aEmpresa: TObject): Boolean;
var
  ModelEmpresa : IEmpresaModel;
begin
  if (aConn = nil) then
    Result := (FModel.Senha = GetSenhaFormatada(aSenha, False))
  else
  begin
    Self.Load(aConn, aLogin);
    Result := (FModel.Senha = GetSenhaFormatada(aSenha, False));
  end;

  ModelEmpresa := TEmpresa.getInstance();
  ModelEmpresa
    .Codigo( TEmpresaObject(aEmpresa).Codigo )
    .RazaoSocial( TEmpresaObject(aEmpresa).RazaoSocial )
    .Fantasia( TEmpresaObject(aEmpresa).Fantasia )
    .Endereco( TEmpresaObject(aEmpresa).Endereco )
    .CNPJ( TEmpresaObject(aEmpresa).CNPJ );

  FModel.Empresa(ModelEmpresa);
end;

constructor TUsuarioCOntroller.Create;
begin
  inherited Create;
  FModel := TUsuario.New;
end;

function TUsuarioController.DecriptarSenha(const Value, Key: String): String;
var
  sKeyChar   ,
  sStrEncode : String;
  IdEncoder  : TIdEncoderMIME;
  IdDecoder  : TIdDecoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  IdDecoder := TIdDecoderMIME.Create(nil);
  try
    sKeyChar   := IdEncoder.EncodeString(Key);
    sStrEncode := Value;

    if (Pos(sKeyChar, sStrEncode) = 0)  then
      raise Exception.Create('Criptografia corrompida!!!')
    else
      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);

    Result := IdDecoder.DecodeString(sStrEncode);
  finally
    IdEncoder.Free;
    IdDecoder.Free;
  end;
end;

destructor TUsuarioCOntroller.Destroy;
begin
  TUsuario(FModel).DisposeOf;
  inherited Destroy;
end;

function TUsuarioController.Email: String;
begin
  Result := FModel.Email;
end;

function TUsuarioController.Empresa: String;
begin
  Result := FModel.Empresa.CNPJ;
end;

function TUsuarioController.EncriptSenha(const Value, Key: String): String;
var
  sKeyChar    ,
  sStrEncode  ,
  sResult     : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  try
    sKeyChar    := IdEncoder.EncodeString(Key);
    sStrEncode  := IdEncoder.EncodeString(Value);
    iTamanhoStr := Length(sStrEncode);

    iPosicaoKey := -1;
    while (iPosicaoKey < 0) do
      iPosicaoKey := Random(iTamanhoStr);

    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);

    Result := sResult;
  finally
    IdEncoder.Free;
  end;
end;

function TUsuarioController.Funcao: Integer;
begin
  Result := FModel.Funcao.Codigo;
end;

function TUsuarioController.GetSenhaFormatada(const Value: String; const WithKey: Boolean): String;
begin
  if WithKey then
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, USER_PASSWD_KEY), 1, USER_PASSWD_LIMITE - 2)
  else
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, EmptyStr), 1, USER_PASSWD_LIMITE - 2);
end;

class function TUsuarioController.GetInstance: TUsuarioController;
begin
  if not Assigned(_instancia) then
    _instancia := TUsuarioCOntroller.Create();

  Result := _instancia;
end;

end.
