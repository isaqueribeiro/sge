unit SGE.Controller.Bairro;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerBairro = class(TController, IControllerBairro)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerBairro;

      function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  end;

implementation

{ TControllerBairro }

constructor TControllerBairro.Create;
begin
  inherited Create(TModelDAOFactory.New.Bairro);
end;

destructor TControllerBairro.Destroy;
begin
  inherited;
end;

class function TControllerBairro.New: IControllerBairro;
begin
  Result := Self.Create;
end;

function TControllerBairro.SetBairro(const iCidade: Integer; const sNome: String): Integer;
var
  IDAO : IModelDAOCustom;
begin
  IDAO := TModelDAOFactory.New.Busca;

  IDAO
    .Close
    .Clear
    .SQL('Select')
    .SQL('  g.cod_bairro ')
    .SQL('from SET_BAIRRO(' + QuotedStr(sNome.Trim.ToUpper) + ', ' + IntToStr(iCidade) + ', null) g')
    .Open;

  Result := IDAO.DataSet.FieldByName('cod_bairro').AsInteger;

  IDAO.CommitTransaction;
end;

end.
