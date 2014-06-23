unit fDataSetLayout;

interface

uses
  fdb,
  ftext,
  dao_util,

  Classes, SysUtils, Controls, StrUtils, Dialogs, DB, DBClient,
  Variants, cUtils, cStrings, cDataStructs, fBaseObject;

type
  TDataSetLayout = class(TClientDataSet)
  private
    FTableName   ,
    FPrimaryKey  ,
    FUniqueKey   ,
    FDirectoryFR ,
    FFileNameFR  ,
    FDescricao   : String;
    FID : String;
    FCreateTable : TStringList;

    DataSetLayoutID          : TStringField;
    DataSetLayoutFileName    : TStringField;
    DataSetLayoutDescription : TStringField;
    DataSetLayoutFRLayout    : TBlobField;
    DataSetLayoutGRLayout    : TBlobField;
  protected
    procedure NewRecord(DataSet: TDataSet);
    procedure PostRecord(DataSet: TDataSet);

    procedure SetFileNameFR(Value : String);
    procedure SetDescricao(Value : String);

    function GetID : String;
    function GetFileNameFR : String;
    function GetDescricao : String;
  public
    constructor Create(AOwner: TComponent; const sDirectory, sDescricao : String); overload;
    destructor Destroy; override;

    property TableName   : String read FTableName;
    property PrimaryKey  : String read FPrimaryKey;
    property UniqueKey   : String read FUniqueKey;
    property DirectoryFR : String read FDirectoryFR write FDirectoryFR;
    property FileNameFR  : String read GetFileNameFR write SetFileNameFR;
    property Descricao   : String read GetDescricao  write SetDescricao;
    property ID : String read GetID;

    procedure Load;
    procedure Save;
  end;

implementation

{ TDataSetLayout }

constructor TDataSetLayout.Create(AOwner: TComponent; const sDirectory, sDescricao : String);
const
  FILENAME_GUID = '{69AD228D-7CB2-44B3-B391-135B9F5AC08C}';
