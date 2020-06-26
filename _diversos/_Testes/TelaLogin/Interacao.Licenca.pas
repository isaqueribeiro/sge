unit Interacao.Licenca;

interface

uses
  System.SysUtils, Interacao.Conexao;

type
  ILicencaModel = interface
    ['{09BA0F3D-B77C-48D2-9BBA-73F48DDC9DD2}']
    function Empresa(Value : String) : ILicencaModel; overload;
    function Empresa : String; overload;

    function NomeFantasia(Value : String) : ILicencaModel; overload;
    function NomeFantasia : String; overload;

    function CNPJ(Value : String) : ILicencaModel; overload;
    function CNPJ : String; overload;

    function Endereco(Value : String) : ILicencaModel; overload;
    function Endereco : String; overload;

    function Bairro(Value : String) : ILicencaModel; overload;
    function Bairro : String; overload;

    function Cidade(Value : String) : ILicencaModel; overload;
    function Cidade : String; overload;

    function UF(Value : String) : ILicencaModel; overload;
    function UF : String; overload;

    function CEP(Value : String) : ILicencaModel; overload;
    function CEP : String; overload;

    function Competencia(Value : Integer) : ILicencaModel; overload;
    function Competencia : Integer; overload;

    function DataBloqueio(Value : TDateTime) : ILicencaModel; overload;
    function DataBloqueio : TDateTime; overload;

    function UsarSGE(Value : Boolean) : ILicencaModel; overload;
    function UsarSGE : Boolean; overload;

    function UsarSGI(Value : Boolean) : ILicencaModel; overload;
    function UsarSGI : Boolean; overload;

    function UsarSGF(Value : Boolean) : ILicencaModel; overload;
    function UsarSGF : Boolean; overload;

    function UsarSGO(Value : Boolean) : ILicencaModel; overload;
    function UsarSGO : Boolean; overload;
  end;

  ILicenca = interface
    ['{2C9ECC1B-2888-4C99-A01F-0A600F796617}']
    function Carregar(aConexao : IConexao) : ILicenca; overload;
    function Carregar(aFileName : TFileName) : ILicenca; overload;
    function Carregar : ILicenca; overload;

    function Empresa : String;
    function NomeFantasia : String;
    function CNPJ : String;
  end;

implementation

end.
