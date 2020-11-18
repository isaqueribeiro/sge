unit Classe.Gerenciador.View;

interface

uses
  Interacao.Gerenciador.View,
  System.Classes, Vcl.ExtCtrls, Vcl.Forms, System.Generics.Collections;

type
  TGerenciadorView = class(TInterfacedObject, IGerenciadorView)
    strict private
      class var _instance : IGerenciadorView;
    private
      FViewIndex : TForm;
      FListClass : TObjectDictionary<String, TObject>;
      FListViews : TObjectDictionary<String, TForm>;
    public
      constructor Create;
      destructor Destroy; override;

      class function New : IGerenciadorView;

      function RegistrarView(Key : String; ComponentClass : TComponentClass) : IGerenciadorView;
      function RemoverView(Key : String) : IGerenciadorView;
      function InstanciarView(AOnwer : TComponent; Key : String; Parent : TPanel; const Index : Boolean = False) : IGerenciadorView;
      function ExibirView(Key : String) : TForm;
      function ExibirViewIndex : TForm;
  end;

var
  _GerenciadorView : IGerenciadorView;

implementation

{ TGerenciadorView }

constructor TGerenciadorView.Create;
begin
  FListClass := TObjectDictionary<String, TObject>.Create; // Armazenar registro das classes de formulários do projeto
  FListViews := TObjectDictionary<String, TForm>.Create;   // Armazenar formulários instanciados
end;

destructor TGerenciadorView.Destroy;
begin
  FListClass.DisposeOf;
  FListViews.DisposeOf;
  inherited;
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
  if FListClass.TryGetValue(Key, TObject(aClassName)) then
  begin
    if not FListViews.TryGetValue(Key, aForm) then
    begin
      aForm := TComponentClass(aClassName).Create(AOnwer) as TForm;
      aForm.Name := Key;
      FListViews.Add(Key, aForm);
    end;

    aForm.Parent := Parent;
    aForm.Show;

    if Index then
      FViewIndex := aForm;
  end;
end;

class function TGerenciadorView.New: IGerenciadorView;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TGerenciadorView.RegistrarView(Key: String; ComponentClass : TComponentClass): IGerenciadorView;
begin
  Result := Self;
  if not FListClass.ContainsKey(Key) then
    FListClass.Add(Key, TObject(ComponentClass));
end;

function TGerenciadorView.RemoverView(Key: String): IGerenciadorView;
var
  aForm : TForm;
begin
  Result := Self;

  if FListClass.ContainsKey(Key) then
    FListClass.Remove(Key);

  if FListViews.TryGetValue(Key, aForm) then
  begin
    aForm.DisposeOf;
    FListViews.Remove(Key);
  end;

  FListClass.TrimExcess;
  FListViews.TrimExcess;
end;

initialization
  _GerenciadorView := TGerenciadorView.New;

end.
