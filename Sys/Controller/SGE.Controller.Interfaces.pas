unit SGE.Controller.Interfaces;

interface

uses
  Data.DB,
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

  IControllerConfigSystem = interface(IControllerCustom)
    ['{03B343EC-49C1-4677-8330-B6EB6DE31493}']
    procedure SetNumeroNSUPesquisado(const aEmpresa : String; aNSU : String);
    function GetNumeroNSUPesquisado(const aEmpresa : String) : String;
    function GetNumeroNSU(const aEmpresa : String) : Largeint;
  end;

  IControllerBairro = interface(IControllerCustom)
    ['{C915F8A1-07C5-4CAB-A9F4-CF562BC98419}']
    function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  end;

  IControllerLogradouro = interface(IControllerCustom)
    ['{E115FFFC-26D3-462F-BB10-2A52E5AD242E}']
    function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
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
    function GetAutorizacaoInformarCliente(const aCNPJ : String) : Boolean;
  end;

  IControllerCliente = interface(IControllerCustom)
    ['{85EFADEE-8A88-4026-B72B-D801148C296D}']
    procedure BloquearClientes;
    procedure BloquearCliente(aCodigo : Integer; aLog : String);
    procedure DesbloquearCliente(aCodigo : Integer; aLog : String);
    function CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
  end;

  IControllerFornecedor = interface(IControllerCustom)
    ['{14DC201C-608A-4A16-87D3-62B62B044EF6}']
    function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

  IControllerFornecedorProduto = interface(IControllerCustom)
    ['{0548A6D4-7102-4B48-B41C-7101C3D16187}']
    function GetProdutoFornecedorCodigo(const aCnpj, aProduto : String) : String;
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

  IControllerCFOP = interface(IControllerCustom)
    ['{0C883A1E-9611-4595-9E89-C90AD0F10DE7}']
    function GetTipo(aCodigo : Integer) : TTipoCFOP;
    function GetGerarDuplicata(aCodigo : Integer) : Boolean;
    function GetDevolucao(aCodigo : Integer) : Boolean;
    function Get(aCodigo : Integer) : IModelDAOCustom;
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

  IControllerXML_NFeEnviada = interface(IControllerCustom)
    ['{E356F024-9DCD-43CA-98E2-245697574D37}']
    function ListaNFePendente(aCNPJEmissor : String) : IModelDAOCustom; overload;
    function ListaNFePendente(aCNPJEmissor, aRecibo : String) : IModelDAOCustom; overload;
    function EmissaoNFePendente(aCNPJEmissor : String) : Boolean;
    function PesquisarLote(aCNPJEmissor, aRecibo : String; aLoteEnvioNFE : TLoteEnvioNFE) : IModelDAOCustom;
  end;

  IControllerXML_NFeImportada = interface(IControllerCustom)
    ['{6BA5E5BD-2493-467F-8B4E-46212A2B6584}']
    function GetUltimoNSUImportado(const aEmpresa: String): Int64;
    function GetArrayNSUImportados(const aEmpresa: String): String;
    function GetNumeroNSU(const aEmpresa : String) : Int64;
  end;

  IControllerEntrada = interface(IControllerCustom)
    ['{A5627D72-25E9-4711-8F2B-528AC7904DA8}']
    function Busca : IModelDAOCustom;
    function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;
    function Produtos : IControllerCustom;
    function Duplicatas : IControllerCustom;
    function Lotes : IControllerCustom;
    function NFe : IControllerXML_NFeEnviada;
    function CFOP : IControllerCFOP;
    function LoteProdutoPendente : Boolean;

    procedure CorrigirCFOP(aCFOP : String);
    procedure CarregarProdutos;
    procedure CarregarLotes;
    procedure CarregarDuplicatas;
    procedure CarregarNFe;
    procedure GerarDuplicatas;
    procedure GerarTotaisNFE;
    procedure LimparLoteEmissaoNFe;
  end;

  IControllerAutorizacaoCompra = interface(IControllerCustom)
    ['{CFB62551-6810-4CF5-9E3E-7D966E96E928}']
    function Produtos : IControllerCustom;
    function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerCustom;
    function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;

    procedure CarregarProdutos;
  end;

  IControllerRequisicaoCompra = interface(IControllerCustom)
    ['{2EE4BEF6-5661-418C-9232-3C90F06B98DA}']
    function Produtos : IControllerCustom;
    function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerRequisicaoCompra;
    function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;

    procedure CarregarProdutos;
  end;

  IControllerEntradaProduto = interface(IControllerCustom)
    ['{02B27486-02D0-460C-B81A-39BE177EE50B}']
    procedure GravarLoteProduto(aSistema : Smallint);
  end;

  IControllerContaAPagar = interface(IControllerCustom)
    ['{12196628-B1DD-4D44-9F83-CD63D2FFB633}']
    procedure GerarDuplicatas(aAnoCompra, aNumCompra : Integer);
    procedure CarregarPagamentos;
    function Pagamentos : IControllerCustom;
  end;

  IControllerPagamento = interface(IControllerCustom)
    ['{668B2910-1359-47E6-AB9B-28F711A2C75E}']
    procedure EstornarPagamento(aUsuario : String; aContaConrrente : Integer);
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function AliquotaCOFINSView : IControllerCustom;
    function AliquotaICMS       : IControllerAliquotaICMS;
    function AliquotaPISView    : IControllerCustom;
    function AutorizacaoCompra  : IControllerAutorizacaoCompra;
    function Bairro : IControllerBairro;
    function Banco  : IControllerCustom;
    function BancoFebrabanView  : IControllerCustom;
    function CentroCusto        : IControllerCentroCusto;
    function CentroCustoEmpresa : IControllerCustom;
    function CFOP   : IControllerCFOP;
    function Cidade : IControllerCustom;
    function ClasseDespesa  : IControllerCustom;
    function ClasseReceita  : IControllerCustom;
    function Cliente        : IControllerCliente;
    function ClienteEstoque : IControllerCustom;
    function ClienteTotalCompras : IControllerCustom;
    function ClienteTitulos      : IControllerCustom;
    function CombustivelVeiculo  : IControllerCustom;
    function Competencia : IControllerCustom;
    function CondicaoPagto       : IControllerCustom;
    function CondicaoPagtoForma  : IControllerCustom;
    function CondicaoPagtoView   : IControllerCustom;
    function ConfigSystem : IControllerConfigSystem;
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
    function EntradaDevolucao : IControllerCustom;
    function EntradaProduto : IControllerEntradaProduto;
    function Estado  : IControllerCustom;
    function FabricanteProduto  : IControllerCustom;
    function FormaDevolucao : IControllerCustom;
    function FormaPagto : IControllerCustom;
    function FormaPagtoContaCorrente : IControllerCustom;
    function FormaPagtoNFCEView : IControllerCustom;
    function Fornecedor      : IControllerFornecedor;
    function FornecedorProduto : IControllerFornecedorProduto;
    function GrupoFornecedor : IControllerCustom;
    function GrupoProduto    : IControllerCustom;
    function IBPT : IControllerCustom;
    function ItensAutorizadosParaEntrada : IControllerCustom;
    function LayoutRemessaBancoView : IControllerCustom;
    function Logradouro : IControllerLogradouro;
    function LogTransacao : IControllerCustom;
    function LoteProduto : IControllerCustom;
    function ModeloCupomFiscalView : IControllerCustom;
    function NFeEnviada : IControllerCustom;
    function NFeImportada : IControllerCustom;
    function NivelIBPT  : IControllerCustom;
    function OrigemProdutoView : IControllerCustom;
    function Pagamento         : IControllerPagamento;
    function PlanoConta        : IControllerCustom;
    function PlanoContaNivel   : IControllerCustom;
    function PlanoContaTipo    : IControllerCustom;
    function Produto           : IControllerProduto;
    function Promocao          : IControllerPromocao;
    function PromocaoProduto   : IControllerCustom;
    function RequisicaoCompra  : IControllerRequisicaoCompra;
    function SecaoProduto : IControllerCustom;
    function Segmento     : IControllerCustom;
    function TabelaIBPT   : IControllerCustom;
    function TipoAliquotaView : IControllerCustom;
    function TipoAutorizacaoView : IControllerCustom;
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
    function TipoRequisicaoView : IControllerCustom;
    function TipoTributacao : IControllerCustom;
    function TipoVeiculo    : IControllerCustom;
    function Transportadora : IControllerCustom;
    function UF : IControllerCustom;
    function UnidadeProduto : IControllerCustom;
    function Vendedor : IControllerCustom;
    function XML_NFeEnviada : IControllerXML_NFeEnviada;
    function XML_NFeImportada : IControllerXML_NFeImportada;
  end;

implementation

end.
