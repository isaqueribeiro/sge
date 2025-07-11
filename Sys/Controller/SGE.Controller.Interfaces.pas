unit SGE.Controller.Interfaces;

interface

uses
  Data.DB,
  Model.Constantes,
  UConstantesDGE,
  SGE.Model.DAO.Interfaces;

type
  IController = interface
    ['{7BF1786A-5EBC-4101-943D-EA981E4E887F}']
    function DAO : IModelDAOCustom;
    function GerarSequencial(const aDataSet : TDataSet; const aCampo : String; var aSequencial : Integer) : IController;
  end;

  IControllerQuery = interface
    ['{CDA96820-C960-4EE2-BD93-57A86C432169}']
    function DataSource(aDataSource : TDataSource) : IControllerQuery;
    function DataIncial(aValue : TDateTime) : IControllerQuery;
    function DataFinal(aValue : TDateTime) : IControllerQuery;
    function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery;
    function DataSet : TDataSet;
  end;

  IControllerQueryAproriacaoEstoque = interface(IControllerQuery)
    ['{4F55D56E-8BC0-4E40-AD9D-DDE386B162F2}']
    function CentroCusto(Value : Integer) : IControllerQueryAproriacaoEstoque;
    function ApenasProdutoComEstoue(Value : Boolean) : IControllerQueryAproriacaoEstoque;
    function Grupo(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
    function Fabricante(aCodigo : Integer) : IControllerQueryAproriacaoEstoque;
    function CalcularPercentuais(const aValorReferencia : Currency) : IControllerQueryAproriacaoEstoque;
    function AtualizarCusto(aProduto : String; aValorCusto : Currency; aSistema : SmallInt) : IControllerQueryAproriacaoEstoque; overload;
    function AtualizarCusto(aData : TDateTime) : IControllerQueryAproriacaoEstoque; overload;
    function AtualizarCustoGeral : IControllerQueryAproriacaoEstoque;
  end;

  IControllerQueryCaixaMovimento = interface(IControllerQuery)
    ['{4B33D5EF-F7FC-4FD4-B7FF-A0DA548FE9D9}']
    procedure GravarDados;
    function MovimentoConferencia(aValue : Integer) : IControllerQueryCaixaMovimento;
    function ContaCorrente(aValue : Integer) : IControllerQueryCaixaMovimento;
    function Caixa(aValue : String) : IControllerQueryCaixaMovimento;
    function ValorTotalPesquisado : Currency;
    function ValorTotalPesquisadoCredito : Currency;
    function ValorTotalPesquisadoDebito : Currency;
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

  IControllerCompetencia = interface(IControllerCustom)
    ['{B7A66499-33E7-4085-A68B-852E10DFA0AC}']
    function GetID(aDataMovimento : TDateTime) : Integer;
  end;

  IControllerContaCorrente = interface(IControllerCustom)
    ['{2732B4E7-65C6-4289-80BF-E0832DA280AB}']
    function CarregarLista(aEmpresa : String) : IControllerContaCorrente;
  end;

  IControllerBairro = interface(IControllerCustom)
    ['{C915F8A1-07C5-4CAB-A9F4-CF562BC98419}']
    function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  end;

  IControllerLogradouro = interface(IControllerCustom)
    ['{E115FFFC-26D3-462F-BB10-2A52E5AD242E}']
    function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
  end;

  IControllerEndereco = interface(IControllerCustom)
    ['{C1757C4A-5E35-4AAC-97BE-4619E7202B59}']
    function GetPaisIDDefault : String;
    function GetPaisNomeDefault : String;
    function GetPaisNome(const sPais : String) : String;
    function GetEstadoIDDefault : Integer;
    function GetEstadoNomeDefault : String;
    function GetEstadoNome(const iEstado : Integer) : String; overload;
    function GetEstadoNome(const sSigla : String) : String; overload;
    function GetEstadoID(const sSigla : String) : Integer;
    function GetEstadoUF(const iEstado : Integer) : String;
    function GetCidadeIDDefault : Integer;
    function GetCidadeNomeDefault : String;
    function GetCidadeNome(const iCidade : Integer) : String;
    function GetCidadeCEP(const iCidade : Integer) : String;
    function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer; overload;
    function GetCidadeID(const sCEP : String) : Integer; overload;
    function GetCidadeID(const aIBGE : Currency) : Integer; overload;
    function GetLogradouroNome(const iLogradouro : Integer) : String;
    function GetLogradouroTipo(const iLogradouro : Integer) : String;
    function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
    function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
  end;

  IControllerEmpresa = interface(IControllerCustom)
    ['{F0D92BB2-24FF-4270-9655-79AAC773AD94}']
    function GetSegmentoID(aCNPJ : String) : Integer;
    function GetEmpresaUF(aCNPJ : String) : String;
    function GetEmpresaEndereco(aCNPJ : String) : String;
    function GetEmpresaFantasia(aCNPJ : String) : String;
    function GetEmpresaRazao(aCNPJ : String) : String;
    function GetEstoqueUnificado(aCNPJ : String) : Boolean;
    function GetEstoqueSateliteEmpresa(aCNPJ : String) : Boolean;
    function GetPermitirVendaEstoqueInsuficiente(aCNPJ : String) : Boolean;
    function GetPermitirEmissaoNFe(aCNPJ : String) : Boolean;
    function GetPermitirEmissaoNFeEntrada(aCNPJ : String) : Boolean;
    function GetRegime(aCNPJ : String) : TTipoRegime;
    function GetAutorizacaoInformarCliente(aCNPJ : String) : Boolean;
    function GetCalcularCustoOperEmpresa(aCNPJ : String) : Boolean;
    function GetPermitirVerdadeiroFalsoCNPJCliente(aCNPJ : String) : Boolean;
    function GetPermitirDuplicarCNPJCliente(aCNPJ : String) : Boolean;
  end;

  IControllerCliente = interface(IControllerCustom)
    ['{85EFADEE-8A88-4026-B72B-D801148C296D}']
    procedure BloquearClientes;
    procedure BloquearCliente(aCodigo : Integer; aLog : String);
    procedure DesbloquearCliente(aCodigo : Integer; aLog : String);
    function CpfCnpjCadastro(Codigo : Integer;  CpfCnpj : String; var aCodigo : Integer; var aNome : String) : Boolean;
    function Get(aCodigo : Integer) : IModelDAOCustom; overload;
    function Get(aCNPJ : String) : IModelDAOCustom; overload;
  end;

  IControllerFornecedor = interface(IControllerCustom)
    ['{14DC201C-608A-4A16-87D3-62B62B044EF6}']
    function Get(aCodigo : Integer) : IModelDAOCustom; overload;
    function Get(aCNPJ : String) : IModelDAOCustom; overload;
  end;

  IControllerFornecedorProduto = interface(IControllerCustom)
    ['{0548A6D4-7102-4B48-B41C-7101C3D16187}']
    function GetProdutoFornecedorCodigo(const aCnpj, aProduto : String) : String;
  end;

  IControllerCentroCusto = interface(IControllerCustom)
    ['{2A30F0DB-6B23-4A89-AA12-06A405551944}']
    procedure SetCentroCustoGeral(aEmpresa : String);

    function Listar(aEmpresa : String) : IModelDAOCustom;
    function Carregar(aCodigo : Integer) : IControllerCentroCusto;
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

  IControllerContrato = interface(IControllerCustom)
    ['{F413F562-0B73-4A12-AAC1-80E202C9232C}']
    function Busca : IModelDAOCustom;
    function NumeroDuplicado(const aContrato : TContrato) : Boolean;
    function Itens : IControllerCustom;
    function Notas : IControllerCustom;

    procedure CarregarItens;
    procedure CarregarNotas;
  end;

  IControllerContratoItem = interface(IControllerCustom)
    ['{74266ABA-AE6A-4847-863A-37AF470698BF}']
    function Busca : IModelDAOCustom;
  end;

  IControllerContratoNotas = interface(IControllerCustom)
    ['{3A6D07E9-0A09-48B3-B3C8-52A1665AF78D}']
    function Busca : IModelDAOCustom;
  end;

  IControllerPerfil = interface(IControllerCustom)
    ['{AC9FB863-06A6-4EEF-A9A3-2EFE7571A7F6}']
    function CarregarPermissoes(aSistema : Integer; aPerfil : Integer) : IControllerPerfil;
    function GravarPermissao(aSistema : Integer; aPerfil : Integer; aRotina : String; aPermissao : Boolean) : IControllerPerfil;
    function Permissoes : TDataSet;
  end;

  IControllerProduto = interface(IControllerCustom)
    ['{A7AC63DC-E458-4F12-8FDA-B7EF68CDD539}']
    procedure AtualizarMetafonema(aDescricao, aApresentacao, aCodigo : String);
    procedure AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo : String);
    procedure AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);
    function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

  IControllerProdutoAlmoxarifado = interface(IControllerCustom)
    ['{2DE3B864-C82B-442E-A633-4B221EB23D3F}']
    function Carregar(aEmpresa : String; aCentroCusto, aCodigo : Integer;
      aRequisicaoAno : Smallint; aRequisicaoControle : Integer) : IControllerProdutoAlmoxarifado;
  end;

  IControllerProdutoAlmoxarifadoReservado = interface
    ['{7684CB3E-8A98-40EA-ADDD-8D4B981F81F1}']
    function Reservado(aCodigo : String) : IControllerProdutoAlmoxarifadoReservado;
    function DataSet : TDataSet;
  end;

  IControllerPromocao = interface(IControllerCustom)
    ['{4661B49F-97AC-4B7D-B8DE-EB6E5CE20B33}']
    procedure DesativarPromocoes;
    procedure AplicarPromocao;
  end;

  IControllerusuario = interface(IControllerCustom)
    ['{FB278AFF-F55C-413F-8203-4D78FB7E36DD}']
    function LoginExiste(const Login : String) : Boolean;
    function Carregar(const Login : String) : IControllerusuario;
    function SalvarNovaSenha : IControllerusuario;
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

  IControllerRequisicaoAlmoxarifado = interface(IControllerCustom)
    ['{6E2C8852-401A-43CB-9A78-70CFD2442A13}']
    function Produtos : IControllerCustom;
    function MarcarComoRecebida : IControllerRequisicaoAlmoxarifado;
    function DevolverRequisicao : IControllerRequisicaoAlmoxarifado;
    function Carregar(aAno, aControle : Integer) : IControllerRequisicaoAlmoxarifado;

    procedure CarregarProdutos;
    procedure AjustarQuantidadeAtendidaDeProdutos;
  end;

  IControllerRotina = interface(IControllerCustom)
    ['{56CF1ED4-1E70-4B74-A6D7-39C133666FFF}']
    function CarregarMenus(aSistema : Integer) : IControllerRotina;
    function CarregarSubMenus(aSistema : Integer; aRotina : String) : IControllerRotina;
    function Menus : TDataSet;
    function SubMenus : TDataSet;
  end;

  IControllerEntradaProduto = interface(IControllerCustom)
    ['{02B27486-02D0-460C-B81A-39BE177EE50B}']
    procedure GravarLoteProduto(aSistema : Smallint);
  end;

  IControllerCotacaoCompra = interface(IControllerCustom)
    ['{21F91465-6394-4264-B42B-CEC743A78108}']
    procedure CarregarItens;
    procedure CarregarFornecedores;

    function Itens : IControllerCustom;
    function Fornecedores : IControllerCustom;
    function ProcessarRespostas(aAno, aCotacao : Integer; aEmpresa : String) : IControllerCotacaoCompra;
    function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;
    function CotacaoFornecedorItem(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer) : IControllerCotacaoCompra;
  end;

  IControllerCotacaoCompraFornecedor = interface(IControllerCustom)
    ['{33B4F1B2-121A-44ED-ADF1-3E831CBCA5F6}']
    procedure CarregarFornecedor(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer);
    procedure ExcluirItens(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer);
    function CotacaoFornecedorItem(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer) : IControllerCotacaoCompraFornecedor;
  end;

    IControllerCotacaoCompraFornecedorItens = interface(IControllerCustom)
      ['{40F8FD3C-624E-4F64-B1FA-A9E19885EA89}']
      procedure CarregarFornecedorItens(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer);
    end;

  IControllerContaAPagar = interface(IControllerCustom)
    ['{12196628-B1DD-4D44-9F83-CD63D2FFB633}']
    procedure GerarDuplicatas(aAnoCompra, aNumCompra : Integer);
    procedure CarregarPagamentos;
    function Pagamentos : IControllerCustom;
    function MenorVencimentoAPagar : TDateTime;
  end;

  IControllerContaAReceber = interface(IControllerCustom)
    ['{7344F716-9C84-4D95-ACC0-FFA805C943C0}']
    procedure GerarTitulos(aAnoCompra, aNumCompra : Integer);
    procedure CarregarRecebimentos;
    function Recebimentos : IControllerCustom;
    function MenorVencimentoAReceber : TDateTime;
  end;

  IControllerPagamento = interface(IControllerCustom)
    ['{668B2910-1359-47E6-AB9B-28F711A2C75E}']
    procedure GerarMovimentoCaixa(aUsuario : String);
    procedure EstornarPagamento(aUsuario : String; aContaConrrente : Integer);
    procedure GerarSaldoConta(const aContaCorrente : Integer; const aDataMovimento : TDateTime);
    procedure RecalcularSaldo(aContaCorrente : Integer);

    function Sequencial(const aCampo : String) : Integer;
  end;

  IControllerRecebimento = interface(IControllerCustom)
    ['{2CADA3BA-34F9-4753-BA9B-A62424ECF812}']
    procedure GerarMovimentoCaixa(aUsuario : String);
    procedure EstornarRecebimento(aUsuario : String; aContaConrrente : Integer);
    procedure GerarSaldoConta(const aContaCorrente : Integer; const aDataMovimento : TDateTime);
    procedure RecalcularSaldo(aContaCorrente : Integer);

    function Sequencial(const aCampo : String) : Integer;
  end;

  IControllerCaixa = interface(IControllerCustom)
    ['{B42AEE75-D285-44D7-B369-91B14B8CC838}']
    function CaixaAberto(const aEmpresa, aUsuario : String;
      const DataReferencia : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
  end;

  IControllerCaixaMovimento = interface(IControllerCustom)
    ['{E89DAA35-7E9F-405B-80D3-2BDA77EFB64B}']
    function Lancamentos(aData : TDateTime; aContaCorrente : Integer; const aAnoCaixa : Integer = 0; const aNumeroCaixa : Integer = 0) : IControllerCaixaMovimento;
  end;

  IControllerBanco = interface(IControllerCustom)
    ['{E0514070-93A2-44EC-B598-0B9819DE0E72}']
    function GetBancoBoletoCodigo(aEmpresa, aCodigoFebraBan : String) : Integer;
  end;

  IControllerCheque = interface(IControllerCustom)
    ['{C35B454A-DE44-4170-A590-4B439387FA70}']
    function CarregarBaixas : IControllerCheque; overload;
    function CarregarBaixas(aNumeroControle : Integer) : IControllerCheque; overload;
    function Baixas : IModelDAOCustom;
  end;

  IControllerSolicitacaoCompra = interface(IControllerCustom)
    ['{48EDCE5F-5DBA-4F5E-A8DB-F3643B98DBD6}']
    function Produtos : IControllerCustom;
    function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;

    procedure CarregarProdutos;
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function AliquotaCOFINSView : IControllerCustom;
    function AliquotaICMS       : IControllerAliquotaICMS;
    function AliquotaPISView    : IControllerCustom;
    function AutorizacaoCompra  : IControllerAutorizacaoCompra;
    function Bairro : IControllerBairro;
    function Banco  : IControllerBanco;
    function BancoFebrabanView  : IControllerCustom;
    function Caixa : IControllerCaixa;
    function CaixaMovimento : IControllerCaixaMovimento;
    function CentroCusto        : IControllerCentroCusto;
    function CentroCustoEmpresa : IControllerCustom;
    function CentroCustoInterno : IControllerCustom;
    function CFOP   : IControllerCFOP;
    function Cheque : IControllerCheque;
    function Cidade : IControllerCustom;
    function ClasseDespesa  : IControllerCustom;
    function ClasseReceita  : IControllerCustom;
    function Cliente        : IControllerCliente;
    function ClienteEstoque : IControllerCustom;
    function ClienteTotalCompras : IControllerCustom;
    function ClienteTitulos      : IControllerCustom;
    function CombustivelVeiculo  : IControllerCustom;
    function Competencia : IControllerCompetencia;
    function CondicaoPagto       : IControllerCustom;
    function CondicaoPagtoForma  : IControllerCustom;
    function CondicaoPagtoView   : IControllerCustom;
    function ConfigSystem : IControllerConfigSystem;
    function ConfiguracaoEmpresa : IControllerCustom;
    function ContaAPagar : IControllerContaAPagar;
    function ContaAReceber : IControllerContaAReceber;
    function ContaCorrente       : IControllerContaCorrente;
    function ContaCorrenteView   : IControllerCustom;
    function Contrato : IControllerContrato;
    function ContratoItem : IControllerContratoItem;
    function ContratoNotas : IControllerContratoNotas;
    function CorVeiculo : IControllerCustom;
    function CotacaoCompra : IControllerCotacaoCompra;
    function CotacaoCompraFornecedor : IControllerCotacaoCompraFornecedor;
    function CotacaoCompraFornecedorItens : IControllerCotacaoCompraFornecedorItens;
    function CST : IControllerCustom;
    function Distrito    : IControllerCustom;
    function Empresa     : IControllerCustom;
    function EmpresaView : IControllerEmpresa;
    function Endereco : IControllerEndereco;
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
    function Perfil : IControllerPerfil;
    function PerfilParaCopia : IControllerCustom;
    function PlanoConta        : IControllerCustom;
    function PlanoContaNivel   : IControllerCustom;
    function PlanoContaTipo    : IControllerCustom;
    function Produto           : IControllerProduto;
    function ProdutoAlmoxarifado : IControllerProdutoAlmoxarifado;
    function ProdutoAlmoxarifadoReservado : IControllerProdutoAlmoxarifadoReservado;
    function Promocao          : IControllerPromocao;
    function PromocaoProduto   : IControllerCustom;
    function Recebimento       : IControllerRecebimento;
    function RequisicaoAlmoxarifado : IControllerRequisicaoAlmoxarifado;
    function RequisicaoCompra  : IControllerRequisicaoCompra;
    function Rotina  : IControllerRotina;
    function SecaoProduto : IControllerCustom;
    function Segmento     : IControllerCustom;
    function SolicitacaoCompra : IControllerSolicitacaoCompra;
    function TabelaIBPT   : IControllerCustom;
    function TipoAliquotaView : IControllerCustom;
    function TipoAutorizacaoView : IControllerCustom;
    function TipoChequeView   : IControllerCustom;
    function TipoCNPJView     : IControllerCustom;
    function TipoComissaoView : IControllerCustom;
    function TipoContratoView : IControllerCustom;
    function TipoCotacaoView  : IControllerCustom;
    function TipoDescontoView : IControllerCustom;
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
    function TipoRequisicaoAlmoxView : IControllerCustom;
    function TipoTributacao : IControllerCustom;
    function TipoSolicitacaoView : IControllerCustom;
    function TipoVeiculo    : IControllerCustom;
    function Transportadora : IControllerCustom;
    function UF : IControllerCustom;
    function Usuario : IControllerUsuario;
    function UnidadeProduto : IControllerCustom;
    function Vendedor : IControllerCustom;
    function XML_NFeEnviada : IControllerXML_NFeEnviada;
    function XML_NFeImportada : IControllerXML_NFeImportada;
  end;

implementation

end.
