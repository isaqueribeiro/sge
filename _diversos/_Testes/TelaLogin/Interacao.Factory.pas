unit Interacao.Factory;

interface

uses
  Interacao.Conexao, Interacao.Versao, Interacao.PersonalizaEmpresa, Interacao.Licenca;

type
  IFactory = interface
    ['{ABAC2969-3C2F-435C-A43D-441DCA386745}']
    function getConexao : IConexao;
    function getVersaoController : IVersao;
    function getPersonalizaEmpresa : IPersonalizaEmpresa;
    function getLicenca : ILicenca;
  end;

implementation

end.
