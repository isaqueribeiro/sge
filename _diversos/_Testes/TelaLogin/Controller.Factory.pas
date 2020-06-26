unit Controller.Factory;

interface

uses
  Interacao.Factory, Interacao.Conexao, Interacao.Versao, Interacao.PersonalizaEmpresa, Interacao.Licenca;

type
  TFactoryController = class(TInterfacedObject, IFactory)
    strict private
      class var _instance : IFactory;
    private
    public
      function getConexao : IConexao;
      function getVersaoController : IVersao;
      function getPersonalizaEmpresa : IPersonalizaEmpresa;
      function getLicenca : ILicenca;

      class function getInstance() : IFactory;
  end;

implementation

uses
  Classe.Conexao, Controller.Versao, Controller.PersonalizaEmpresa, Controller.Licenca;

{ TFactoryController }

class function TFactoryController.getInstance: IFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TFactoryController.getConexao : IConexao;
begin
  Result := TConexao.GetInstance();
end;

function TFactoryController.getPersonalizaEmpresa: IPersonalizaEmpresa;
begin
  Result := TPersonalizaEmpresaController.GetInstance()
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
