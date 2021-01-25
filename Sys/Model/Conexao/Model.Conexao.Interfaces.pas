unit Model.Conexao.Interfaces;

interface

uses
  Data.DB, System.IniFiles, System.Classes;

type
  IModelConexao = interface
    ['{CD3EA8C2-2442-4E5E-9714-637B3D5D74AF}']

    function Configurar(AConfiguracoes : TIniFile) : IModelConexao;
    function Configuracoes : TIniFile;
    function Conexao : TCustomConnection;
    function Transacao(Value : TComponent) : IModelConexao; overload;
    function Transacao : TComponent; overload;
  end;

implementation

end.
