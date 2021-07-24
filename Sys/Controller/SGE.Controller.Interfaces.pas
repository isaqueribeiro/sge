unit SGE.Controller.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces;

type
  IController = interface
    ['{7BF1786A-5EBC-4101-943D-EA981E4E887F}']
    function DAO : IModelDAOCustom;
  end;

  IControllerCustom = interface(IController)
    ['{EF078F48-0F46-48FF-B6A2-B2926E490606}']
  end;

  IControllerFactory = interface
    ['{52DB68E4-A6DE-428B-867A-F0EE203E7CCA}']
    function UF : IControllerCustom;
    function Cidade   : IControllerCustom;
    function Distrito : IControllerCustom;
    function Bairro   : IControllerCustom;
    function TipoLogradouro : IControllerCustom;
    function Logradouro : IControllerCustom;
  end;

implementation

end.
