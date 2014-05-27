unit UObserverInterface;

interface

  type
    IObservable = interface;                        // Observado

    IObserver = interface                           // Observador
      ['{6C4A8799-0B9F-4C35-9529-109B1C2D2787}']
      procedure Update(Observeble: IObservable); overload;
      procedure Update(Observeble: IObservable; sMessage: string); overload;
    end;

    IObservable = interface                         // Observado
      ['{3DCF3303-33F7-4C9E-8AF2-5E031341C8B9}']
      procedure addObserver(Observer: IObserver);
      procedure removeObserver(Observer: IObserver);
      procedure Notify; overload;
      procedure Notify(sMessage: string); overload;
    end;

implementation

end.
