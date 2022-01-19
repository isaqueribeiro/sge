unit SGE.Model.DAO.Licenca;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOLicencaSystem = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOLicencaSystem }

constructor TModelDAOLicencaSystem.Create;
begin
  inherited Create;

  if Assigned(FConn.Query) then
  begin
    FConn
      .Query
        .TableName('SYS_LICENCA')
        .KeyFields('linha_controle')
        .AliasTableName('a')
        .SQL
          .Clear
          .Add('Select')
          .Add('  a.linha_controle ')
          .Add('from SYS_LICENCA a')
        .&End;
  end;
end;

destructor TModelDAOLicencaSystem.Destroy;
begin
  inherited;
end;

class function TModelDAOLicencaSystem.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
