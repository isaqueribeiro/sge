unit Model.Query.Interfaces;

interface

uses
  Data.DB, System.IniFiles, System.Classes, Model.Conexao.Interfaces;

type
  IModelQuery = interface
    ['{127A6F18-BAA7-4711-AADA-455C26E9C926}']
    function DataSet : TDataSet;
  end;

implementation

end.
