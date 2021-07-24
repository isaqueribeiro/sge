unit SGE.Model.DAO.Factory;

interface

uses
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.UF,
  SGE.Model.DAO.Cidade,
  SGE.Model.DAO.Distrito,
  SGE.Model.DAO.Bairro,
  SGE.Model.DAO.TipoLogradouro,
  SGE.Model.DAO.Logradouro;

type
  TModelDAOFactory = class(TInterfacedObject, IModelDAOFactory)
    private
      FUF       ,
      FCidade   ,
      FDistrito ,
      FBairro   ,
      FTipoLogradouro,
      FLogradouro    : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOFactory;

      function UF       : IModelDAOCustom;
      function Cidade   : IModelDAOCustom;
      function Distrito : IModelDAOCustom;
      function Bairro   : IModelDAOCustom;
      function TipoLogradouro : IModelDAOCustom;
      function Logradouro : IModelDAOCustom;
  end;

implementation

{ TModelDAOFactory }

constructor TModelDAOFactory.Create;
begin
  ;
end;

destructor TModelDAOFactory.Destroy;
begin
  inherited;
end;

class function TModelDAOFactory.New: IModelDAOFactory;
begin
  Result := Self.Create;
end;

function TModelDAOFactory.TipoLogradouro: IModelDAOCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TModelDAOTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TModelDAOFactory.Bairro: IModelDAOCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TModelDAOBairro.New;

  Result := FBairro;
end;

function TModelDAOFactory.Cidade: IModelDAOCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TModelDAOCidade.New;

  Result := FCidade;
end;

function TModelDAOFactory.Distrito: IModelDAOCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TModelDAODistrito.New;

  Result := FDistrito;
end;

function TModelDAOFactory.Logradouro: IModelDAOCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TModelDAOLogradouro.New;

  Result := FLogradouro;
end;

function TModelDAOFactory.UF: IModelDAOCustom;
begin
  if not Assigned(FUF) then
    FUF := TModelDAOUF.New;

  Result := FUF;
end;

end.
