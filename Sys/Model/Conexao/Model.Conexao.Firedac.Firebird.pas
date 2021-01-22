unit Model.Conexao.Firedac.Firebird;

interface

uses
  Model.Conexao.Firedac, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Option,
  FireDAC.Phys.FB, Model.Conexao.Interfaces;

type
  TModelConexaoFiredacFireBird = class(TModelConexaoFiredac)
    private
      FDriverLink : TFDPhysFBDriverLink;
    protected
      constructor Create;
      procedure Configuracao; override;
    public
      destructor Destroy; override;

      class function New : IModelConexao;
  end;

implementation

{ TModelConexaoFiredacFireBird }

procedure TModelConexaoFiredacFireBird.Configuracao;
begin
  inherited;
  ;
end;

constructor TModelConexaoFiredacFireBird.Create;
var
  aTransacao : TFDTransaction;
begin
  inherited;
  FDriverLink := TFDPhysFBDriverLink.Create(nil);
  aTransacao  := TFDTransaction.Create(nil);

  with aTransacao, Options do
  begin
    Connection := TFDConnection(Conexao);
    AutoCommit := True;
    AutoStart  := True;
    AutoStop   := True;
    Isolation  := TFDTxIsolation.xiReadCommitted;
  end;

  Transacao( TComponent(aTransacao) );

  TFDConnection(Conexao).Transaction := TFDTransaction(Self.Transacao);
end;

destructor TModelConexaoFiredacFireBird.Destroy;
begin
  FDriverLink.DisposeOf;
  inherited;
end;

class function TModelConexaoFiredacFireBird.New: IModelConexao;
begin
  Result := Self.Create;
end;

end.
