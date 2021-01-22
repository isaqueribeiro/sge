unit Classe.Gerenciador.View;

interface

uses
  Interacao.Gerenciador.View,
  System.Classes,
  System.Generics.Collections,
  Vcl.ExtCtrls,
  Vcl.Forms;

type
  TGerenciadorView = class(TInterfacedObject, IGerenciadorView)
    strict private
      class var _instance : IGerenciadorView;
    private
      FViewIndex : TForm;
      FListEvents : TObjectDictionary<String, TEventNotifity>;
      FListClass  : TObjectDictionary<String, TComponentClass>;
      FListViews  : TObjectDictionary<String, TForm>;
    public
      constructor Create;
      destructor Destroy; override;

      class function GetInstance : IGerenciadorView;

      function RegistrarView(Key : String; ComponentClass : TComponentClass) : IGerenciadorView;
      function RemoverView(Key : String) : IGerenciadorView;
      function RemoverViewAll() : IGerenciadorView;
      function InstanciarView(AOnwer : TComponent; Key : String; Parent : TPanel; const Index : Boolean = True) : IGerenciadorView;
      function ExibirView(Key : String) : TForm;
      function ExibirViewIndex : TForm;

      function RegistrarEvento(Key : String; AEvent : TEventNotifity) : IGerenciadorView;
      function ExecuteEvento(Key : String) : Boolean;
  end;

var
  _GerenciadorView : IGerenciadorView;

implementation

{ TGerenciadorView }

constructor TGerenciadorView.Create;
begin
  FListEvents := TObjectDictionary<String, TEventNotifity>.Create;  // Armazenar procedimentos de notificação de views
  FListClass  := TObjectDictionary<String, TComponentClass>.Create; // Armazenar registro das classes de formulários do projeto
  FListViews  := TObjectDictionary<String, TForm>.Create;           // Armazenar formulários instanciados
end;

destructor TGerenciadorView.Destroy;
begin
  FListEvents.DisposeOf;
  FListClass.DisposeOf;
  FListViews.DisposeOf;
  inherited;
end;

function TGerenciadorView.ExecuteEvento(Key: String): Boolean;
var
  aRetorno : Boolean;
  aEvento  : TEventNotifity;
begin
  aRetorno := False;
  try
    if FListEvents.TryGetValue(Key, aEvento) then
    begin
      aEvento(nil);

      FListEvents.Remove(Key);
      FListEvents.TrimExcess;

      aRetorno := True;
    end;
  finally
    Result := aRetorno;
  end;
end;

function TGerenciadorView.ExibirView(Key: String): TForm;
begin
  FListViews.TryGetValue(Key, Result);
end;

function TGerenciadorView.ExibirViewIndex: TForm;
begin
  Result := FViewIndex;
end;

function TGerenciadorView.InstanciarView(AOnwer : TComponent; Key: String; Parent: TPanel;
  const Index: Boolean): IGerenciadorView;
var
  aClassName : TComponentClass;
  aForm : TForm;
begin
  Result := Self;
  if FListClass.TryGetValue(Key, aClassName) then
  begin
    if not FListViews.TryGetValue(Key, aForm) then
    begin
      aForm := TComponentClass(aClassName).Create(AOnwer) as TForm;
      aForm.Name := Key;

      if Assigned(Parent) then
      begin
        // Tramamento para abrir o Form dentro do Panel na posição correta
        aForm.Position    := TPosition.poDefault;
        aForm.BorderStyle := TFormBorderStyle.bsNone;
        aForm.WindowState := TWindowState.wsMaximized;

        aForm.Parent := Parent;
      end;

      FListViews.Add(Key, aForm);

      if Index then
        if Assigned(FViewIndex) and Assigned(Parent) then
          TForm(FViewIndex).Close;
    end;

    aForm.Show;

    if Index then
      FViewIndex := aForm;
  end;
end;

class function TGerenciadorView.GetInstance : IGerenciadorView;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TGerenciadorView.RegistrarEvento(Key: String; AEvent: TEventNotifity): IGerenciadorView;
begin
  Result := Self;
  if not FListEvents.ContainsKey(Key) then
    FListEvents.Add(Key, AEvent);
end;

function TGerenciadorView.RegistrarView(Key: String; ComponentClass : TComponentClass): IGerenciadorView;
begin
  Result := Self;
  if not FListClass.ContainsKey(Key) then
    FListClass.Add(Key, ComponentClass);
end;

function TGerenciadorView.RemoverView(Key: String): IGerenciadorView;
var
  aForm : TForm;
begin
  Result := Self;

  if FListViews.TryGetValue(Key, aForm) then
  begin
    aForm.DisposeOf;
    FListViews.Remove(Key);
  end;

  FListViews.TrimExcess;
end;

function TGerenciadorView.RemoverViewAll: IGerenciadorView;
var
  aKey : String;
begin
  Result := Self;
  for aKey in FListViews.Keys do
    Self.RemoverView(aKey);
end;

initialization
  _GerenciadorView := TGerenciadorView.GetInstance();

end.
