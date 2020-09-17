unit View.Esmaecer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TViewEsmaecer = class(TForm)
    procedure FormCreate(Sender: TObject);
  strict private
    class var _instance : TViewEsmaecer;
  private
    { Private declarations }
  public
    { Public declarations }
    class function GetInstance(const AOnwer : TComponent) : TViewEsmaecer;
  end;

implementation

{$R *.dfm}

{ TViewEsmaecer }

procedure TViewEsmaecer.FormCreate(Sender: TObject);
begin
  Self.Height := Screen.Height - 48;
  Self.Width  := Screen.Width;
  Self.Top    := 0;
  Self.Left   := 0;
end;

class function TViewEsmaecer.GetInstance(const AOnwer: TComponent): TViewEsmaecer;
begin
  if not Assigned(_instance) then
    _instance := TViewEsmaecer.Create(AOnwer);

  Result := _instance;
end;

end.
