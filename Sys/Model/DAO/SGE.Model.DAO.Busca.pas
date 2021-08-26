unit SGE.Model.DAO.Busca;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOBusca = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

{ TModelDAOBusca }

constructor TModelDAOBusca.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    current_date as data')
        .Add('  , current_time as hora')
        .Add('  , current_timestamp as data_hora')
        .Add('  , current_user      as usuario  ')
        .Add('from RDB$DATABASE')
      .&End
    .Open;
end;

destructor TModelDAOBusca.Destroy;
begin
  inherited;
end;

class function TModelDAOBusca.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOBusca.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
end;

end.
