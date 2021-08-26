unit SGE.Controller.IBPT;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerIBPT = class(TController, IControllerIBPT)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerIBPT;

      function GetTabelaIBPTCodigo(aCodigoNCM : String) : Integer;
  end;

  TControllerTabelaIBPT = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  TControllerNivelIBPT = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

uses
  System.SysUtils;

{ TControllerIBPT }

constructor TControllerIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.IBPT);
end;

destructor TControllerIBPT.Destroy;
begin
  inherited;
end;

function TControllerIBPT.GetTabelaIBPTCodigo(aCodigoNCM: String): Integer;
begin
  Result := 0;
  try
    if FDAO.DataSet.Active then
      FDAO.DataSet.Close;

    FDAO.ClearWhere;
    FDAO
      .Where('t.ativo    = 1')
      .Where('t.ncm_ibpt = ' + aCodigoNCM.QuotedString)
      .Open;

    Result := FDAO.DataSet.FieldByName('id_ibpt').AsInteger;
  finally
    FDAO.DataSet.Close;
  end;
end;

class function TControllerIBPT.New: IControllerIBPT;
begin
  Result := Self.Create;
end;

{ TControllerTabelaIBPT }

constructor TControllerTabelaIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.TabelaIBPT);
end;

destructor TControllerTabelaIBPT.Destroy;
begin
  inherited;
end;

class function TControllerTabelaIBPT.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerNivelIBPT }

constructor TControllerNivelIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.NivelIBPT);
end;

destructor TControllerNivelIBPT.Destroy;
begin
  inherited;
end;

class function TControllerNivelIBPT.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
