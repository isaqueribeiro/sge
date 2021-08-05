unit SGE.Controller.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces;

type
  IController = interface
    ['{7BF1786A-5EBC-4101-943D-EA981E4E887F}']
    function DAO : IModelDAOCustom;
  end;

  IControllerCustom = interface(IController)
    ['{EF078F48-0F46-48FF-B6A2-B2926E490606}']
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function UF : IControllerCustom;
    function Cidade   : IControllerCustom;
    function Distrito : IControllerCustom;
    function Bairro   : IControllerCustom;
    function TipoLogradouro : IControllerCustom;
    function Logradouro : IControllerCustom;
    function CST  : IControllerCustom;
    function CFOP : IControllerCustom;
    function IBPT : IControllerCustom;
    function TabelaIBPT : IControllerCustom;
    function NivelIBPT : IControllerCustom;
    function Empresa : IControllerCustom;
    function EmpresaView : IControllerCustom;
    function ConfiguracaoEmpresa : IControllerCustom;
    function ContaCorrente : IControllerCustom;
    function ContaCorrenteView : IControllerCustom;
    function FormaPagto : IControllerCustom;
    function FormaPagtoContaCorrente : IControllerCustom;
    function FormaPagtoNFCEView : IControllerCustom;
    function CondicaoPagto : IControllerCustom;
    function CondicaoPagtoForma : IControllerCustom;
    function CondicaoPagtoView : IControllerCustom;
    function PlanoConta : IControllerCustom;
    function PlanoContaNivel : IControllerCustom;
    function PlanoContaTipo : IControllerCustom;
    function TipoReceita : IControllerCustom;
    function TipoReceitaPlanoConta : IControllerCustom;
    function ClasseReceita : IControllerCustom;
    function TipoDespesa : IControllerCustom;
    function TipoDespesaPlanoConta : IControllerCustom;
    function ClasseDespesa : IControllerCustom;
    function CentroCusto : IControllerCustom;
    function CentroCustoEmpresa : IControllerCustom;
    function Segmento : IControllerCustom;
    function TipoRegimeView : IControllerCustom;
  end;

implementation

end.
