unit SGE.Model.DAO.Interfaces;

interface

uses
  System.Classes,
  Data.DB,
  Interacao.Usuario,
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
    function OrderBy(aFieldName : String) : IModelDAO; overload;

    function OpenEmpty  : IModelDAO;
    function CloseEmpty : IModelDAO;
    function Close      : IModelDAO;

    procedure Open;

    procedure ClearWhere;
    procedure ApplyUpdates;
    procedure CommitUpdates;
    procedure RefreshRecord;
    procedure UpdateGenerator(const aExpressionWhere : String = '');
    procedure ExecuteScriptSQL(aScript : String);

    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

  IModelDAOCustom = interface(IModelDAO)
    ['{08EF0520-4A95-4194-B5B7-AFE88A77E4DD}']
    function CreateLookupComboBoxList : IModelDAOCustom;
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
    function Bairro   : IModelDAOCustom;
    function Banco : IModelDAOCustom;
    function BancoFebrabanView : IModelDAOCustom;
    function Busca : IModelDAOCustom;
    function CentroCusto : IModelDAOCustom;
    function CentroCustoEmpresa : IModelDAOCustom;
    function CFOP : IModelDAOCustom;
    function Cidade   : IModelDAOCustom;
    function ClasseDespesa : IModelDAOCustom;
    function ClasseReceita : IModelDAOCustom;
    function Cliente : IModelDAOCustom;
    function ClienteEstoque : IModelDAOCustom;
    function ClienteTitulos : IModelDAOCustom;
    function ClienteTotalCompras : IModelDAOCustom;
    function CombustivelVeiculo : IModelDAOCustom;
    function CondicaoPagto : IModelDAOCustom;
    function CondicaoPagtoForma : IModelDAOCustom;
    function CondicaoPagtoView : IModelDAOCustom;
    function ConfiguracaoEmpresa : IModelDAOCustom;
    function ContaCorrente : IModelDAOCustom;
    function ContaCorrenteView : IModelDAOCustom;
    function CorVeiculo : IModelDAOCustom;
    function CST : IModelDAOCustom;
    function Distrito : IModelDAOCustom;
    function Empresa : IModelDAOCustom;
    function EmpresaView : IModelDAOCustom;
    function Entrada : IModelDAOCustom;
    function EntradaProduto : IModelDAOCustom;
    function FabricanteProduto : IModelDAOCustom;
    function FormaPagto : IModelDAOCustom;
    function FormaPagtoContaCorrente : IModelDAOCustom;
    function FormaPagtoNFCEView : IModelDAOCustom;
    function Fornecedor : IModelDAOCustom;
    function GrupoFornecedor : IModelDAOCustom;
    function GrupoProduto : IModelDAOCustom;
    function IBPT : IModelDAOCustom;
    function LayoutRemessaBancoView : IModelDAOCustom;
    function Logradouro : IModelDAOCustom;
    function NivelIBPT : IModelDAOCustom;
    function OrigemProdutoView : IModelDAOCustom;
    function PlanoConta : IModelDAOCustom;
    function PlanoContaNivel : IModelDAOCustom;
    function PlanoContaTipo : IModelDAOCustom;
    function Produto : IModelDAOCustom;
    function Promocao : IModelDAOCustom;
    function PromocaoProduto : IModelDAOCustom;
    function SecaoProduto : IModelDAOCustom;
    function Segmento : IModelDAOCustom;
    function TabelaIBPT : IModelDAOCustom;
    function TipoAliquotaView : IModelDAOCustom;
    function TipoCNPJView : IModelDAOCustom;
    function TipoComissaoView : IModelDAOCustom;
    function TipoDespesa : IModelDAOCustom;
    function TipoDespesaPlanoConta : IModelDAOCustom;
    function TipoDocumentoEntradaView : IModelDAOCustom;
    function TipoEntradaView : IModelDAOCustom;
    function TipoLogradouro : IModelDAOCustom;
    function TipoProduto : IModelDAOCustom;
    function TipoReceita : IModelDAOCustom;
    function TipoReceitaPlanoConta : IModelDAOCustom;
    function TipoRegimeView : IModelDAOCustom;
    function TipoTributacao : IModelDAOCustom;
    function TipoVeiculo : IModelDAOCustom;
    function UF       : IModelDAOCustom;
    function UnidadeProduto : IModelDAOCustom;
    function Vendedor : IModelDAOCustom;
  end;

implementation

end.
