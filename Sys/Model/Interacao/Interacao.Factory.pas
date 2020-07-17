unit Interacao.Factory;

interface

uses
  Interacao.Versao,
  Interacao.PersonalizaEmpresa,
  Interacao.Licenca,
  Interacao.Usuario,
  Interacao.Empresa,
  Interacao.Tabela;

type
  IFactory = interface
    ['{ABAC2969-3C2F-435C-A43D-441DCA386745}']
    function getVersaoController : IVersao;
    function getPersonalizaEmpresa : IPersonalizaEmpresa;
    function getLicenca : ILicenca;
    function getUsuarioController : IUsuario;
    function getEmpresaController : IEmpresa;
    function getTabelaController  : ITabela;
  end;

implementation

end.
