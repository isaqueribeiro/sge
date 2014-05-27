unit FormFactoryU;

interface

uses Classes, Forms;

type
  TFormFactory = class
  private
    FList: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    function FormFactory: TFormFactory;
    function CreateForm(const AOnwer : TComponent; const aFormName: string): TForm;
    procedure RegisterForm(const aFormName: string; aFormClass: TComponentClass);
end;

var
  _FormFactory: TFormFactory;

implementation

constructor TFormFactory.Create;
begin
  inherited Create;
  FList := TStringList.Create;
end;

destructor TFormFactory.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFormFactory.CreateForm(const AOnwer : TComponent; const aFormName: string): TForm;
var
i: Integer;
begin
  i := FList.IndexOf(aFormName);
  Assert(i <> -1, 'Formulário ' + aFormName + ' não existe');
  Result := TComponentClass(FList.Objects[i]).Create(AOnwer) as TForm;
end;

function TFormFactory.FormFactory: TFormFactory;
begin
  result := _FormFactory;
end;

procedure TFormFactory.RegisterForm(const aFormName: string;
  aFormClass: TComponentClass);
var
i: Integer;
begin
  i := FList.IndexOf(aFormName);
  if i = -1 then
    FList.AddObject(aFormName, TObject(aFormClass));
end;

initialization
  _FormFactory := TFormFactory.Create;

finalization
  _FormFactory.Free;

end.







