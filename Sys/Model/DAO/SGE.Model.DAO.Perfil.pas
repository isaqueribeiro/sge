unit SGE.Model.DAO.Perfil;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Perfil de Usu�rios do Sistema
  TModelDAOPerfil = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Perfis liberados para c�pia
  TModelDAOPerfilLiberado = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Permiss�es no Sistema por Perfil
  TModelDAOPerfilPermissao = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  TModelDAOTipoDescontoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOPerfil }

constructor TModelDAOPerfil.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_PERFIL');
  FConn
    .Query
      .TableName('TBFUNCAO')
      .AliasTableName('f')
      .KeyFields('cod')
      .AutoIncFields('cod')
      .GeneratorName('GEN_PERFIL')
      .SQL
        .Clear
        .Add('Select   ')
        .Add('    f.cod')
        .Add('  , f.funcao')
        .Add('  , f.ativo ')
        .Add('from TBFUNCAO f')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOPerfil.Destroy;
begin
  inherited;
end;

class function TModelDAOPerfil.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOPerfil.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
//  FConn.Query.DataSet.FieldByName('perfil').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('email').ProviderFlags  := [];

  FConn.Query.DataSet.FieldByName('ativo').OnGetText := StatusGetText;
end;

function TModelDAOPerfil.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    f.cod    as codigo')
        .Add('  , f.funcao as descricao')
        .Add('  , f.ativo ')
        .Add('from TBFUNCAO f')
        .Add('order by       ')
        .Add('    f.funcao')
      .&End
      .Open;

  FConn.Query.DataSet.Filter := '(ativo = 1)';
end;

procedure TModelDAOPerfil.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOPerfil.DataSetBeforePost(DataSet: TDataSet);
var
  aSenha : String;
begin
  with FConn.Query.DataSet do
    FieldByName('FUNCAO').AsString := Trim(FieldByName('FUNCAO').AsString);
end;

procedure TModelDAOPerfil.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
    FieldByName('COD').Value := FConn.GetNextID('TBFUNCAO', 'COD');
end;

procedure TModelDAOPerfil.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    FLAG_NAO : Text := 'Inativo';
    FLAG_SIM : Text := 'Ativo';
  end;
end;

{ TModelDAOPerfilPermissao }

constructor TModelDAOPerfilPermissao.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('SYS_FUNCAO_PERMISSAO')
      .AliasTableName('p')
      .KeyFields('sistema;funcao;rotina')
      .AutoIncFields(EmptyStr)
      .GeneratorName(EmptyStr)
      .SQL
        .Clear
        .Add('Select   ')
        .Add('    p.sistema')
        .Add('  , p.funcao ')
        .Add('  , p.rotina ')
        .Add('  , p.acesso ')
        .Add('from SYS_FUNCAO_PERMISSAO p ')
        .Add('where (p.sistema = :sistema)')
        .Add('  and (p.funcao  = :perfil) ')
        .Add('order by    ')
        .Add('    p.rotina')
      .&End
    .ParamByName('sistema', -1)
    .ParamByName('perfil', -1)
    .Open;
end;

destructor TModelDAOPerfilPermissao.Destroy;
begin
  inherited;
end;

class function TModelDAOPerfilPermissao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOPerfilLiberado }

constructor TModelDAOPerfilLiberado.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    f.cod   ')
        .Add('  , f.funcao')
        .Add('from TBFUNCAO f')
        .Add('where f.cod not in (:perfil1, :perfil2)')
        .Add('order by ')
        .Add('    f.cod')
      .&End
      .ParamByName('perfil1', -1)
      .ParamByName('perfil2', -1)
    .Open;
end;

function TModelDAOPerfilLiberado.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

destructor TModelDAOPerfilLiberado.Destroy;
begin
  inherited;
end;

class function TModelDAOPerfilLiberado.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOTipoDescontoView }

constructor TModelDAOTipoDescontoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.codigo')
        .Add('  , t.descricao')
        .Add('from VW_TIPO_ALTERA_VALOR_VENDA t')
      .&End
    .Open;
end;

function TModelDAOTipoDescontoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

destructor TModelDAOTipoDescontoView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoDescontoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
