unit SGE.Model.DAO.CST;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOCST = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

{ TModelDAOCST }

constructor TModelDAOCST.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.codigo')
        .Add('  , c.descricao_full  as descricao')
        .Add('from GET_CST_NORMAL c')
        .Add('order by ')
        .Add('    c.descricao_full')
      .&End
      .Open;

  FConn.Query.Close;
end;

function TModelDAOCST.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn.Query.Open;
//  FConn
//    .Query
//      .SQL
//        .Clear
//        .Add('Select')
//        .Add('    c.codigo')
//        .Add('  , c.descricao_full  as descricao')
//        .Add('from GET_CST_NORMAL c')
//        .Add('order by ')
//        .Add('    c.descricao_full')
//      .&End
//      .WhereAdditional(EmptyStr)
//      .Open;
end;

destructor TModelDAOCST.Destroy;
begin
  inherited;
end;

class function TModelDAOCST.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
