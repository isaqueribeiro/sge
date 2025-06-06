unit SGE.Model.DAO.Interfaces;

interface

uses
  System.Classes,
  Data.DB,
  Interacao.Usuario,
  Model.Constantes,
  Model.Entidade.ConfiguracaoINI;

type
//  IConfigureFields = interface;
//
  IModelDAO = interface
    ['{2CE64058-14C2-4585-9FCA-6EACD931AA08}']
    function Usuario : IUsuarioModel;
    function Configuracao : IConfiguracaoIni;
    function DataSet   : TDataSet;
//    function ConfigureFields : IConfigureFields;
    function SelectSQL : String;
    function Clear : IModelDAO;
    function SQL(Value : String) : IModelDAO;

    function Where(aExpressionWhere : String) : IModelDAO; overload;
    function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
    function Where(aFieldName : String; aFielValue : Integer) : IModelDAO; overload;
    function Where(aFieldName : String; aFielValue : Int64) : IModelDAO; overload;
    function WhereLike(aFieldName, aFielValue : String) : IModelDAO;

    function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
    function WhereOr(aExpressionWhere : String) : IModelDAO; overload;

    function WhereAdditional(aExpression : String) : IModelDAO; overload;
    function WhereAdditional : String; overload;

    function ParamsByName(aParamsName, aParamsValue : String) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : Integer) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : Int64) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : Currency) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : TDateTime) : IModelDAO; overload;
    function ParamsByNameClear(aParamsName : String) : IModelDAO;

    function OrderBy(aFieldName : String) : IModelDAO; overload;

    function PrepareInsert(Value : Boolean) : IModelDAO; overload;
    function PrepareInsert : Boolean; overload;

    function OpenEmpty  : IModelDAO;
    function CloseEmpty : IModelDAO;
    function Close      : IModelDAO;

    procedure Open;
    procedure OpenOrExecute;

    procedure ClearWhere;
    procedure ClearOrderBy;
    procedure ApplyUpdates;
    procedure CommitUpdates;
    procedure RefreshRecord;
    procedure UpdateGenerator(const aExpressionWhere : String = ''); overload;
    procedure UpdateGenerator(aGeneratorName, aTableName, aFielNameKey : String; const sWhr : String = ''); overload;
    procedure ExecuteScriptSQL(aScript : String);

    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;

    function NewSequence(const aDataSet : TDataSet; const aFieldName : String = 'SEQ') : Integer;
  end;

  IModelDAOCustom = interface(IModelDAO)
    ['{08EF0520-4A95-4194-B5B7-AFE88A77E4DD}']
    function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  IModelDAOQuery = interface(IModelDAO)
    ['{A6D473C0-3756-4C53-B599-0AB783EA27B0}']
    function DataIncial(aValue : TDateTime) : IModelDAOQuery;
    function DataFinal(aValue : TDateTime) : IModelDAOQuery;
    function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQuery;
  end;

  IModelDAOQueryCaixa = interface(IModelDAOQuery)
    ['{A21555FD-7FE7-48D5-A34F-53DB71AC235B}']
    function Ano(aValue : Integer) : IModelDAOQueryCaixa;
    function Numero(aValue : Integer) : IModelDAOQueryCaixa;
  end;

  IModelDAOQueryCaixaMovimento = interface(IModelDAOQuery)
    ['{01D06EF1-F2FB-480B-B609-CA07952A1F5A}']
    function MovimentoConferencia(aValue : Integer) : IModelDAOQueryCaixaMovimento;
    function ContaCorrente(aValue : Integer) : IModelDAOQueryCaixaMovimento;
    function AnoCaixa(aValue : Integer) : IModelDAOQueryCaixaMovimento;
    function NumeroCaixa(aValue : Integer) : IModelDAOQueryCaixaMovimento;
    function ExecuteCustom(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQueryCaixaMovimento;
    function ValorTotalPesquisado : Currency;
    function ValorTotalPesquisadoCredito : Currency;
    function ValorTotalPesquisadoDebito : Currency;
  end;

  IModelDAOQueryApropriacaoEstoque = interface(IModelDAOQuery)
    ['{917C3A82-4CE4-4D48-96B2-A5DA1E32A1B7}']
    procedure CalcularPercentuais(const aValorReferencia : Currency);
    function ApenasProdutoComEstoque(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
    function SelecionarRegistro(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
    function Grupo(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
    function Fabricante(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
    function ExecuteCustom(aTipo : TTipoPesquisa; aCentroCusto : Integer; aFiltro : String) : IModelDAOQueryApropriacaoEstoque;
  end;

//  IConfigureFields = interface
//    ['{30A1F9D0-432D-4C7F-8FDF-58B7943F17F5}']
//    function Table(aDataSet : TDataSet) : IConfigureFields;
//    function Display(aKey, aValue : String) : IConfigureFields; overload;
//    function Display(aKey, aValue, aFormato : String) : IConfigureFields; overload;
//    function Display(aKey, aValue, aFormato : String; aAlinhamento : TAlignment) : IConfigureFields; overload;
//    function Display(aKey, aValue : String; aAlinhamento : TAlignment) : IConfigureFields; overload;
//
//    procedure Setup; overload;
//    procedure Setup(aDataSet : TDataSet); overload;
//  end;
//
  IModelDAOFactory = interface
    ['{0EF3B708-2B61-4B02-A8EB-A59A1E9ADD81}']
    function AliquotaCOFINSView : IModelDAOCustom;
    function AliquotaICMS : IModelDAOCustom;
    function AliquotaPISView : IModelDAOCustom;
    function AutorizacaoCompra : IModelDAOCustom;
    function AutorizacaoCompraProdutoServico : IModelDAOCustom;
    function Bairro   : IModelDAOCustom;
    function Banco : IModelDAOCustom;
    function BancoFebrabanView : IModelDAOCustom;
    function Busca : IModelDAOCustom;
    function Caixa : IModelDAOCustom;
    function CaixaMovimento : IModelDAOCustom;
    function CentroCusto : IModelDAOCustom;
    function CentroCustoEmpresa : IModelDAOCustom;
    function CentroCustoInterno : IModelDAOCustom;
    function CFOP : IModelDAOCustom;
    function Cheque : IModelDAOCustom;
    function Cidade   : IModelDAOCustom;
    function ClasseDespesa : IModelDAOCustom;
    function ClasseReceita : IModelDAOCustom;
    function Cliente : IModelDAOCustom;
    function ClienteEstoque : IModelDAOCustom;
    function ClienteTitulos : IModelDAOCustom;
    function ClienteTotalCompras : IModelDAOCustom;
    function CombustivelVeiculo : IModelDAOCustom;
    function Competencia : IModelDAOCustom;
    function CondicaoPagto : IModelDAOCustom;
    function CondicaoPagtoForma : IModelDAOCustom;
    function CondicaoPagtoView : IModelDAOCustom;
    function ConfigSystem : IModelDAOCustom;
    function ConfiguracaoEmpresa : IModelDAOCustom;
    function ContaAPagar : IModelDAOCustom;
    function ContaAReceber : IModelDAOCustom;
    function ContaCorrente : IModelDAOCustom;
    function ContaCorrenteView : IModelDAOCustom;
    function Contrato : IModelDAOCustom;
    function ContratoItem : IModelDAOCustom;
    function ContratoNotas : IModelDAOCustom;
    function CorVeiculo : IModelDAOCustom;
    function CotacaoCompra : IModelDAOCustom;
    function CotacaoCompraItens : IModelDAOCustom;
    function CotacaoCompraFornecedores : IModelDAOCustom;
    function CotacaoCompraFornecedorItens : IModelDAOCustom;
    function CST : IModelDAOCustom;
    function Distrito : IModelDAOCustom;
    function Empresa : IModelDAOCustom;
    function EmpresaView : IModelDAOCustom;
    function Entrada : IModelDAOCustom;
    function EntradaDevolucao : IModelDAOCustom;
    function EntradaLoteProduto : IModelDAOCustom;
    function EntradaProduto : IModelDAOCustom;
    function Estado : IModelDAOCustom;
    function FabricanteProduto : IModelDAOCustom;
    function FormaDevolucao : IModelDAOCustom;
    function FormaPagto : IModelDAOCustom;
    function FormaPagtoContaCorrente : IModelDAOCustom;
    function FormaPagtoNFCEView : IModelDAOCustom;
    function Fornecedor : IModelDAOCustom;
    function FornecedorProduto : IModelDAOCustom;
    function GrupoFornecedor : IModelDAOCustom;
    function GrupoProduto : IModelDAOCustom;
    function IBPT : IModelDAOCustom;
    function ItensAutorizadosParaEntrada : IModelDAOCustom;
    function LayoutRemessaBancoView : IModelDAOCustom;
    function Logradouro : IModelDAOCustom;
    function LogTransacao : IModelDAOCustom;
    function LoteProduto : IModelDAOCustom;
    function ModeloCupomFiscalView : IModelDAOCustom;
    function NFeEnviada : IModelDAOCustom;
    function NFeImportada : IModelDAOCustom;
    function NivelIBPT  : IModelDAOCustom;
    function OrigemProdutoView : IModelDAOCustom;
    function Pagamento : IModelDAOCustom;
    function Perfil : IModelDAOCustom;
    function PerfilParaCopia : IModelDAOCustom;
    function PerfilPermissao : IModelDAOCustom;
    function PlanoConta : IModelDAOCustom;
    function PlanoContaNivel : IModelDAOCustom;
    function PlanoContaTipo : IModelDAOCustom;
    function Produto : IModelDAOCustom;
    function ProdutoAlmoxarifado : IModelDAOCustom;
    function ProdutoAlmoxarifadoReservado : IModelDAOCustom;
    function Promocao : IModelDAOCustom;
    function PromocaoProduto : IModelDAOCustom;
    function Recebimento : IModelDAOCustom;
    function RequisicaoAlmoxarifado : IModelDAOCustom;
    function RequisicaoAlmoxarifadoProduto : IModelDAOCustom;
    function RequisicaoAlmoxarifadoProdutoReserva : IModelDAOCustom;
    function RequisicaoCompra : IModelDAOCustom;
    function RequisicaoCompraProdutoServico : IModelDAOCustom;
    function Rotina : IModelDAOCustom;
    function RotinaMenu : IModelDAOCustom;
    function RotinaSubMenu : IModelDAOCustom;
    function SecaoProduto : IModelDAOCustom;
    function Segmento : IModelDAOCustom;
    function SolicitacaoCompra : IModelDAOCustom;
    function SolicitacaoCompraProdutoServico : IModelDAOCustom;
    function TabelaIBPT : IModelDAOCustom;
    function TipoAliquotaView : IModelDAOCustom;
    function TipoAutorizacaoView : IModelDAOCustom;
    function TipoCNPJView : IModelDAOCustom;
    function TipoComissaoView : IModelDAOCustom;
    function TipoContratoView : IModelDAOCustom;
    function TipoCotacaoView : IModelDAOCustom;
    function TipoChequeView : IModelDAOCustom;
    function TipoDescontoView : IModelDAOCustom;
    function TipoDespesa : IModelDAOCustom;
    function TipoDespesaPlanoConta : IModelDAOCustom;
    function TipoDocumentoEntradaView : IModelDAOCustom;
    function TipoEntradaView : IModelDAOCustom;
    function TipoLogradouro : IModelDAOCustom;
    function TipoProduto : IModelDAOCustom;
    function TipoReceita : IModelDAOCustom;
    function TipoReceitaPlanoConta : IModelDAOCustom;
    function TipoRegimeView : IModelDAOCustom;
    function TipoRequisicaoAlmoxView : IModelDAOCustom;
    function TipoRequisicaoView : IModelDAOCustom;
    function TipoSolicitacaoView : IModelDAOCustom;
    function TipoTributacao : IModelDAOCustom;
    function TipoVeiculo : IModelDAOCustom;
    function Transportadora : IModelDAOCustom;
    function UF      : IModelDAOCustom;
    function Usuario : IModelDAOCustom;
    function UnidadeProduto : IModelDAOCustom;
    function Vendedor : IModelDAOCustom;
    function XML_NFeEnviada : IModelDAOCustom;
    function XML_NFeImportada : IModelDAOCustom;
  end;

implementation

end.
