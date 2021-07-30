unit SGE.Controller.CondicaoPagto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerCondicaoPagto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table Detail
  TControllerCondicaoPagtoForma = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerCondicaoPagtoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCondicaoPagto }

constructor TControllerCondicaoPagto.Create;
begin
  inherited Create(TModelDAOFactory.New.CondicaoPagto);
end;

destructor TControllerCondicaoPagto.Destroy;
begin
  inherited;
end;

class function TControllerCondicaoPagto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCondicaoPagtoForma }

constructor TControllerCondicaoPagtoForma.Create;
begin
  inherited Create(TModelDAOFactory.New.CondicaoPagtoForma);
end;

destructor TControllerCondicaoPagtoForma.Destroy;
begin
  inherited;
end;

class function TControllerCondicaoPagtoForma.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCondicaoPagtoView }

constructor TControllerCondicaoPagtoView.Create;
begin
  inherited Create(TModelDAOFactory.New.CondicaoPagtoView);
end;

destructor TControllerCondicaoPagtoView.Destroy;
begin
  inherited;
end;

class function TControllerCondicaoPagtoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
