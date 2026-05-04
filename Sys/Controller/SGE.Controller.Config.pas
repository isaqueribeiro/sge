unit SGE.Controller.Config;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  Data.DB,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerConfigSystem = class(TController, IControllerConfigSystem)
    private
      const
        KEY_NOVA_REFORMA_TRIBUTARIA_2026 = 'nrt_2026_producao';
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerConfigSystem;

      procedure SetNumeroNSUPesquisado(const aEmpresa : String; aNSU : String);

      function GetNumeroNSUPesquisado(const aEmpresa : String) : String;
      function GetNumeroNSU(const aEmpresa : String) : Largeint;
      function ReformaTributaria(const aAtivar : Boolean) : Boolean;
      function ReformaTributariaEmProducao : Boolean;
  end;

implementation

{ TControllerConfigSystem }

uses
  Service.Utils;

constructor TControllerConfigSystem.Create;
begin
  inherited Create(TModelDAOFactory.New.ConfigSystem);
end;

destructor TControllerConfigSystem.Destroy;
begin
  inherited;
end;

function TControllerConfigSystem.GetNumeroNSU(const aEmpresa: String): Largeint;
var
  IDAO : IModelDAOCustom;
  aNumero : Largeint;
begin
  IDAO := TModelDAOFactory.New.Busca;
  aNumero := 0;
  try
    IDAO
      .Close
      .Clear;

    IDAO
      .SQL('Select')
      .SQL('    min(substring(nsu from 2 for 14)) as nsu_min')
      .SQL('from TBNFE_IMPORTADA')
      .SQL('where (empresa = ' + QuotedStr(aEmpresa.Trim) + ')');

    aNumero := StrToInt64Def(IDAO.DataSet.FieldByName('nsu_min').AsString, 2) - 1;

    if (aNumero = 0) then
    begin
      IDAO
        .Close
        .Clear;

      IDAO
        .SQL('Select')
        .SQL('    max(substring(nsu from 2 for 14)) as nsu_max')
        .SQL('from TBNFE_IMPORTADA')
        .SQL('where (empresa = ' + QuotedStr(aEmpresa.Trim) + ')');

      aNumero := StrToInt64Def(IDAO.DataSet.FieldByName('nsu_max').AsString, 2) + 1;
    end;
  finally
    Result := aNumero;
  end;
end;

function TControllerConfigSystem.GetNumeroNSUPesquisado(const aEmpresa: String): String;
var
  aKey   ,
  aValue : String;
const
  VALUE_NULL = '000000000000000';
begin
  aKey := 'nsu_pesquisado_' + TServicesUtils.StrOnlyNumbers(aEmpresa.Trim);
  aValue := VALUE_NULL;
  try
    FDAO
      .Close
      .ClearWhere;

    FDAO
      .Close
      .Where('c.ky_config = :ky_config')
      .ParamsByName('ky_config', aKey.ToUpper)
      .Open;

    aValue := FDAO.DataSet.FieldByName('vl_config').AsString;

    if aValue.Trim.IsEmpty then
      aValue := VALUE_NULL;
  finally
    Result := aValue;
  end;
end;

class function TControllerConfigSystem.New: IControllerConfigSystem;
begin
  Result := Self.Create;
end;

function TControllerConfigSystem.ReformaTributaria(const aAtivar : Boolean): Boolean;
var
  aKey   ,
  aValue : String;
  aSQL : TStringList;
begin
  Result := False;

  aSQL := TStringList.Create;
  try
    try
      aKey   := KEY_NOVA_REFORMA_TRIBUTARIA_2026;
      aValue := IfThen(aAtivar, '1', '0');

      aSQL.BeginUpdate;
      aSQL.Clear;
      aSQL.Add('Update or Insert into SYS_CONFIG (');
      aSQL.Add('    ky_config');
      aSQL.Add('  , vl_config');
      aSQL.Add('  , dh_config');
      aSQL.Add(') values (    ');
      aSQL.Add('    ' + aKey.ToUpper.QuotedString );
      aSQL.Add('  , ' + aValue.QuotedString);
      aSQL.Add('  , current_timestamp  ');
      aSQL.Add(') matching (ky_config) ');
      aSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aSQL.Text);

      Result := True;
    except
      On E : Exception do
        raise Exception.Create('ReformaTributaria() --> ' + E.Message);
    end;
  finally
    aSQL.DisposeOf;
  end;
end;

function TControllerConfigSystem.ReformaTributariaEmProducao: Boolean;
var
  aKey   ,
  aValue : String;
const
  VALUE_NULL = '0';
begin
  aKey   := KEY_NOVA_REFORMA_TRIBUTARIA_2026;
  aValue := VALUE_NULL;
  try
    FDAO
      .Close
      .ClearWhere;

    FDAO
      .Close
      .Where('c.ky_config = :ky_config')
      .ParamsByName('ky_config', aKey.ToUpper)
      .Open;

    aValue := FDAO.DataSet.FieldByName('vl_config').AsString;

    if aValue.Trim.IsEmpty then
      aValue := VALUE_NULL;
  finally
    Result := (StrToIntDef(aValue.Trim, 0) = 1);
  end;
end;

procedure TControllerConfigSystem.SetNumeroNSUPesquisado(const aEmpresa: String; aNSU: String);
var
  aKey : String;
begin
  aKey := 'nsu_pesquisado_' + TServicesUtils.StrOnlyNumbers(aEmpresa.Trim);

  FDAO
    .Close
    .ClearWhere;

  FDAO
    .Close
    .Where('c.ky_config = :ky_config')
    .ParamsByName('ky_config', aKey.ToUpper)
    .Open;

  // Excluir valor da chave existente quando o valor passado for vazio
  if aNSU.Trim.IsEmpty and (not FDAO.DataSet.IsEmpty) then
    FDAO.DataSet.Delete
  else
  begin
    if FDAO.DataSet.IsEmpty then
    begin
      // Adicionar valor da chave
      FDAO.DataSet.Append;
      FDAO.DataSet.FieldByName('ky_config').AsString := aKey;
    end
    else
      // Editar valor da chave
      FDAO.DataSet.Edit;

    FDAO.DataSet.FieldByName('vl_config').AsString   := aNSU.Trim;
    FDAO.DataSet.FieldByName('dh_config').AsDateTime := Now;
    FDAO.DataSet.Post;
  end;

  FDAO.ApplyUpdates;
  FDAO.CommitUpdates;
end;

end.
