unit SGE.Controller.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces;

type
  IController = interface
    ['{7BF1786A-5EBC-4101-943D-EA981E4E887F}']
  end;

  IControllerCustom = interface(IController)
    ['{EF078F48-0F46-48FF-B6A2-B2926E490606}']
    function DAO : IModelDAOCustom;
  end;

implementation

end.
