unit Service.InputQuery;

interface

uses
  System.Classes, Interfaces.InputQuery, View.InputQuery;

type
  TServiceInputQuery = class
    private
      FView : IViewInputQuery;
      class procedure EventoOnKeyPress (Sender: TObject; var Key: Char);
    public
      constructor Create(AOwner : TComponent);
      destructor Destroy; override;

      class function InputQuery(const AOwner : TComponent; aCaption, aLabel : String;
        var aPrompt : String) : Boolean; overload;
      class function InputQuery(const AOwner : TComponent; aCaption, aLabel : String;
        var aPrompt : Integer) : Boolean; overload;
  end;

implementation

{ TServiceInputQuery }

constructor TServiceInputQuery.Create(AOwner: TComponent);
begin
  FView := TViewInputQuery.New(AOwner);
end;

destructor TServiceInputQuery.Destroy;
begin
  inherited;
end;

class procedure TServiceInputQuery.EventoOnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

class function TServiceInputQuery.InputQuery(const AOwner: TComponent; aCaption, aLabel : String;
  var aPrompt : String): Boolean;
begin
  Result := TServiceInputQuery
    .Create(AOwner)
    .FView
      .CaptionForm(aCaption)
      .LabelPrompt(aLabel)
      .AlignmentPrompt(TAlignment.taLeftJustify)
      .ShowForm(aPrompt);
end;

class function TServiceInputQuery.InputQuery(const AOwner: TComponent; aCaption, aLabel : String;
  var aPrompt : Integer): Boolean;
begin
  Result := TServiceInputQuery
    .Create(AOwner)
    .FView
      .CaptionForm(aCaption)
      .LabelPrompt(aLabel)
      .AlignmentPrompt(TAlignment.taRightJustify)
      .ProcedureValidationPrompt( EventoOnKeyPress )
      .ShowForm(aPrompt);
end;

end.