begin
  try
    FTableName  := 'SYS_LAYOUT_RELATORIO';
    FPrimaryKey := 'IDLAYOUT';
    FUniqueKey  := 'NMLAYOUT';

    FDirectoryFR := sDirectory;
    FDescricao   := sDescricao;
    FFileNameFR  := FILENAME_GUID;
    FID          := FILENAME_GUID;

    inherited Create(AOwner);

    // (INICIO) Construir campos de controle

    Self.FieldDefs.Clear;
    Self.FieldDefs.BeginUpdate;
    Self.FieldDefs.Add(PrimaryKey, ftString, 38);
    Self.FieldDefs.Add(UniqueKey,  ftString, 250);
    Self.FieldDefs.Add('DSLAYOUT', ftString, 250);
    Self.FieldDefs.Add('FRLAYOUT', ftBlob);
    Self.FieldDefs.Add('GRLAYOUT', ftBlob);
    Self.FieldDefs.EndUpdate;

    Self.CreateDataSet;
    Self.Close;

    DataSetLayoutID := TGuidField.Create(Self);
    DataSetLayoutID.FieldName     := PrimaryKey;
    DataSetLayoutID.Size          := 38;
    DataSetLayoutID.ProviderFlags := [pfInUpdate, pfInWhere, pfInKey];
    DataSetLayoutID.DataSet       := Self;

    DataSetLayoutFileName := TStringField.Create(Self);
    DataSetLayoutFileName.FieldName     := UniqueKey;
    DataSetLayoutFileName.Size          := 250;
    DataSetLayoutFileName.ProviderFlags := [pfInUpdate];
    DataSetLayoutFileName.DataSet       := Self;

    DataSetLayoutDescription := TStringField.Create(Self);
    DataSetLayoutDescription.FieldName     := 'DSLAYOUT';
    DataSetLayoutDescription.Size          := 250;
    DataSetLayoutDescription.ProviderFlags := [pfInUpdate];
    DataSetLayoutDescription.DataSet       := Self;

    DataSetLayoutFRLayout := TBlobField.Create(Self);
    DataSetLayoutFRLayout.FieldName     := 'FRLAYOUT';
    DataSetLayoutFRLayout.ProviderFlags := [pfInUpdate];
    DataSetLayoutFRLayout.DataSet       := Self;

    DataSetLayoutGRLayout := TBlobField.Create(Self);
    DataSetLayoutGRLayout.FieldName     := 'GRLAYOUT';
    DataSetLayoutGRLayout.ProviderFlags := [pfInUpdate];
    DataSetLayoutGRLayout.DataSet       := Self;

    // (FINAL) Construir campos de controle

    FCreateTable := TStringList.Create;

    with FCreateTable do
    begin
      BeginUpdate;
      Add('CREATE TABLE ' + TableName + ' (');
      Add('  ' + FPrimaryKey + ' UNIQUEIDENTIFIER CONSTRAINT DF_' + TableName + '_ID DEFAULT newid() NOT NULL,');
      Add('  ' + FUniqueKey  + ' VARCHAR(250) NOT NULL,');
      Add('  DSLAYOUT VARCHAR(250),');
      Add('  FRLAYOUT VARBINARY(MAX),');
      Add('  GRLAYOUT VARBINARY(MAX),');
      Add('  CONSTRAINT PK_' + TableName + ' PRIMARY KEY (' + FPrimaryKey + '),');
      Add('  CONSTRAINT UQ_' + TableName + ' UNIQUE (' + FUniqueKey + ')');
      Add(')');
      EndUpdate;

      if not kExistTable(TableName) then
        if not kExecSQL(FCreateTable.Text) then
          raise Exception.Create(kGetErrorLastSQL);

      kSetDescriptionField('Código (PK)',              TableName, FPrimaryKey);
      kSetDescriptionField('Nome do Arquivo (UQ)',     TableName, FUniqueKey);
      kSetDescriptionField('Descrição do Arquivo FR3', TableName, 'DSLAYOUT');
      kSetDescriptionField('Layout do Arquivo FR3 (.xml)',               TableName, 'FRLAYOUT');
      kSetDescriptionField('Arquivo de Configurações do Gráfico (.ini)', TableName, 'GRLAYOUT');
    end;

    Self.OnNewRecord := Self.NewRecord;
    Self.BeforePost  := Self.PostRecord;
  except
    On E : Exception do
      kErro('Erro ao tentar criar a tabela repositório para referência de layouts de relatórios.' + #13#13 + E.Message, Self.UnitName, 'Create()');
  end;
end;

destructor TDataSetLayout.Destroy;
begin

  inherited;
end;

function TDataSetLayout.GetDescricao: String;
begin
  if ( DataSetLayoutDescription = nil ) then
    Result := FDescricao
  else
  if ( DataSetLayoutDescription.IsNull ) then
    Result := FDescricao
  else
    Result := DataSetLayoutDescription.AsString;
end;

function TDataSetLayout.GetFileNameFR: String;
begin
  if ( DataSetLayoutFileName = nil ) then
    Result := FFileNameFR
  else
  if ( DataSetLayoutFileName.IsNull ) then
    Result := FFileNameFR
  else
    Result := DataSetLayoutFileName.AsString;
end;

function TDataSetLayout.GetID: String;
begin
  if ( DataSetLayoutID = nil ) then
    Result := FID
  else
  if ( DataSetLayoutID.IsNull ) then
    Result := FID
  else
    Result := DataSetLayoutID.AsString;
end;

procedure TDataSetLayout.Load;
begin
  try

    if Self.Active then
      if Self.State in [dsEdit, dsInsert] then
        Self.Cancel;

    kOpenTable(Self, TableName, UniqueKey + ' = ' + QuotedStr(FileNameFR));

    if Self.IsEmpty then
      Self.Append
    else
    begin
      FID         := Self.FieldByName(PrimaryKey).AsString;
      FFileNameFR := Self.FieldByName(FUniqueKey).AsString;

      if not DataSetLayoutFRLayout.IsNull then
        DataSetLayoutFRLayout.SaveToFile( StringReplace(DirectoryFR + '\' + FileNameFR, '\\', '\', [rfReplaceAll]) );

      Self.Edit;
    end;

  except
    On E : Exception do
      kErro('Erro ao tentar recuperar o arquivo de layout da base.' + #13#13 + E.Message, Self.UnitName, 'Load()');
  end;
end;

procedure TDataSetLayout.NewRecord(DataSet: TDataSet);
var
  new_gui : TGUID;
begin
  CreateGUID(new_gui);

  DataSetLayoutID.AsString          := GUIDToString( new_gui );
  DataSetLayoutFileName.AsString    := FFileNameFR;
  DataSetLayoutDescription.AsString := FDescricao;
  DataSetLayoutFRLayout.Clear;
end;

procedure TDataSetLayout.PostRecord(DataSet: TDataSet);
begin
  if Self.State = dsInsert then
    kSQLInsert2(Self, TableName)
  else
  if Self.State = dsEdit then
    kSQLUpdate2(Self, TableName);
end;

procedure TDataSetLayout.Save;
var
  sFileName : String;
begin
  sFileName := StringReplace(DirectoryFR + '\' + FileNameFR, '\\', '\', [rfReplaceAll]);

  if ( Self.State in [dsEdit, dsInsert] ) then
  begin
    if FileExists( sFileName ) then
    begin
      DataSetLayoutDescription.AsString := FDescricao;
      DataSetLayoutFRLayout.LoadFromFile( sFileName );
      Self.Post;
    end
    else
      Self.Cancel;
  end;
end;

procedure TDataSetLayout.SetDescricao(Value: String);
begin
  FDescricao := Trim(Value);

  if Self.State in [dsEdit, dsInsert] then
    DataSetLayoutDescription.AsString := Trim(Value);
end;

procedure TDataSetLayout.SetFileNameFR(Value: String);
begin
  FFileNameFR := Trim(Value);

  if Self.State in [dsEdit, dsInsert] then
    DataSetLayoutFileName.AsString := Trim(Value);
end;

end.
