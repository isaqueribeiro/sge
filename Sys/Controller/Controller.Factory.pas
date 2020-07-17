unit Controller.Factory;

interface

uses
  Interacao.Factory, Interacao.Versao, Interacao.PersonalizaEmpresa, Interacao.Licenca,
  Interacao.Usuario, Interacao.Empresa, Interacao.Tabela;

type
  TFactoryController = class(TInterfacedObject, IFactory)
    strict private
      class var _instance : IFactory;
    private
    public
      function getVersaoController : IVersao;
      function getPersonalizaEmpresa : IPersonalizaEmpresa;
      function getLicenca : ILicenca;
      function getUsuarioController : IUsuario;
      function getEmpresaController : IEmpresa;
      function getTabelaController  : ITabela;

      class function getInstance() : IFactory;
  end;

implementation

uses
  Controller.Versao, Controller.PersonalizaEmpresa, Controller.Licenca,
  Controller.Usuario, Controller.Empresa, Controller.Tabela;

{ TFactoryController }

class function TFactoryController.getInstance: IFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TFactoryController.getEmpresaCOntroller: IEmpresa;
begin
  Result := TEmpresaController.getInstance();
end;

function TFactoryController.getPersonalizaEmpresa: IPersonalizaEmpresa;
begin
  Result := TPersonalizaEmpresaController.GetInstance()
end;

function TFactoryController.getTabelaController: ITabela;
begin
  Result := TTabelaController.New;
end;

function TFactoryController.getUsuarioCOntroller: IUsuario;
begin
  Result := TUsuarioController.GetInstance();
end;

function TFactoryController.getVersaoController: IVersao;
begin
  Result := TVersaoController.GetInstance();
end;

function TFactoryController.getLicenca: ILicenca;
begin
  Result := TLicencaController.GetInstance();
end;

end.
