unit Controller.Interfaces;

interface

uses
  Model.Usuario;

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

implementation

end.
