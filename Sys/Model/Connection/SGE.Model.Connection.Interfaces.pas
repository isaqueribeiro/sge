unit SGE.Model.Connection.Interfaces;

interface

uses
  Data.DB,
  SGE.Model.Connection.Component.SQL;

type
  IConnection<T : class> = interface
    ['{5A9F985A-8901-4220-B4F3-3F423B43C137}']
    function TableName(aTableName : String) : IConnection<T>; overload;
    function TableName : String; overload;
    function GeneratorName(aGeneratorName : String) : IConnection<T>; overload;
    function GeneratorName : String; overload;
    function KeyFields(aKeyFields : String) : IConnection<T>; overload;
    function KeyFields : String; overload;
    function AutoIncFields(aAutoIncFields : String) : IConnection<T>; overload;
    function AutoIncFields : String; overload;
    function SQL : TSQL<T>;
    function ParamByName(aParamName, aParamValue : String) : IConnection<T>; overload;
    function ParamByName(aParamName : String; aParamValue : Integer) : IConnection<T>; overload;
    function ParamByName(aParamName : String; aParamValue : Int64) : IConnection<T>; overload;
    function Where(aExpressionWhere : String) : IConnection<T>; overload;
    function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IConnection<T>; overload;
    function Where(aFieldName : String; aFielValue : Integer) : IConnection<T>; overload;
    function Where(aFieldName : String; aFielValue : Int64) : IConnection<T>; overload;
    function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IConnection<T>;
    function OpenEmpty : IConnection<T>;
    function CloseEmpty : IConnection<T>;
    function OpenOrExecute : Boolean;
    function DataSet : TDataSet;

    procedure Open;
    procedure ExecSQL;
    procedure ApplyUpdates;
    procedure CommitUpdates;

    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;

    procedure RefreshRecord;
    procedure SetupKeyFields;
    procedure UpdateGenerator(const aExpressionWhere : String = '');

    function NewID : Variant;
  end;

implementation

end.
