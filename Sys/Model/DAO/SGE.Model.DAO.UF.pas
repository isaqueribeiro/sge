unit SGE.Model.DAO.UF;

interface

uses
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOUF = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;
  end;

implementation

{ TDAOUF }

constructor TModelDAOUF.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBESTADO')
      .KeyFields('Est_cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    e.Est_cod  ')
        .Add('  , e.Est_nome ')
        .Add('  , e.Est_sigla')
        .Add('  , e.Est_siafi')
        .Add('  , e.Aliquota_icms')
        .Add('  , e.Aliquota_fcp ')
        .Add('from TBESTADO e')
      .&End;
end;

destructor TModelDAOUF.Destroy;
begin
  inherited;
end;

class function TModelDAOUF.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
