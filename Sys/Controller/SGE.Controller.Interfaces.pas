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

  IControllerEmpresa = interface(IControllerCustom)
    ['{F0D92BB2-24FF-4270-9655-79AAC773AD94}']
    function GetSegmentoID(aCNPJ : String) : Integer;
  end;

  IControllerCliente = interface(IControllerCustom)
    ['{85EFADEE-8A88-4026-B72B-D801148C296D}']
    procedure BloquearClientes;
    procedure BloquearCliente(aCodigo : Integer; aLog : String);
    procedure DesbloquearCliente(aCodigo : Integer; aLog : String);
    function CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
  end;

  IControllerCentroCusto = interface(IControllerCustom)
    ['{2A30F0DB-6B23-4A89-AA12-06A405551944}']
    procedure SetCentroCustoGeral(aEmpresa : String);
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function AliquotaCOFINSView : IControllerCustom;
    function AliquotaPISView : IControllerCustom;
    function Bairro   : IControllerCustom;
    function Banco : IControllerCustom;
    function BancoFebrabanView : IControllerCustom;
    function CentroCusto : IControllerCentroCusto;
    function CentroCustoEmpresa : IControllerCustom;
    function CFOP : IControllerCustom;
    function Cidade   : IControllerCustom;
    function ClasseDespesa : IControllerCustom;
    function ClasseReceita : IControllerCustom;
    function Cliente   : IControllerCliente;
    function ClienteEstoque : IControllerCustom;
    function ClienteTotalCompras : IControllerCustom;
    function ClienteTitulos : IControllerCustom;
    function CondicaoPagto : IControllerCustom;
    function CondicaoPagtoForma : IControllerCustom;
    function CondicaoPagtoView : IControllerCustom;
    function ConfiguracaoEmpresa : IControllerCustom;
    function ContaCorrente : IControllerCustom;
    function ContaCorrenteView : IControllerCustom;
    function CST : IControllerCustom;
    function Distrito : IControllerCustom;
    function Empresa : IControllerCustom;
    function EmpresaView : IControllerEmpresa;
    function FabricanteProduto : IControllerCustom;
    function FormaPagto : IControllerCustom;
    function FormaPagtoContaCorrente : IControllerCustom;
    function FormaPagtoNFCEView : IControllerCustom;
    function Fornecedor : IControllerCustom;
    function GrupoFornecedor : IControllerCustom;
    function GrupoProduto : IControllerCustom;
    function IBPT : IControllerCustom;
    function LayoutRemessaBancoView : IControllerCustom;
    function Logradouro : IControllerCustom;
    function NivelIBPT : IControllerCustom;
    function OrigemProdutoView : IControllerCustom;
    function PlanoConta : IControllerCustom;
    function PlanoContaNivel : IControllerCustom;
    function PlanoContaTipo : IControllerCustom;
    function Produto : IControllerCustom;
    function SecaoProduto : IControllerCustom;
    function Segmento : IControllerCustom;
    function TabelaIBPT : IControllerCustom;
    function TipoAliquotaView : IControllerCustom;
    function TipoCNPJView : IControllerCustom;
    function TipoComissaoView : IControllerCustom;
    function TipoDespesa : IControllerCustom;
    function TipoDespesaPlanoConta : IControllerCustom;
    function TipoLogradouro : IControllerCustom;
    function TipoProduto : IControllerCustom;
    function TipoReceita : IControllerCustom;
    function TipoReceitaPlanoConta : IControllerCustom;
    function TipoRegimeView : IControllerCustom;
    function TipoTributacao : IControllerCustom;
    function TipoVeiculo : IControllerCustom;
    function UF : IControllerCustom;
    function UnidadeProduto : IControllerCustom;
    function Vendedor : IControllerCustom;
  end;

implementation

end.
