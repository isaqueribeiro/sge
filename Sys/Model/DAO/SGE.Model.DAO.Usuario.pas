unit SGE.Model.DAO.Usuario;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Usuário do Sistema
  TModelDAOUsuario = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);

      function GetSenhaFormatada(const Value : String; const WithKey : Boolean) : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

uses
  System.DateUtils,
  UConstantesDGE,
  UFuncoes;

{ TModelDAOUsuario }

constructor TModelDAOUsuario.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_USUARIO');
  FConn
    .Query
      .TableName('TBUSERS')
      .AliasTableName('u')
      .KeyFields('nome')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_USUARIO')
      .SQL
        .Clear
        .Add('Select     ')
        .Add('    u.nome ')
        .Add('  , u.senha')
        .Add('  , u.nomecompleto ')
        .Add('  , u.codfuncao    ')
        .Add('  , u.limidesc     ')
        .Add('  , u.ativo        ')
        .Add('  , u.alterar_senha')
        .Add('  , u.perm_alterar_valor_venda')
        .Add('  , u.tipo_alterar_valor_venda')
        .Add('  , u.vendedor                ')
        .Add('  , u.almox_manifesto_automatico')
        .Add('  , u.usuario_app_id    ')
        .Add('  , u.codigo')
        .Add('  , f.funcao   as perfil')
        .Add('  , e.ds_email as email ')
        .Add('from TBUSERS u')
        .Add('  left join TBFUNCAO f on (f.cod = u.codfuncao)')
        .Add('  left join SYS_USUARIO e on (e.id_usuario = u.usuario_app_id)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOUsuario.Destroy;
begin
  inherited;
end;

function TModelDAOUsuario.GetSenhaFormatada(const Value: String; const WithKey: Boolean): String;
begin
  if WithKey then
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, USER_PASSWD_KEY), 1, USER_PASSWD_LIMITE - 2)
  else
    Result := USER_PASSWD_ENCRIPT + Copy(EncriptSenha(Value, EmptyStr), 1, USER_PASSWD_LIMITE - 2);
end;

class function TModelDAOUsuario.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOUsuario.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('perfil').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('email').ProviderFlags  := [];

  FConn.Query.DataSet.FieldByName('ativo').OnGetText := StatusGetText;
end;

procedure TModelDAOUsuario.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOUsuario.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (FieldByName('VENDEDOR').AsInteger = 0) then
      FieldByName('VENDEDOR').Clear;

    if (Trim(FieldByName('SENHA').AsString) <> EmptyStr) then
      if (Copy(FieldByName('SENHA').AsString, 1, 2) <> USER_PASSWD_ENCRIPT) then
        FieldByName('SENHA').AsString := GetSenhaFormatada(Trim(FieldByName('SENHA').AsString), False);

    if (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 0) then
      FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger := 0;

    if (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1) and (FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger = 0) then
      FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger := 1;
  end;
end;

procedure TModelDAOUsuario.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ALTERAR_SENHA').AsInteger              := 1; // Sim
    FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger   := 0; // Não
    FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger   := 0; // Nenhum
    FieldByName('ATIVO').AsInteger                      := 1; // Sim
    FieldByName('LIMIDESC').AsCurrency                  := 0.0;
    FieldByName('SENHA').AsString                       := USER_PASSWD_DEFAULT;
    FieldByName('ALMOX_MANIFESTO_AUTOMATICO').AsInteger := 0; // Não
    FieldByName('NOME').Clear;
    FieldByName('NOMECOMPLETO').Clear;
    FieldByName('USUARIO_APP_ID').Clear;
  end;
end;

procedure TModelDAOUsuario.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    FLAG_NAO : Text := 'Inativo';
    FLAG_SIM : Text := 'Ativo';
  end;
end;

end.
