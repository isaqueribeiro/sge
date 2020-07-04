unit Controller.Empresa;

interface

uses
  System.Generics.Collections, Interacao.Conexao, Interacao.Empresa, Classe.Empresa;

type
  TEmpresaController = class(TInterfacedObject, IEmpresa)
    strict private
      class var _instance : TEmpresaController;
    private
      [weak]
      FConexao : IConexao;
      FModel   : IEmpresaModel;
    protected
      constructor Create();
      destructor Destroy();
    public

      function Conexao(const Value : IConexao) : IEmpresa;

      class function getInstance() : TEmpresaController;
  end;

implementation

{ TEmpresaController }

constructor TEmpresaController.Create;
begin
  inherited Create;
  FModel := TEmpresa.New;
end;

destructor TEmpresaController.Destroy;
begin
  TEmpresa(FModel).DisposeOf;
  inherited Destroy;
end;

class function TEmpresaController.getInstance: TEmpresaController;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TEmpresaController.Conexao(const Value: IConexao): IEmpresa;
begin
  Result   := Self;
  FConexao := Value;
end;

end.
