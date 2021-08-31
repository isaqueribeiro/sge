unit SGE.Controller.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces,
  UConstantesDGE;

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
    function GetEmpresaUF(aCNPJ : String) : String;
    function GetEstoqueUnificado(aCNPJ : String) : Boolean;
    function GetPermitirVendaEstoqueInsuficiente(aCNPJ : String) : Boolean;
    function GetPermitirEmissaoNFe(aCNPJ : String) : Boolean;
    function GetPermitirEmissaoNFeEntrada(aCNPJ : String) : Boolean;
    function GetRegime(aCNPJ : String) : TTipoRegime;
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

  IControllerAliquotaICMS = interface(IControllerCustom)
    ['{4B60835E-A540-42BF-A24D-5B945070DB0E}']
    procedure AliquotaIcms(const UF_Origem, UF_Destino : String; var aAliquotaInter, aAliquotaIntra, aAliquotaST : Currency);
  end;

  IControllerIBPT = interface(IControllerCustom)
    ['{81B31D94-EB77-4DA6-81F9-7FFDD397CCEB}']
    function GetTabelaIBPTCodigo(aCodigoNCM : String) : Integer;
  end;

  IControllerProduto = interface(IControllerCustom)
    ['{A7AC63DC-E458-4F12-8FDA-B7EF68CDD539}']
    procedure AtualizarMetafonema(aDescricao, aApresentacao, aCodigo : String);
    procedure AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo : String);
    procedure AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);
    function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

  IControllerPromocao = interface(IControllerCustom)
    ['{4661B49F-97AC-4B7D-B8DE-EB6E5CE20B33}']
    procedure DesativarPromocoes;
    procedure AplicarPromocao;
  end;

  IControllerEntrada = interface(IControllerCustom)
    ['{A5627D72-25E9-4711-8F2B-528AC7904DA8}']
    function Busca : IModelDAOCustom;
    function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;
    function Produtos : IControllerCustom;
    function Duplicatas : IControllerCustom;

    procedure CorrigirCFOP(aCFOP : String);
    procedure CarregarProdutos;
    procedure CarregarDuplicatas;
    procedure GerarDuplicatas;
  end;

  IControllerContaAPagar = interface(IControllerCustom)
    ['{12196628-B1DD-4D44-9F83-CD63D2FFB633}']
    procedure GerarDuplicatas(aAnoCompra, aNumCompra : Integer);
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function AliquotaCOFINSView : IControllerCustom;
    function AliquotaICMS       : IControllerAliquotaICMS;
    function AliquotaPISView    : IControllerCustom;
    function Bairro : IControllerCustom;
    function Banco  : IControllerCustom;
    function BancoFebrabanView  : IControllerCustom;
    function CentroCusto        : IControllerCentroCusto;
    function CentroCustoEmpresa : IControllerCustom;
    function CFOP   : IControllerCustom;
    function Cidade : IControllerCustom;
    function ClasseDespesa  : IControllerCustom;
    function ClasseReceita  : IControllerCustom;
    function Cliente        : IControllerCliente;
    function ClienteEstoque : IControllerCustom;
    function ClienteTotalCompras : IControllerCustom;
    function ClienteTitulos      : IControllerCustom;
    function CombustivelVeiculo  : IControllerCustom;
    function CondicaoPagto       : IControllerCustom;
    function CondicaoPagtoForma  : IControllerCustom;
    function CondicaoPagtoView   : IControllerCustom;
    function ConfiguracaoEmpresa : IControllerCustom;
    function ContaAPagar : IControllerContaAPagar;
    function ContaCorrente       : IControllerCustom;
    function ContaCorrenteView   : IControllerCustom;
    function CorVeiculo : IControllerCustom;
    function CST : IControllerCustom;
    function Distrito    : IControllerCustom;
    function Empresa     : IControllerCustom;
    function EmpresaView : IControllerEmpresa;
    function Entrada : IControllerEntrada;
    function EntradaProduto : IControllerCustom;
    function FabricanteProduto : IControllerCustom;
    function FormaPagto : IControllerCustom;
    function FormaPagtoContaCorrente : IControllerCustom;
    function FormaPagtoNFCEView : IControllerCustom;
    function Fornecedor      : IControllerCustom;
    function GrupoFornecedor : IControllerCustom;
    function GrupoProduto    : IControllerCustom;
    function IBPT : IControllerCustom;
    function LayoutRemessaBancoView : IControllerCustom;
    function Logradouro : IControllerCustom;
    function NivelIBPT  : IControllerCustom;
    function OrigemProdutoView : IControllerCustom;
    function PlanoConta        : IControllerCustom;
    function PlanoContaNivel   : IControllerCustom;
    function PlanoContaTipo    : IControllerCustom;
    function Produto           : IControllerProduto;
    function Promocao          : IControllerPromocao;
    function PromocaoProduto   : IControllerCustom;
    function SecaoProduto : IControllerCustom;
    function Segmento     : IControllerCustom;
    function TabelaIBPT   : IControllerCustom;
    function TipoAliquotaView : IControllerCustom;
    function TipoCNPJView     : IControllerCustom;
    function TipoComissaoView : IControllerCustom;
    function TipoDespesa      : IControllerCustom;
    function TipoDespesaPlanoConta : IControllerCustom;
    function TipoDocumentoEntradaView : IControllerCustom;
    function TipoEntradaView : IControllerCustom;
    function TipoLogradouro : IControllerCustom;
    function TipoProduto    : IControllerCustom;
    function TipoReceita    : IControllerCustom;
    function TipoReceitaPlanoConta : IControllerCustom;
    function TipoRegimeView : IControllerCustom;
    function TipoTributacao : IControllerCustom;
    function TipoVeiculo    : IControllerCustom;
    function UF : IControllerCustom;
    function UnidadeProduto : IControllerCustom;
    function Vendedor : IControllerCustom;
  end;

implementation

end.
