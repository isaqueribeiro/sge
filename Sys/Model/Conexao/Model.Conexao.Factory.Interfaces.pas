unit Model.Conexao.Factory.Interfaces;

interface

uses
  Model.Conexao.Interfaces;

type
  IModelConexaoFactory = interface
    ['{D93E9A60-A9B9-436D-BF6F-A8F92C35E1F1}']
    function Conexao : IModelConexao;
  end;

implementation

end.
