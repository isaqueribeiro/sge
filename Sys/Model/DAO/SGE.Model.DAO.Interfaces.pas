unit SGE.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type
  IModelDAO = interface
    ['{2CE64058-14C2-4585-9FCA-6EACD931AA08}']
    function DataSet   : TDataSet;
    function SelectSQL : String;

    procedure ApplyUpdates;
    procedure CommitUpdates;
    procedure RefreshRecord;

    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

  IModelDAOCustom = interface(IModelDAO)
    ['{08EF0520-4A95-4194-B5B7-AFE88A77E4DD}']
  end;

implementation

end.
