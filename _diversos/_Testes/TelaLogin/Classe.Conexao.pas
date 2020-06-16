unit Classe.Conexao;

interface

Uses
  SYstem.SYsUtils, Firedac.Comp.Client, Firedac.DApt;

type
  TConexao = class
    strict private
      class var _instancia : TConexao;
    private
      FConn : TFDConnection;
      FTrans: TFDTransaction;
      procedure SetConn(const Value: TFDConnection);
      procedure SetTrans(const Value: TFDTransaction);
    protected
      constructor Create();
      destructor Destroy();
    public
      property Conn  : TFDConnection read FConn write SetConn;
      property Trans : TFDTransaction read FTrans write SetTrans;

      class function Instance() : TConexao;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  inherited Create;
  FConn  := TFDConnection.Create(nil);
  FTrans := TFDTransaction.Create(FConn);

  FConn.Transaction       := FTrans;
  FConn.UpdateTransaction := FTrans;

  FTrans.Connection := FConn;
end;

destructor TConexao.Destroy;
begin
  FConn.DisposeOf;
  FTrans.DisposeOf;
  inherited Destroy;
end;

class function TConexao.Instance: TConexao;
begin
  if not Assigned(_instancia) then
    _instancia := TConexao.Create();

  Result := _instancia;
end;

procedure TConexao.SetConn(const Value: TFDConnection);
begin
  FConn := Value;
end;

procedure TConexao.SetTrans(const Value: TFDTransaction);
begin
  FTrans := Value;
end;

end.
