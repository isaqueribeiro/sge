unit SGE.Model.Connection.Interfaces;

interface

uses
  Data.DB,
  SGE.Model.Connection.Component.SQL;

type
  IConnection<T : class> = interface
    ['{5A9F985A-8901-4220-B4F3-3F423B43C137}']
    function TableName(aTableName : String) : IConnection<T>;
    function SQL : TSQL<T>;
    function ParamByName(aParamName, aParamValue : String) : IConnection<T>; overload;
    function ParamByName(aParamName : String; aParamValue : Integer) : IConnection<T>; overload;
    function ParamByName(aParamName : String; aParamValue : Int64) : IConnection<T>; overload;
    function OpenOrExecute : Boolean;
    function DataSet : TDataSet;

    procedure Open;
    procedure ExecSQL;
    procedure Commit;
  end;

implementation

end.
