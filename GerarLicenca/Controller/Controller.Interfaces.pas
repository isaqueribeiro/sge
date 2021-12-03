unit Controller.Interfaces;

interface

uses
  Data.DB,
  Datasnap.DBClient,
  Model.Usuario,
  Model.Cliente;

type
  IControllerUsuario<T : class> = interface
    ['{0BF0B781-30A1-463B-AA56-B6CBB92C02EF}']
    function Entity : TUsuario<T>;
    function ApiKey(Value : String) : IControllerUsuario<T>;
    function Auth : IControllerUsuario<T>;
    function RegisterAccount : IControllerUsuario<T>;
    function AccountRegistered : IControllerUsuario<T>;
    function Expired : TDateTime;
    function Error : String;

    procedure RefreshToken;
  end;

  IControllerCliente<T : class> = interface
    ['{0FA321D3-785E-4A87-949E-89C06552903A}']
    function DataSet(Value : TClientDataSet) : IControllerCliente<T>; overload;
    function DataSet : TClientDataSet; overload;
    function Entity : TCliente<T>;
    function LoadDataSet(aTokenID : String) : IControllerCliente<T>; overload;
    function LoadDataSet(aTokenID : String; aClientDataSet : TClientDataSet) : IControllerCliente<T>; overload;
    function Save(aTokenID : String) : IControllerCliente<T>;
    function Error : String;
  end;

implementation

end.
