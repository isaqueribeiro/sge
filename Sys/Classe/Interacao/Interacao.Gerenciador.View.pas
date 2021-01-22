unit Interacao.Gerenciador.View;

interface

uses
  System.Classes, Vcl.Forms, Vcl.ExtCtrls;

type
  TEventNotifity = procedure (Sender: TObject) of object;

  IGerenciadorView = interface
    ['{F0CC2A0F-E149-4421-B2A3-5DC657064FDE}']
    function RegistrarView(Key : String; ComponentClass : TComponentClass) : IGerenciadorView;
    function RemoverView(Key : String) : IGerenciadorView;
    function RemoverViewAll() : IGerenciadorView;
    function InstanciarView(AOnwer : TComponent; Key : String; Parent : TPanel; const Index : Boolean = False) : IGerenciadorView;
    function ExibirView(Key : String) : TForm;
    function ExibirViewIndex : TForm;

    function RegistrarEvento(Key : String; AEvent : TEventNotifity) : IGerenciadorView;
    function ExecuteEvento(Key : String) : Boolean;
  end;

implementation

end.
