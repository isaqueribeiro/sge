unit SGE.Controller.Config;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerConfigSystem = class(TController, IControllerConfigSystem)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerConfigSystem;

      procedure SetNumeroNSUPesquisado(const aEmpresa : String; aNSU : String);

      function GetNumeroNSUPesquisado(const aEmpresa : String) : String;
      function GetNumeroNSU(const aEmpresa : String) : Largeint;
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
