unit AgilServerREST.Controller.Configuracao;

interface

uses
  System.SysUtils,
  System.IniFiles,
  AgilServerREST.Controller.Interfaces,
  AgilServerREST.Model.Configuracao;

type
  TControllerConfiguracao = class(TInterfacedObject, IControllerConfiguracao<TConfiguracao>)
    private
      FIni : TIniFile;
      FEntity : TConfiguracao;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerConfiguracao<TConfiguracao>;

      function Load : IControllerConfiguracao<TConfiguracao>;
      function Entity : TConfiguracao;
  end;

implementation

uses
  System.IOUtils;

{ TControllerConfiguracao }

constructor TControllerConfiguracao.Create;
begin
  FIni := TIniFile.Create(TPath.Combine(ExtractFilePath(ParamStr(0)), 'Conexao.ini'));
  FEntity := TConfiguracao.Create;
end;

destructor TControllerConfiguracao.Destroy;
begin
  FIni.DisposeOf;
  FEntity.DisposeOf;
  inherited;
end;

function TControllerConfiguracao.Entity: TConfiguracao;
begin
  Result := FEntity;
end;

function TControllerConfiguracao.Load: IControllerConfiguracao<TConfiguracao>;
begin
  Result := Self;
  FEntity
    .API
      .protocolo(FIni.ReadString ('API', 'Protocolo', 'http'))
      .porta    (FIni.ReadInteger('API', 'Porta', 8085))
      .usuario  (FIni.ReadString ('API', 'Usuario', 'admin'))
      .senha    (FIni.ReadString ('API', 'Senha', 'admin'))
      .chave    (FIni.ReadString ('API', 'Senha', 'RDWBASEKEY256'))
    .&End
    .Banco
      .servidor(FIni.ReadString ('Conexao', 'Servidor', 'localhost'))
      .porta   (FIni.ReadInteger('Conexao', 'Porta', 3050))
      .base    (FIni.ReadString ('Conexao', 'Base', 'agil_softwares'))
      .usuario (FIni.ReadString ('Conexao', 'Usuario', 'admin'))
      .senha   (FIni.ReadString ('Conexao', 'Senha', 'admin'))
    .&End;
end;

class function TControllerConfiguracao.New: IControllerConfiguracao<TConfiguracao>;
begin
  Result := Self.Create;
end;

end.
