unit SGE.Controller.Banco;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerBanco = class(TController, IControllerBanco)
    private
      FBusca : IModelDAO;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerBanco;

      function GetBancoBoletoCodigo(aEmpresa, aCodigoFebraBan : String) : Integer;
  end;

implementation

uses
  System.SysUtils,
  Controller.Factory;

{ TControllerBanco }

constructor TControllerBanco.Create;
begin
  inherited Create(TModelDAOFactory.New.Banco);
end;

destructor TControllerBanco.Destroy;
begin
  inherited;
end;

class function TControllerBanco.New: IControllerBanco;
begin
  Result := Self.Create;
end;

function TControllerBanco.GetBancoBoletoCodigo(aEmpresa, aCodigoFebraBan: String): Integer;
var
  aRetorno : Integer;
begin
  aRetorno := 0;
  try
    if not Assigned(FBusca) then
      FBusca := TModelDAOFactory.New.Busca;

    FBusca
      .Close
      .Clear
      .SQL('Select')
      .SQL('  b.bco_codigo')
      .SQL('from TBBANCO_BOLETO b')
      .SQL('where (b.empresa = :empresa)')
      .SQL('  and (b.bco_cod = :banco)')
      .ParamsByName('empresa', aEmpresa.Trim)
      .ParamsByName('banco', aCodigoFebraBan.Trim)
      .Open;

    aRetorno := FBusca.DataSet.FieldByName('bco_codigo').AsInteger;

    FBusca.Close;
  finally
    Result := aRetorno;
  end;
end;

end.
