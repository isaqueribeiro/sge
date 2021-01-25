unit Model.Conexao.Firedac;

interface

uses
  Model.Conexao.Interfaces, FireDAC.Comp.Client, Data.DB,
  System.IniFiles, System.Classes, System.SysUtils;

type
  TModelConexaoFiredac = class (TInterfacedObject, IModelConexao)
    private
      [weak]
      FConfiguracoes : TIniFile;
      FConexao   : TFDConnection;
      FTransacao : TComponent;
    protected
      constructor Create;
      procedure Configuracao; virtual;
    public
      destructor Destroy; override;

      function Configurar(AConfiguracoes : TIniFile) : IModelConexao;
      function Configuracoes : TIniFile;
      function Conexao : TCustomConnection;
      function Transacao(Value : TComponent) : IModelConexao; overload;
      function Transacao : TComponent; overload;

      class function New : IModelConexao;
  end;

implementation

{ TModelConexaoFiredac }

procedure TModelConexaoFiredac.Configuracao;
begin
  ;
end;

function TModelConexaoFiredac.Configuracoes: TIniFile;
begin
  Result := FConfiguracoes;
end;

function TModelConexaoFiredac.Configurar(AConfiguracoes: TIniFile): IModelConexao;
begin
  Result := Self;
  FConfiguracoes := AConfiguracoes;
  Configuracao;
end;

function TModelConexaoFiredac.Conexao: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao   := TFDConnection.Create(nil);
  FTransacao := TComponent.Create(nil);
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FConfiguracoes.DisposeOf;
  FConexao.DisposeOf;
  FTransacao.DisposeOf;
  inherited;
end;

class function TModelConexaoFiredac.New: IModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredac.Transacao: TComponent;
begin
  Result := FTransacao;
end;

function TModelConexaoFiredac.Transacao(Value: TComponent): IModelConexao;
begin
  Result := Self;
  FTransacao := Value;
end;

end.
