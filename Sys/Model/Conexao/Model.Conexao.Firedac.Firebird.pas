unit Model.Conexao.Firedac.Firebird;

interface

uses
  System.SysUtils,
  System.Classes,

  Model.Conexao.Firedac,
  Model.Conexao.Interfaces,

  FireDAC.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.FB;

type
  TModelConexaoFiredacFireBird = class(TModelConexaoFiredac)
    private
      FDriverLink : TFDPhysFBDriverLink;
      FTransacao  : TFDTransaction;
    protected
      constructor Create;
      procedure Configuracao; override;
    public
      destructor Destroy; override;

      class function New : IModelConexao;
  end;

implementation

uses
  Model.Constantes;

{ TModelConexaoFiredacFireBird }

procedure TModelConexaoFiredacFireBird.Configuracao;
var
  aServidor,
  aPorta   ,
  aBase    ,
  aUsuario ,
  aSenha   ,
  aCharset : String;
begin
  with Configuracoes do
  begin
    aServidor := ReadString('Conexao', 'Servidor', 'localhost');
    aPorta    := ReadString('Conexao', 'Porta',    '3050');
    aBase     := ReadString('Conexao', 'Base',     'AGIL_COMERCIO');
    aUsuario  := ReadString('Conexao', 'Usuario',  CONST_MODEL_USER_NAME);
    aSenha    := ReadString('Conexao', 'Senha',    CONST_MODEL_USER_PASSWORD);
    aCharset  := ReadString('Conexao', 'Charset',  CONST_MODEL_LC_CTYPE);

    {$IFNDEF PRINTER_CUPOM}
    if (ParamCount >= 2) then
    begin
      aServidor := ParamStr(1);
      aBase     := ParamStr(2);
    end;
    {$ENDIF}

    if Pos('/', aServidor) > 0 then
    begin
      aPorta    := Copy(aServidor, Pos('/', aServidor) + 1, Length(aServidor));
      aServidor := Copy(aServidor, 1, Pos('/', aServidor) - 1);
    end
    else
    if (aPorta = EmptyStr) then
      aPorta := '3050';
  end;

  // Conexão FireDAC
  with TFDConnection(Conexao) do
  begin
    Connected := False;

    Params.Clear;
    Params.Add('DriverID=FB');
    Params.Add('Protocol=TCPIP');
    Params.Add('Server='       + aServidor);
    Params.Add('Port='         + aPorta);
    Params.Add('Database='     + aBase);
    Params.Add('User_Name='    + aUsuario);
    Params.Add('Password='     + aSenha);
    Params.Add('CharacterSet=' + aCharset);

    Connected := True;
  end;
end;

constructor TModelConexaoFiredacFireBird.Create;
begin
  inherited;
  FDriverLink := TFDPhysFBDriverLink.Create(nil);
  FTransacao  := TFDTransaction.Create(nil);

  with FTransacao, Options do
  begin
    Connection := TFDConnection(Conexao);
    AutoCommit := True;
    AutoStart  := True;
    AutoStop   := True;
    Isolation  := TFDTxIsolation.xiReadCommitted;
  end;

  Transacao( TComponent(FTransacao) );

  TFDConnection(Conexao).Transaction := TFDTransaction(Self.Transacao);
end;

destructor TModelConexaoFiredacFireBird.Destroy;
begin
  FDriverLink.DisposeOf;
  FTransacao.DisposeOf;
  inherited;
end;

class function TModelConexaoFiredacFireBird.New: IModelConexao;
begin
  Result := Self.Create;
end;

end.
