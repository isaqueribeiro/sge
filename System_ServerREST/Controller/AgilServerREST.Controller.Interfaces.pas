unit AgilServerREST.Controller.Interfaces;

interface

type
  IControllerConfiguracao<T> = interface
    ['{7B97278B-ECEA-408E-8BD4-FED57C3A20F3}']
    function Load : IControllerConfiguracao<T>;
    function Entity : T;
  end;

implementation

end.
