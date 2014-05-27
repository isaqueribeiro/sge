unit UBaseObject;

interface

uses SysUtils, Windows, Classes, UObserverInterface;

type

  TBaseObject = class(TInterfacedObject, IObservable)  // Observado
  private
    FObservers: TInterfaceList;
    FIDGuid: String;
    FMessageBaseObject: String;
    procedure SetID(const Value: String);
    procedure SetMessageBaseObject(const Value: String);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure addObserver(Observer: IObserver);
    procedure removeObserver(Observer: IObserver);
    procedure Notify; overload;
    procedure Notify(sMessage: string); overload;
  //published
    property IDGuid: String read FIDGuid write SetID;
    property MessageBaseObject: String read FMessageBaseObject write SetMessageBaseObject;
  end;

implementation

{ TBaseObject }

procedure TBaseObject.addObserver(Observer: IObserver);
var
  I : Integer;
begin
  I := FObservers.IndexOf(Observer);
  if (I < 0) then
    FObservers.Add(Observer);
end;

constructor TBaseObject.Create;
var
  gID : TGUID;
begin
  FObservers := TInterfaceList.Create;
  if CreateGUID(gID) = S_OK then
    FIDGuid := GUIDToString(gID);
end;

destructor TBaseObject.Destroy;
begin
  FreeAndNil(FObservers);
  inherited;
end;

procedure TBaseObject.Notify;
var
  I : Integer;
  Observer : IInterface;
begin
  for I := 0 to FObservers.Count - 1 do
  begin
    Observer := FObservers.Items[I];
    IObserver(Observer).Update(Self);
  end;
end;

procedure TBaseObject.Notify(sMessage: string);
var
  I : Integer;
  Observer: IInterface;
begin
  Self.FMessageBaseObject := sMessage;
  for I := 0 to FObservers.Count - 1 do
  begin
    Observer := FObservers.Items[I];
    IObserver(Observer).Update(Self, Self.FMessageBaseObject);
  end;
end;

procedure TBaseObject.removeObserver(Observer: IObserver);
var
  I : Integer;
begin
  I := FObservers.IndexOf(Observer);
  if (I > - 1) then
    FObservers.Remove(Observer);
end;

procedure TBaseObject.SetID(const Value: String);
begin
  FIDGuid := Value;
end;

procedure TBaseObject.SetMessageBaseObject(const Value: String);
begin
  FMessageBaseObject := Trim(Value);
end;

end.
