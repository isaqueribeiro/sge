unit SGE.Model.DAO.IBPT;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOIBPT = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  TModelDAOTabelaIBPT = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  TModelDAONivelIBPT = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

(*
  Tabelas:
  - SYS_IBPT

  Views:

  Procedures:

*)

implementation

{ TModelDAOIBPT }

constructor TModelDAOIBPT.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('SYS_IBPT')
      .KeyFields('id_ibpt')
      .AutoIncFields('id_ibpt')
      .GeneratorName('GEN_IBPT_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.id_ibpt ')
        .Add('  , t.ncm_ibpt')
        .Add('  , t.ex_ibpt ')
        .Add('  , t.tabela_ibpt')
        .Add('  , t.descricao_ibpt   ')
        .Add('  , t.aliqnacional_ibpt')
        .Add('  , t.aliqinternacional_ibpt')
        .Add('  , t.aliqestadual_ibpt ')
        .Add('  , t.aliqmunicipal_ibpt')
        .Add('  , t.ativo    ')
        .Add('  , case when char_length(t.descricao_ibpt) > 100 ')
        .Add('      then cast(substring(t.descricao_ibpt from 1 for 100) as varchar(120)) || ''...'' ')
        .Add('      else cast(t.descricao_ibpt as varchar(120)) ')
        .Add('    end as descricao ')
        .Add('from SYS_IBPT t')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord  := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost   := DataSetBeforePost;
end;

function TModelDAOIBPT.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

procedure TModelDAOIBPT.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if FieldByName('ATIVO').IsNull then
      FieldByName('ATIVO').AsInteger := 1;
  end;
end;

procedure TModelDAOIBPT.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EX_IBPT').AsString := '0';
    FieldByName('ALIQNACIONAL_IBPT').AsCurrency      := 0.0;
    FieldByName('ALIQINTERNACIONAL_IBPT').AsCurrency := 0.0;
    FieldByName('ALIQESTADUAL_IBPT').AsCurrency      := 0.0;
    FieldByName('ALIQMUNICIPAL_IBPT').AsCurrency     := 0.0;
    FieldByName('ATIVO').AsInteger                   := 1;
    FieldByName('TABELA_IBPT').Clear;
    FieldByName('DESCRICAO_IBPT').Clear;
  end;
end;

destructor TModelDAOIBPT.Destroy;
begin
  inherited;
end;

class function TModelDAOIBPT.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOTabelaIBPT }

constructor TModelDAOTabelaIBPT.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select ''0'' as Codigo , ''Materiais/Produtos'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''1'' as Codigo , ''Serviços de Engenharia/Construção'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''2'' as Codigo , ''Serviços Gerais'' as Descricao from RDB$DATABASE')
      .&End
      .Open;
end;

destructor TModelDAOTabelaIBPT.Destroy;
begin
  inherited;
end;

class function TModelDAOTabelaIBPT.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTabelaIBPT.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

{ TModelDAONivelIBPT }

constructor TModelDAONivelIBPT.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select ''0'' as Codigo , ''Exceção 0'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''1'' as Codigo , ''Exceção 1'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''2'' as Codigo , ''Exceção 2'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''3'' as Codigo , ''Exceção 3'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''4'' as Codigo , ''Exceção 4'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''5'' as Codigo , ''Exceção 5'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''6'' as Codigo , ''Exceção 6'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''7'' as Codigo , ''Exceção 7'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''8'' as Codigo , ''Exceção 8'' as Descricao from RDB$DATABASE Union')
        .Add('Select ''9'' as Codigo , ''Exceção 9'' as Descricao from RDB$DATABASE      ')
      .&End
      .Open;
end;

destructor TModelDAONivelIBPT.Destroy;
begin
  inherited;
end;

class function TModelDAONivelIBPT.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAONivelIBPT.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

end.
