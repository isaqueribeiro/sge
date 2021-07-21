unit SGE.Model.DAO.UF;

interface

uses
  SGE.Model.Connection.Factory,
  SGE.Model.Entity.UF;

type
  TDAOUF = class
    private
      FConn : IConnection;
//      FThis : TUF;
    protected
      constructor Create;
    public
      destructor Destroy; override;
  end;

implementation

{ TDAOUF }

constructor TDAOUF.Create;
begin
  FConn := TConnectionFactory.New;
  FConn
    .Query
      .TableName('TBESTADO')
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

destructor TDAOUF.Destroy;
begin
  inherited;
end;

end.
