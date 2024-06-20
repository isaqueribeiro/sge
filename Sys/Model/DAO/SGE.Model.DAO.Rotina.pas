unit SGE.Model.DAO.Rotina;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Rotinas do Sistema
  TModelDAORotina = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  TModelDAORotinaMenu = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  TModelDAORotinaSubMenu = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAORotina }

constructor TModelDAORotina.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('SYS_ROTINA')
      .AliasTableName('r')
      .KeyFields('rot_cod')
      .AutoIncFields(EmptyStr)
      .GeneratorName(EmptyStr)
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.rot_cod ')
        .Add('  , r.rot_tipo')
        .Add('  , r.rot_descricao')
        .Add('  , r.rot_cod_pai  ')
        .Add('from SYS_ROTINA r  ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAORotina.Destroy;
begin
  inherited;
end;

class function TModelDAORotina.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORotina.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
//  FConn.Query.DataSet.FieldByName('perfil').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('email').ProviderFlags  := [];
end;

procedure TModelDAORotina.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAORotina.DataSetBeforePost(DataSet: TDataSet);
var
  aSenha : String;
begin
  with FConn.Query.DataSet do
    FieldByName('ROT_DESCRICAO').AsString := Trim(FieldByName('ROT_DESCRICAO').AsString);
end;

procedure TModelDAORotina.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
    FieldByName('ROT_COD_PAI').Clear;
end;

{ TModelDAORotinaMenu }

constructor TModelDAORotinaMenu.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.rot_cod ')
        .Add('  , r.rot_tipo')
        .Add('  , r.rot_descricao')
        .Add('  , r.rot_cod_pai  ')
        .Add('from SYS_ROTINA r  ')
        .Add('  inner join SYS_SISTEMA_ROTINA s on (s.rot_cod = r.rot_cod)')
        .Add('where (s.sis_cod  = :sistema)')
        .Add('  and (r.rot_tipo = 0)       ')
        .Add('  and (r.rot_cod_pai is null)')
        .Add('order by     ')
        .Add('    r.rot_cod')
      .&End
      .ParamByName('sistema', -1)
    .Open;
end;

function TModelDAORotinaMenu.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

destructor TModelDAORotinaMenu.Destroy;
begin
  inherited;
end;

class function TModelDAORotinaMenu.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAORotinaSubMenu }

constructor TModelDAORotinaSubMenu.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.rot_cod ')
        .Add('  , r.rot_tipo')
        .Add('  , r.rot_descricao')
        .Add('  , r.rot_cod_pai  ')
        .Add('from SYS_ROTINA r  ')
        .Add('  inner join SYS_SISTEMA_ROTINA s on (s.rot_cod = r.rot_cod)')
        .Add('where (s.sis_cod = :sistema)   ')
        .Add('  and (r.rot_cod_pai = :rotina)')
        .Add('order by     ')
        .Add('    r.rot_cod')
      .&End
      .ParamByName('sistema', -1)
      .ParamByName('rotina', EmptyStr)
    .Open;
end;

destructor TModelDAORotinaSubMenu.Destroy;
begin
  inherited;
end;

class function TModelDAORotinaSubMenu.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
