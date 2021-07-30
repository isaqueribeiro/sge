unit SGE.Controller.FormaPagto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerFormaPagto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table Detail
  TControllerFormaPagtoContaCorrente = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerFormaPagtoNFCEView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerFormaPagto }

constructor TControllerFormaPagto.Create;
begin
  inherited Create(TModelDAOFactory.New.FormaPagto);
end;

destructor TControllerFormaPagto.Destroy;
begin
  inherited;
end;

class function TControllerFormaPagto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerFormaPagtoContaCorrente }

constructor TControllerFormaPagtoContaCorrente.Create;
begin
  inherited Create(TModelDAOFactory.New.FormaPagtoContaCorrente);
end;

destructor TControllerFormaPagtoContaCorrente.Destroy;
begin
  inherited;
end;

class function TControllerFormaPagtoContaCorrente.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerFormaPagtoNFCEView }

constructor TControllerFormaPagtoNFCEView.Create;
begin
  inherited Create(TModelDAOFactory.New.FormaPagtoNFCEView);
end;

destructor TControllerFormaPagtoNFCEView.Destroy;
begin
  inherited;
end;

class function TControllerFormaPagtoNFCEView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
