unit SGE.Controller.Factory;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.UF,
  SGE.Controller.Cidade,
  SGE.Controller.Distrito,
  SGE.Controller.Bairro,
  SGE.Controller.TipoLogradouro,
  SGE.Controller.Logradouro;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    private
      FUF       ,
      FCidade   ,
      FDistrito ,
      FBairro   ,
      FTipoLogradouro,
      FLogradouro    : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function UF : IControllerCustom;
      function Cidade   : IControllerCustom;
      function Distrito : IControllerCustom;
      function Bairro   : IControllerCustom;
      function TipoLogradouro : IControllerCustom;
      function Logradouro : IControllerCustom;
  end;

implementation

{ TControllerFactory }

function TControllerFactory.Bairro: IControllerCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;

  Result := FBairro;
end;

function TControllerFactory.Cidade: IControllerCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TControllerCidade.New;

  Result := FCidade;
end;

constructor TControllerFactory.Create;
begin
  ;
end;

destructor TControllerFactory.Destroy;
begin
  inherited;
end;

function TControllerFactory.Distrito: IControllerCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TControllerDistrito.New;

  Result := FDistrito;
end;

function TControllerFactory.Logradouro: IControllerCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TControllerLogradouro.New;

  Result := FLogradouro;
end;

class function TControllerFactory.New: IControllerFactory;
begin
  Result := Self.Create;
end;

function TControllerFactory.TipoLogradouro: IControllerCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TControllerTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TControllerFactory.UF: IControllerCustom;
begin
  if not Assigned(FUF) then
    FUF := TControllerUF.New;

  Result := FUF;
end;

end.
