unit Interacao.Conexao;

interface

Uses
  System.SysUtils, Firedac.Comp.Client, Firedac.DApt;

type
  IConexao = interface
    ['{99DB6D77-958B-4B59-8C74-2F7FC8DFF107}']
    function Configuracao(const aFileName : TFileName) : IConexao;

    function Connection(const Value : TFDConnection) : IConexao; overload;
    function Connection : TFDConnection; overload;

    function Transaction(const Value : TFDTransaction) : IConexao; overload;
    function Transaction : TFDTransaction; overload;
  end;

implementation

end.
