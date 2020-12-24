unit SGE.Model.Interacao.DataSet;

interface

uses
  System.Classes, Data.DB, FireDAC.Comp.Client;

type
  IModelConexaoDataSet = interface
    ['{1A14B67C-BD90-4491-BF6B-4909F54C371F}']

    procedure SelectSQL(ASQL : TStrings);
    procedure FetchRowSQL(ASQL : TStrings);
    procedure InsertSQL(ASQL : TStrings);

    function DataSet : TFDQuery;
  end;

implementation

end.
