unit SGE.Model.Factory;

interface

uses
  SGE.Model.Interacao.DataSet, SGE.Model.Conexao.DataSet;

type
  TModelConexaoFactory = class
    private
    public
      class function DataSet : IModelConexaoDataSet;
  end;

implementation

{ TModelConexaoFactory }

class function TModelConexaoFactory.DataSet: IModelConexaoDataSet;
begin
  Result := TModelConexaoDataSet.Create(nil);
end;

end.
