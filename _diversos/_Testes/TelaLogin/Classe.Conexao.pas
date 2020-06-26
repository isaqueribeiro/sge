unit Classe.Conexao;

interface

Uses
  SYstem.SYsUtils, System.IniFiles, Interacao.Conexao,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB;

type
  TConexao = class(TInterfacedObject, IConexao)
    strict private
      class var _instancia : IConexao;
    private
      FConn  : TFDConnection;
      FTrans : TFDTransaction;
      FFileConexao : TFileName;
    protected
      constructor Create;
      destructor Destroy; override;
    public
      function Configuracao(const aFileName : TFileName) : IConexao;

      function Connection(const Value : TFDConnection) : IConexao; overload;
      function Connection : TFDConnection; overload;

      function Transaction(const Value : TFDTransaction) : IConexao; overload;
      function Transaction : TFDTransaction; overload;

      class function GetInstance() : IConexao;
  end;

implementation

{ TConexao }

function TConexao.Configuracao(const aFileName: TFileName): IConexao;
begin
  Result := Self;
  FFileConexao := aFileName;
end;

function TConexao.Connection(const Value: TFDConnection): IConexao;
begin
  Result := Self;
  FConn  := Value;
end;

function TConexao.Connection: TFDConnection;
begin
  Result := FConn;
end;

constructor TConexao.Create;
begin
  inherited Create;
end;

destructor TConexao.Destroy;
begin
  FConn.DisposeOf;
  FTrans.DisposeOf;
  inherited;
end;

function TConexao.Transaction: TFDTransaction;
begin
  Result := FTrans;
end;

function TConexao.Transaction(const Value: TFDTransaction): IConexao;
begin
  Result := Self;
  FTrans := Value;
end;

class function TConexao.GetInstance() : IConexao;
begin
  if not Assigned(_instancia) then
    _instancia := TConexao.Create();

  Result := _instancia;
end;

end.
