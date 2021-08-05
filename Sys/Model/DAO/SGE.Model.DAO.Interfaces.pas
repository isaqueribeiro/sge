unit SGE.Model.DAO.Interfaces;

interface

uses
  System.Classes,
  Data.DB;

type
//  IConfigureFields = interface;
//
  IModelDAO = interface
    ['{2CE64058-14C2-4585-9FCA-6EACD931AA08}']
    function DataSet   : TDataSet;
//    function ConfigureFields : IConfigureFields;
    function SelectSQL : String;

    function Where(aExpressionWhere : String) : IModelDAO; overload;
    function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
    function Where(aFieldName : String; aFielValue : Integer) : IModelDAO; overload;
    function Where(aFieldName : String; aFielValue : Int64) : IModelDAO; overload;
    function WhereLike(aFieldName, aFielValue : String) : IModelDAO;
    function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO;
    function WhereAdditional(aExpression : String) : IModelDAO; overload;
    function WhereAdditional : String; overload;
    function ParamsByName(aParamsName, aParamsValue : String) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : Integer) : IModelDAO; overload;
    function ParamsByName(aParamsName : String; aParamsValue : Int64) : IModelDAO; overload;
    function OrderBy(aFieldName : String) : IModelDAO; overload;

    function OpenEmpty  : IModelDAO;
    function CloseEmpty : IModelDAO;

    procedure Open;

    procedure Clear;
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
    function UF       : IModelDAOCustom;
    function Cidade   : IModelDAOCustom;
    function Distrito : IModelDAOCustom;
    function Bairro   : IModelDAOCustom;
    function TipoLogradouro : IModelDAOCustom;
    function Logradouro : IModelDAOCustom;
    function CST : IModelDAOCustom;
    function CFOP : IModelDAOCustom;
    function IBPT : IModelDAOCustom;
    function TabelaIBPT : IModelDAOCustom;
    function NivelIBPT : IModelDAOCustom;
    function Empresa : IModelDAOCustom;
    function EmpresaView : IModelDAOCustom;
    function ConfiguracaoEmpresa : IModelDAOCustom;
    function ContaCorrente : IModelDAOCustom;
    function ContaCorrenteView : IModelDAOCustom;
    function FormaPagto : IModelDAOCustom;
    function FormaPagtoContaCorrente : IModelDAOCustom;
    function FormaPagtoNFCEView : IModelDAOCustom;
    function CondicaoPagto : IModelDAOCustom;
    function CondicaoPagtoForma : IModelDAOCustom;
    function CondicaoPagtoView : IModelDAOCustom;
    function PlanoConta : IModelDAOCustom;
    function PlanoContaNivel : IModelDAOCustom;
    function PlanoContaTipo : IModelDAOCustom;
    function TipoReceita : IModelDAOCustom;
    function TipoReceitaPlanoConta : IModelDAOCustom;
    function ClasseReceita : IModelDAOCustom;
    function TipoDespesa : IModelDAOCustom;
    function TipoDespesaPlanoConta : IModelDAOCustom;
    function ClasseDespesa : IModelDAOCustom;
    function CentroCusto : IModelDAOCustom;
    function CentroCustoEmpresa : IModelDAOCustom;
    function Segmento : IModelDAOCustom;
    function TipoRegimeView : IModelDAOCustom;
  end;

implementation

end.
