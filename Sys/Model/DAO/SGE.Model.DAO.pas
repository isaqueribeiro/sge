unit SGE.Model.DAO;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.Connection.Factory,
  SGE.Model.DAO.Interfaces;

type
  TModelDAO = class(TInterfacedObject, IModelDAO)
    private
    protected
      FConn : IConnection;
      constructor Create;
    public
      destructor Destroy; override;

      function DataSet : TDataSet;
      function SelectSQL : String;

      procedure ApplyUpdates;
      procedure CommitUpdates;
      procedure RefreshRecord;

      procedure StartTransaction;
      procedure CommitTransaction;
      procedure RollbackTransaction;
  end;

implementation

{ TModelDAO }

procedure TModelDAO.ApplyUpdates;
begin
  FConn.Query.ApplyUpdates;
end;

procedure TModelDAO.CommitTransaction;
begin
  FConn.Query.CommitTransaction;
end;

procedure TModelDAO.CommitUpdates;
begin
  FConn.Query.CommitUpdates;
end;

constructor TModelDAO.Create;
begin
  FConn := TConnectionFactory.New;
end;

function TModelDAO.DataSet: TDataSet;
begin
  Result := FConn.Query.DataSet;
end;

destructor TModelDAO.Destroy;
begin
  inherited;
end;

procedure TModelDAO.RefreshRecord;
begin
  FConn.Query.RefreshRecord;
end;

procedure TModelDAO.RollbackTransaction;
begin
  FConn.Query.RollbackTransaction;
end;

function TModelDAO.SelectSQL: String;
begin
  Result := FConn.Query.SQL.Text;
end;

procedure TModelDAO.StartTransaction;
begin
  FConn.Query.StartTransaction;
end;

end.
